`timescale 1ns / 1ps

module top_mlp #(
    parameter IN_IMG_NUM = 10,
	parameter FP_BW = 16,
	parameter INT_BW = 8,
	parameter X_BUF_DATA_WIDTH = INT_BW,  				// if you try INT8 recursive, you should change X_BUF_DATA_WIDTH to this line
	//parameter X_BUF_DATA_WIDTH = FP_BW,
	parameter X_BUF_DEPTH = 784*IN_IMG_NUM,
    // parameter W_BUF_DATA_WIDTH = INT_BW,					// if you try INT8 recursive, you should change W_BUF_DATA_WIDTH to this line
	parameter W_BUF_DATA_WIDTH = INT_BW,
	parameter W_BUF_DEPTH = 1+28+8192+8192+640,							// 
	// parameter W2_BUF_DEPTH = .. ,
	// parameter W3_BUF_DEPTH = .. ,	
	
	
	/*************DO NOT MODIFY THESE PARAMETERS	*****************/
    parameter Y_BUF_DATA_WIDTH = 32,
	parameter Y_BUF_ADDR_WIDTH = 32,
    parameter Y_BUF_DEPTH = 10*IN_IMG_NUM * 4				// we need to store data using byte addressing ( * 4 means byte addressing)
	/*************DO NOT MODIFY THESE PARAMETERS	*****************/
)(
	/*************DO NOT MODIFY THESE I/O PORTS	*****************/
    // system interface
    input   wire                            clk,
    input   wire                            rst_n,
    input   wire                            start_i,
    output  wire                            done_intr_o,
    output  wire                            done_led_o,
    // output buffer interface
    output  wire                            y_buf_en,
    output  wire                            y_buf_wr_en,
    output  wire [$clog2(Y_BUF_DEPTH)-1:0]  y_buf_addr,
    output  wire [Y_BUF_DATA_WIDTH-1:0]     y_buf_data
	/*************DO NOT MODIFY THESE I/O PORTS	*****************/
);

    localparam X_BUF_INIT_FILE =  "C:/Users/joshu/Documents/DSD25_Termproject_Materials/00_RTL_Skeleton/x.txt";
    localparam W_BUF_INIT_FILE =  "C:/Users/joshu/Documents/DSD25_Termproject_Materials/00_RTL_Skeleton/w.txt";
    
    wire x_buf_en;
    wire [$clog2(X_BUF_DEPTH)-1:0] x_buf_addr;
    wire [X_BUF_DATA_WIDTH-1:0] x_buf_data;
    wire w_buf_en;
    wire [$clog2(W_BUF_DEPTH)-1:0] w_buf_addr;
    wire [W_BUF_DATA_WIDTH-1:0] w_buf_data;
    //buffer wires
    
    wire prcss_done,mux_ctr,valid,dsp_enable_w,dsp_clear;
    wire [1:0]  layer_num_w;
    wire [3:0]  image_idx;
    //global controll <-> pu

    assign  y_buf_en = y_buf_wr_en;

    glbl_ctrl #(
        .BUF_ADDR_WIDTH(32)
    ) glbl_ctrl_inst(
        // system interface
        .clk(clk),
        .rst_n(rst_n),
        .start_i(start_i),
        .done_intr_o(done_intr_o),
        .done_led_o(done_led_o),
        // x_buffer interface
        .x_buf_en(x_buf_en),
        .x_buf_addr(x_buf_addr),
        // w_buffer interface
        .w_buf_en(w_buf_en),
        .w_buf_addr(w_buf_addr),
        // processing unit interface
        .prcss_done(prcss_done),
        .image_idx(image_idx),
        .mux_ctr(mux_ctr),
        .dsp_enable_o(dsp_enable_w),
        .dsp_clear(dsp_clear),
        .valid_o(valid),
        .layer_num(layer_num_w)
    );
	
	
    pu #(
        .IN_X_BUF_DATA_WIDTH(X_BUF_DATA_WIDTH),
        .IN_W_BUF_DATA_WIDTH(W_BUF_DATA_WIDTH),
        .OUT_BUF_ADDR_WIDTH($clog2(Y_BUF_DEPTH)),
        .OUT_BUF_DATA_WIDTH(Y_BUF_DATA_WIDTH)
    ) pu_inst(
        // system interface
        .clk(clk),
        .rst_n(rst_n),
        // global controller interface
        .prcss_done(prcss_done),
        .image_idx(image_idx),
        .mux_ctr(mux_ctr),
        .dsp_enable_i(dsp_enable_w),
        .dsp_clear(dsp_clear),
        .layer_num(layer_num_w),
        .valid(valid),
        .local_buf_addr(x_buf_addr),
        // input data buffer interface
        .x_buf_data(x_buf_data),
        .w_buf_data(w_buf_data),
        // output data buffer interface
        .y_buf_wr_en(y_buf_wr_en),
        .y_buf_addr(y_buf_addr),
        .y_buf_data(y_buf_data)
    );

    // x_buffer(input_image)
    single_port_bram  #(
        .WIDTH(X_BUF_DATA_WIDTH),
        .DEPTH(X_BUF_DEPTH),
        .INIT_FILE(X_BUF_INIT_FILE)
    ) x_buffer_inst (
        .clk(clk),
        .en(x_buf_en),
        .wen(),
        .addr(x_buf_addr),
        .din(),
        .dout(x_buf_data)
    );
    
    // w_buffer(weight)
    single_port_bram  #(
        .WIDTH(W_BUF_DATA_WIDTH),
        .DEPTH(W_BUF_DEPTH),
        .INIT_FILE(W_BUF_INIT_FILE)
    ) w_buffer_inst (
        .clk(clk),
        .en(w_buf_en),
        .wen(),
        .addr(w_buf_addr),
        .din(),
        .dout(w_buf_data)
    );
    
endmodule
