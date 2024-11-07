`timescale 1ns / 1ps
module counter#(step = 1, mod = 151)(
input clk,
output [7:0] cnt
    );
reg [7:0] a;
initial
begin
    a = 0;
end
always @(clk)
    a <= (a + step) % mod;
assign cnt = a;
endmodule
