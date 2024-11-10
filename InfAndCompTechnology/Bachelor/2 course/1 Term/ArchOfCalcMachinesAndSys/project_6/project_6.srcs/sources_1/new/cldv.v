`timescale 1ns / 1ps
module cldv#(mod = 151)(
input clk,
input [$clog2(mod) - 1:0] cnt,
output nclk
    );
reg dclk;
initial
    dclk = 0;
always @(clk)
begin
    if (cnt == 0)
    begin
        dclk = ~dclk;
    end
end
assign nclk = dclk;
endmodule
