`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/06/13 22:52:12
// Design Name: 
// Module Name: tb_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_mlp_tb;

    // Clock & Reset
    reg clk;
    reg rst_n;
    reg start_i;

    wire done_intr_o;
    wire done_led_o;
    wire y_buf_en;
    wire y_buf_wr_en;
    wire [$clog2(10*10*4)-1:0] y_buf_addr;
    wire [31:0] y_buf_data;

    // Clock generation: 10ns period (100MHz)
    always #5 clk = ~clk;

    // DUT instance
    top_mlp #(
        .IN_IMG_NUM(10)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start_i(start_i),
        .done_intr_o(done_intr_o),
        .done_led_o(done_led_o),
        .y_buf_en(y_buf_en),
        .y_buf_wr_en(y_buf_wr_en),
        .y_buf_addr(y_buf_addr),
        .y_buf_data(y_buf_data)
    );

    initial begin
        // 초기화
        clk = 0;
        rst_n = 1;
        start_i = 0;

        // 리셋 해제
        #20;
        rst_n = 0;
        #10
        rst_n = 1;
        // start pulse
        #20;
        start_i = 1;
        #10;
        start_i = 0;

        // 시뮬레이션 시간 기다리기
        wait(done_intr_o);

        // 종료
        $display("Simulation finished.");
        $stop;
    end
    always @(posedge dut.pu_inst.y_buf_wr_en) begin
        //if(dut.pu_inst.y_buf_wr_en) begin
           $display("Time %0t: y_buf_data = %0d, \taddr = %0d", $time, $signed(dut.pu_inst.y_buf_data), dut.pu_inst.y_buf_addr);
       // end
    end 

endmodule
