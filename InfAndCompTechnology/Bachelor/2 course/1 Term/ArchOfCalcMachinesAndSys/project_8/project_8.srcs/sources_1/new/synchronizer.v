`timescale 1ns / 1ps
module synchronizer(
input clk,
input in,
output reg out
    );
reg temp;
initial
begin
    temp = 0;
    out = 0;
end
always@ (posedge clk)
begin
    temp <= in;
    out <= temp;
end
endmodule
