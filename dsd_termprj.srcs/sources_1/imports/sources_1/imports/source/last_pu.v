`timescale 1ns / 1ps

module last_pu #(
    parameter IN_WIDTH = 32,
    parameter OUT_WIDTH = 8
)(
    input wire  clk,
    input wire signed   [IN_WIDTH-1:0]  din_int32,  // input feature
    input wire          [31:0]          input_scale_q16,
    output reg signed  [OUT_WIDTH-1:0] dout_int8
);

    // Step 1: ReLU
    reg signed [IN_WIDTH-1:0] relu_out;
    // Step 2: Multiply with input_scale (Q16.16)
    reg signed [63:0] scaled1;
    // Step 3: Final rounding and shift to integer
    reg signed [31:0] rounded_result;
    // Step 4: Clipping to [0, 127] 
    reg signed [OUT_WIDTH-1:0] clipped_result;
    always @(posedge clk) begin
        scaled1 <= relu_out * input_scale_q16;
        relu_out <= (din_int32[31]) ? 0 : din_int32;
        rounded_result <= (scaled1 + 32'd32768) >>> 16;
        clipped_result <= (|rounded_result[31:7]/*rounded_result > 127*/)   ? 127 : rounded_result[OUT_WIDTH-1:0];
        dout_int8 <= clipped_result;
    end

endmodule
