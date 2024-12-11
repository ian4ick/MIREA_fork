`timescale 1ns / 1ps
module operator(
input clk,
input in_signal,
output reg out_signal
);
wire out_s, out_s_e;
initial
begin
    out_signal = 0;
end
always @(posedge out_s_e)
begin
    out_signal = ~out_signal;
end
filter f(
    .clk(clk),
    .in_signal(in_signal),
    .clock_enable(1'b1),
    .OUT_SIGNAL(out_s),
    .OUT_SIGNAL_ENABLE(out_s_e)
);
endmodule
