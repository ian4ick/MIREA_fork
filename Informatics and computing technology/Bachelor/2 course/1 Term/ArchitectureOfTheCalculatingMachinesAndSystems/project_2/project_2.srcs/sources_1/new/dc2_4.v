`timescale 1ns / 1ps

module dc2_4(
    input [1: 0] in,
    input enable,
    output [3: 0] f
    );
    assign f = !enable ? 0 : 1 << in;
endmodule
