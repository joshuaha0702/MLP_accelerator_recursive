`timescale 1ns/1ps
module post_input #(
    parameter IN_WIDTH  = 8,
    parameter OUT_WIDTH = 8
)(
    input  wire [IN_WIDTH-1:0] data_in_u8,   // unsigned input [0,255]
    output wire [OUT_WIDTH-1:0] data_out_s8  // signed output [-127,127]
);

    // Step 1: Shift right by 1 (equivalent to divide by 2)
    wire [IN_WIDTH:0] rounded = data_in_u8 + 1 >> 1;

    // Step 2: Output assignment
    assign  data_out_s8 = (rounded[7])?127:rounded;

endmodule
