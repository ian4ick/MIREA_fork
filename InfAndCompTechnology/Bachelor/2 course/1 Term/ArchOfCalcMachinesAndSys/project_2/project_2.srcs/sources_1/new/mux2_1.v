`timescale 1ns / 1ps

module mux2_1(
input a,in0, in1,
output f
    );
    assign f = ~a & in0 | a & in1;
endmodule
