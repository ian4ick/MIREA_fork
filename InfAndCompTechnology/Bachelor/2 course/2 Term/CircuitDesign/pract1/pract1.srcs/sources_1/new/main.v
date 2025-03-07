`timescale 1ns / 1ps
module main(
    input [7:0] a, b, c, d, e,
    input clk,
    output [8:0] f
);
reg [7:0] ra, rb, rc, rd, re;
reg [8:0] rf;

always @(posedge clk)
begin
    ra <= a;
    rb <= b;
    rc <= c;
    rd <= d;
    re <= e;
    rf <= ra + rb >> rc - rd / re;
end
assign f = rf;

endmodule
