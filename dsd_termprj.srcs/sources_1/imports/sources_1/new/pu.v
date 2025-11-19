module pu #(
    parameter IN_X_BUF_DATA_WIDTH = 8,			// you should change if you try to design the int8 streamline architecture
    parameter IN_W_BUF_DATA_WIDTH = 8,			// you should change if you try to design the int8 streamline architecture
    parameter OUT_BUF_ADDR_WIDTH = 32,
    parameter OUT_BUF_DATA_WIDTH = 32
)(
    // system interface
    input   wire                            clk,
    input   wire                            rst_n,
    // global controller interface
    output  wire                            prcss_done,
    input   wire [3:0]                      image_idx,
    input   wire                            mux_ctr,
    input   wire                            dsp_enable_i,
    input   wire                            dsp_clear,
    input   wire [1:0]                      layer_num,
    input   wire                            valid,
    input   wire [$clog2(128)-1:0]          local_buf_addr,
    // input data buffer interface
    input   wire [IN_X_BUF_DATA_WIDTH-1:0]  x_buf_data,
    input   wire [IN_W_BUF_DATA_WIDTH-1:0]  w_buf_data,
    // output data buffer interface
    output  wire                            y_buf_wr_en,
    output  wire [OUT_BUF_ADDR_WIDTH-1:0]   y_buf_addr,
    output  wire [OUT_BUF_DATA_WIDTH-1:0]   y_buf_data
);

    reg     [8-1:0]     local_buffer_cal[0:128]; //Storage buffer during layer operation
    reg     [8-1:0]     local_buffer[0:128]; //Save buffer after layer operation ends
    reg                 r_prcss_done;
    reg     [8-1:0]     local_buffer_delay;
    reg     [3:0]       last_pu_dalay;
    reg                 delay_active;
    
    //dsp wire/reg
    wire    [31:0]  dsp_output_o; 
    wire    [8-1:0] dsp_input;
    wire    [8-1:0] last_pu_o;
    wire    [8-1:0] changed_x_buf_data; //Quantized image data
    
    //output buffer signal
    reg     r_y_buf_wen;
    reg     [OUT_BUF_ADDR_WIDTH-1:0]    r_y_buf_addr;
    reg     [OUT_BUF_DATA_WIDTH-1:0]    r_y_buf_data;
    
    // assign output wires to internal regs
    assign  y_buf_data  = r_y_buf_data;
    assign  y_buf_addr  = r_y_buf_addr;
    assign  y_buf_wr_en = r_y_buf_wen;
    assign  prcss_done  = r_prcss_done;
    assign  dsp_input = (mux_ctr)? local_buffer_delay:changed_x_buf_data;
    
    reg     [$clog2(128):0] counter; //inner counter
    integer i;
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            for (i = 0;i<=128;i=i+1) begin
                local_buffer_cal[i] <= 8'b0;
                local_buffer[i]     <= 8'b0;
            end
            r_prcss_done            <= 0;
            counter                 <= 0;
            last_pu_dalay           <= 0;
            delay_active            <= 0;
            {r_y_buf_data, r_y_buf_wen} <= 33'b0;
        end
        else begin
            if(delay_active) begin
                last_pu_dalay <= last_pu_dalay + 1;
                if (last_pu_dalay == 3'd4) begin // delay in last pu model 5clk
                    if (valid) begin
                        counter <= 0;
                        for (i = 0;i<=128;i=i+1 )
                            local_buffer[i] <= local_buffer_cal[i];
                        r_prcss_done <= 1;
                    end
                    else    begin
                        counter <= counter+1;
                        local_buffer_cal[counter] <= last_pu_o;
                        r_prcss_done <= 0;
                    end
                    delay_active <= 0;
                end
            end
            else if (dsp_clear && !valid) begin
                delay_active    <= 1;
                last_pu_dalay   <= 0;

                if(&layer_num) begin
                    r_y_buf_data    <=  dsp_output_o;
                    r_y_buf_wen     <=  1;
                    r_y_buf_addr    <=  (counter + image_idx*10)*4;
                end

            end
            else    {r_y_buf_data, r_y_buf_wen, r_prcss_done} <= 34'b0;

            local_buffer_delay <= local_buffer[local_buf_addr];
        end
    end
    
    //use only one mac module 
    MAC_ver2 my_mac (
        .clk_i(clk),
        .rstn_i(rst_n),
        .clear_i(dsp_clear),
        .dsp_enable_i(dsp_enable_i),
        .dsp_input_i(dsp_input),
        .dsp_weight_i(w_buf_data),
        .dsp_output_o(dsp_output_o)
    );
    
    //ReLU -> Dequantization -> quantization -> rounding -> clip (Synchronous) delay 5clk
    last_pu uut1(.clk(clk), .din_int32(dsp_output_o), .input_scale_q16(get_scale(layer_num)), .dout_int8(last_pu_o));
    //Quantization -> rounding -> clip (Asynchronous)
    post_input uut2(x_buf_data, changed_x_buf_data);
    
    function [31:0] get_scale; //scale selection funtion
        input [1:0] index;
        begin
            case (index)
                2'd0: get_scale = 32'd159; // input_scale*weight_Conv1d_scale/layer1_scale*2^16
                2'd1: get_scale = 32'd640; // layer1_scale*weight_Linear1_scale/layer2_scale*2^16
                2'd2: get_scale = 32'd224; // layer2_scale*weight_Linear2_scale/layer3_scale*2^16
                2'd3: get_scale = 32'h0001_0000; // 1.0*2^16
                default: get_scale = 32'h00000000;
            endcase
        end
    endfunction
	
endmodule