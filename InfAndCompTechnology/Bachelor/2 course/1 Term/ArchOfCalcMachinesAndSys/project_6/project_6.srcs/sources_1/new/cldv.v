`timescale 1ns / 1ps
module cldv(
input clk,
input [7:0] cnt,
output nclk
    );
reg dclk;
initial
    dclk = 0;
always @(posedge clk)
begin
    if (cnt == 0)
    begin
        dclk = ~dclk;
    end
end
assign nclk = dclk;
endmodule
