`timescale 1ns / 1ps
module filter#(lvl=16)(
input clk,
input in_signal,
input clock_enable,
output OUT_SIGNAL,
output OUT_SIGNAL_ENABLE
);
reg out_s, out_s_en;
reg xnor_out;
reg and2, and3, and4;
wire out_sync;
wire [$clog2(lvl) - 1:0] cnt_out;
initial
begin
    and2 = 0;
    and3 = 0;
    and4 = 0;
    out_s_en = 0;
    xnor_out  = 1;
    out_s = 0;
    
end
always @(posedge clk)
begin
    out_s <= (out_sync & and3) | (out_s & ~and3);
    xnor_out = out_s == out_sync;
    if (cnt_out == lvl - 1)
        and2 = 1;
    else
        and2 = 0;
    and3 = and2 & clock_enable;
    and4 = and3 & out_sync;
    out_s_en <= and4;
end

assign OUT_SIGNAL = out_s;
assign OUT_SIGNAL_ENABLE = out_s_en;

synchronizer sync(
    .clk(clk),
    .in(in_signal),
    .out(out_sync)
);
counter #(.mod(lvl)) cnt (
    .clk(clk),
    .en(clock_enable),
    .reset(xnor_out),
    .cnt(cnt_out)
);
endmodule
