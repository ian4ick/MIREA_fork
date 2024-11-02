`timescale 1ns / 1ps
module counter(
input clk,
output [7:0] cnt
    );
reg [7:0] a;
initial
begin
    a = 0;
end
always @(posedge clk)
    a <= (a + 1) % 151;
assign cnt = a;
endmodule
