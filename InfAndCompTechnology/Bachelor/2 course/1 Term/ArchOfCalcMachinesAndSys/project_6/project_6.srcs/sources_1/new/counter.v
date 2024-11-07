`timescale 1ns / 1ps
module counter#(step = 1, mod = 151, mode = 1)(
input clk,
output [7:0] cnt
    );
reg [7:0] a;
initial
begin
    a = 0;
end
always @(clk)
begin
if (mode==1)
    a <= (a + step) % mod;
else
    a <= (a - step) % mod;
end
assign cnt = a;
endmodule
