module glbl_ctrl #(
    parameter   BUF_ADDR_WIDTH = 32,
    parameter   input_imeages  = 10,
    //Layer parameter
    parameter   Layer1_col = 1,
    parameter   Layer1_raw = 28,
    parameter   Layer1_number = Layer1_col*Layer1_raw,
    
    parameter   Layer2_col = 128,
    parameter   Layer2_raw = 64,
    parameter   Layer2_number = Layer2_col*Layer2_raw,
    
    parameter   Layer3_col = 64,
    parameter   Layer3_raw =128,
    parameter   Layer3_number = Layer3_col*Layer3_raw,
    
    parameter   Layer4_col = 10,
    parameter   Layer4_raw = 64,
    parameter   Layer4_number = Layer4_col*Layer4_raw
    )(
    input   wire                            clk,
    input   wire                            rst_n,
    input   wire                            start_i,

    output  wire                            done_intr_o,
    output  wire                            done_led_o,
    // x_buffer interface   
    output  wire                            x_buf_en,
    output  wire [BUF_ADDR_WIDTH-1:0]       x_buf_addr,
    // w_buffer interface   
    output  wire                            w_buf_en,
    output  wire [BUF_ADDR_WIDTH-1:0]       w_buf_addr,
    // processing unit interface
    input   wire                            prcss_done,
    output  wire [$clog2(input_imeages)-1:0]image_idx,
    output  wire                            mux_ctr,
    output  wire                            dsp_enable_o,
    output  wire                            dsp_clear,
    output  wire                            valid_o,
    output  wire [1:0]                      layer_num
);  

    // FSM states
    localparam  IDLE        =   4'd0,
                Layer1      =   4'd1, //Layer calculate control address
                end1        =   4'd2, //end states are wait calculate in pu
                Layer2      =   4'd3,
                end2        =   4'd4,
                Layer3      =   4'd5,
                end3        =   4'd6,
                Layer4      =   4'd7,
                end4        =   4'd8,
                done        =   4'd9;

    // FSM state registers
    reg [3:0] ps, ns;

    // Internal registers for outputs
    reg                             r_done_intr, r_done_led; // The end of all processes and the LED signal at that time
    reg [3:0]                       start_1clk; 
    reg [$clog2(128):0]             rowcounter, colcounter; //count row and col number
    reg [$clog2(input_imeages):0]   r_image_idx;    // current input image r_image_idx 1~10    
    // pu control signal
    reg                             r_mux_ctr; // mux 0:image data / 1:local buffer
    reg                             r_dsp_en; //dsp enable signal
    reg                             r_dsp_clear; //dsp clear signal always !r_dsp_en
    reg                             r_valid; //1 layer cycle end signal for pu
    reg [1:0]                       r_layer_num; //present layer number for pu
    
    // BRAM control signal
    reg                             r_x_en, r_w_en; // BRAM enable signal
    reg [BUF_ADDR_WIDTH-1:0]        r_x_add, r_w_add; // address for BRAM
    reg [12:0]                      r_x_add_pipeline1, r_x_add_pipeline2;
    
    // assign output wires to internal regs
    assign  x_buf_en        =   r_x_en;
    assign  x_buf_addr      =   r_x_add;
    assign  w_buf_en        =   r_w_en;
    assign  w_buf_addr      =   r_w_add;
    assign  done_intr_o     =   r_done_intr;
    assign  done_led_o      =   r_done_led;
    assign  dsp_enable_o    =   r_dsp_en;
    assign  mux_ctr         =   r_mux_ctr;
    assign  dsp_clear       =   r_dsp_clear;
    assign  image_idx       =   r_image_idx;
    assign  valid_o         =   r_valid;
    assign  layer_num       =   r_layer_num;

    //ns change case
    always @(*) begin
        case (ps)
            IDLE        :   ns  <=  (start_i)? Layer1:IDLE;                     //0
            //IDLE
            Layer1      :   ns  <=  (colcounter == 64)? end1:Layer1;            //1
            //Layer1 active
            end1        :   ns  <=  (prcss_done)? Layer2:end1;                  //2
            //Layer1 end 
            Layer2      :   ns  <=  (colcounter == 128)? end2:Layer2;           //3
            //Layer2 active
            end2        :   ns  <=  (prcss_done)? Layer3:end2;                  //4
            //Layer2 end
            Layer3      :   ns  <=  (colcounter == 64)? end3:Layer3;            //5
            //Layer3 active
            end3        :   ns  <=  (prcss_done)? Layer4:end3;                  //6
            //Layer3 end
            Layer4      :   ns  <=  (colcounter == 10)? end4:Layer4;            //7
            //Layer4 active
            end4        :   ns  <=  (r_image_idx == input_imeages-1)?
                                    done:(prcss_done)?Layer1:end4;              //8
            //Layer4 end
            done        : begin end                                             //9
            //done
            default     :   ns  <=  (start_i)? Layer1:IDLE;
        endcase
    end

    //p->n state
    always @(posedge clk or negedge rst_n) begin 
        if (!rst_n)
            ps <= IDLE;
        else
            ps <= ns;
    end

    //
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin //initial condition
            r_done_intr     <=  0;
            r_done_led      <=  0;
            r_w_add         <=  0;
            r_w_en          <=  0;
            r_x_add         <=  0;
            r_x_en          <=  0;
            start_1clk      <=  0;
            r_mux_ctr       <=  0;
            r_dsp_en        <=  0;
            r_dsp_clear     <=  0;
            r_image_idx     <=  0;
            rowcounter      <=  0;
            colcounter      <=  0;
            r_valid         <=  0;
            r_layer_num     <=  0;
        end
        else begin
            case (ps)
                IDLE        :   begin //initial condition
                    r_done_intr     <=  0;
                    r_done_led      <=  0;
                    r_w_add         <=  0;
                    r_w_en          <=  0;
                    r_x_add         <=  0;
                    r_x_en          <=  0;
                    start_1clk      <=  0;
                    r_mux_ctr       <=  0;
                    r_dsp_en        <=  0;
                    r_dsp_clear     <=  0;
                    r_image_idx     <=  0;
                    rowcounter      <=  0;
                    colcounter      <=  0;
                    r_valid         <=  0;
                    r_layer_num     <=  0;
                    r_x_add_pipeline1<= 0;
                    r_x_add_pipeline2<= 0;
                end

                Layer1   :   begin
                    if(!start_1clk[0])begin
                        r_mux_ctr       <=  0;
                        r_dsp_clear     <=  0;
                        start_1clk      <=  4'b0001;
                        r_x_en          <=  1;
                        r_x_add         <=  784*r_image_idx;
                        rowcounter      <=  0;
                        colcounter      <=  0;
                        r_w_en          <=  1;
                        r_w_add         <=  1;
                        r_layer_num     <=  0;
                        r_valid         <=  0;
                        r_x_add_pipeline1<=  784*r_image_idx+11;
                    end   
                    else begin
                        if(colcounter < 64) begin
                            if (rowcounter <= Layer1_raw) begin //12
                                r_x_add         <=  r_x_add + 1;
                                r_w_add         <=  r_w_add + 1;
                                rowcounter      <=  rowcounter + 1;
                                r_dsp_en        <=  1;
                                r_dsp_clear     <=  0;
                                r_x_add_pipeline2<= 12*colcounter;
                            end
                            else begin
                                colcounter      <=  colcounter + 1;
                                r_x_add         <=  r_x_add_pipeline1+r_x_add_pipeline2; // for conv1d calculate
                                r_w_add         <=  0;
                                rowcounter      <=  0;
                                r_dsp_en        <=  0;
                                r_dsp_clear     <=  1;
                            end
                        end          
                    end            
                end
                end1     :  begin
                    r_dsp_en    <=  0;
                    r_dsp_clear <=  1;
                    rowcounter  <=  0;
                    colcounter  <=  0;
                    r_valid     <=  1;
                end 

                Layer2   :   begin
                    if(!start_1clk[1])begin
                        r_mux_ctr       <=  1;
                        r_dsp_en        <=  1;
                        r_dsp_clear     <=  0;
                        start_1clk      <=  4'b0011;
                        r_x_en          <=  0;
                        r_w_en          <=  1;
                        rowcounter      <=  0;
                        colcounter      <=  0;
                        r_x_add         <=  0;
                        r_w_add         <=  1+Layer1_number;
                        r_layer_num     <=  1;
                        r_valid         <=  0;
                    end   
                    else begin
                        if(colcounter < Layer2_col) begin
                            if (rowcounter < Layer2_raw) begin
                                r_w_add         <=  r_w_add + 1;
                                r_x_add         <=  r_x_add + 1;
                                rowcounter      <=  rowcounter + 1;
                                r_dsp_en        <=  1;
                                r_dsp_en        <=  1;
                                r_dsp_clear     <=  0;
                            end
                            else begin
                                colcounter      <=  colcounter + 1;
                                rowcounter      <=  0;
                                r_x_add         <=  0;
                                r_dsp_en        <=  0;
                                r_dsp_clear     <=  1;
                            end
                        end
                    end  
                end

                end2     :    begin
                    r_dsp_en    <=  0;
                    r_dsp_clear <=  1;
                    rowcounter  <=  0;
                    colcounter  <=  0;
                    r_valid     <=  1;
                end

                Layer3   :   begin
                    if(!start_1clk[2])begin
                        r_mux_ctr       <=  1;
                        r_dsp_en        <=  1;
                        r_dsp_clear     <=  0;
                        start_1clk      <=  4'b0111;
                        r_w_en          <=  1;
                        r_w_add         <=  1+Layer1_number+Layer2_number;
                        r_x_add         <=  0;
                        rowcounter      <=  0;
                        colcounter      <=  0;
                        r_layer_num     <=  2;
                        r_valid         <=  0;
                    end   
                    else begin
                        if(colcounter < Layer3_col) begin
                            if (rowcounter < Layer3_raw) begin
                                r_x_add         <=  r_x_add + 1;
                                r_w_add         <=  r_w_add + 1;
                                rowcounter      <=  rowcounter + 1;
                                r_dsp_en        <=  2'b1;
                                r_dsp_en        <=  1;
                                r_dsp_clear     <=  0;
                            end
                            else begin
                                colcounter      <=  colcounter + 1;
                                rowcounter      <=  0;
                                r_x_add         <=  0;
                                r_dsp_en        <=  0;
                                r_dsp_clear     <=  1;
                            end
                        end
                    end
                end

                end3     :    begin
                    r_dsp_en    <=  0;
                    r_dsp_clear <=  1;
                    rowcounter  <=  0;
                    colcounter  <=  0;
                    r_valid     <=  1;
                end

                Layer4   :   begin
                    if(!start_1clk[3])begin
                        r_mux_ctr       <=  1;
                        r_dsp_en        <=  1;
                        r_dsp_clear     <=  0;
                        start_1clk      <=  4'b1111;
                        r_w_en          <=  1;
                        r_w_add         <=  1+Layer1_number+Layer2_number+Layer3_number;
                        r_x_add         <=  0;
                        rowcounter      <=  0;
                        colcounter      <=  0;
                        r_layer_num     <=  3;
                        r_valid         <=  0;
                    end   
                    else begin
                        if(colcounter < Layer4_col) begin
                            if (rowcounter < Layer4_raw) begin
                                r_x_add         <=  r_x_add + 1;
                                r_w_add         <=  r_w_add + 1;
                                r_dsp_en        <=  2'b1;
                                r_dsp_en        <=  1;
                                r_dsp_clear     <=  0;
                                rowcounter      <=  rowcounter + 1;
                            end
                            else begin
                                colcounter      <=  colcounter + 1;
                                rowcounter      <=  0;
                                r_x_add         <=  0;
                                r_dsp_en        <=  0;
                                r_dsp_clear     <=  1;
                            end
                        end
                    end
                end

                end4     :   begin
                    r_dsp_en    <=  0;
                    r_dsp_clear <=  1;
                    rowcounter  <=  0;
                    colcounter  <=  0;
                    start_1clk  <=  0;
                    r_image_idx <=  (ns[0])?r_image_idx+1:r_image_idx; //image number up
                    r_valid     <=  1;
                end

                done        :   begin
                    r_done_intr     <=  1;
                    r_done_led      <=  1;
                end
                
                default     :   begin
                    r_done_intr     <=  0;
                    r_done_led      <=  0;
                    r_w_add         <=  0;
                    r_w_en          <=  0;
                    r_x_add         <=  0;
                    r_x_en          <=  0;
                end
            endcase
        end
    end
endmodule