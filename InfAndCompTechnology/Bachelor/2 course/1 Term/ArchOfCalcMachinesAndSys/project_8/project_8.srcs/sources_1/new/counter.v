`timescale 1ns / 1ps
module counter#(step = 1, mod = 16, mode = 1)(
input clk,
input en,
input reset,
output [$clog2(mod) - 1:0] cnt
    );
reg [$clog2(mod) - 1:0] a;
initial
begin
    a = 0;
end
always @(posedge clk or posedge reset)
begin
    if (en)
    begin
        if (mode == 1)
            a <= (a + step) % mod;
        else
            a <= (a - step) % mod;
        if (reset)
            a <= 0;
    end
end
assign cnt = a;
endmodule
