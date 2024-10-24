`timescale 1ns / 1ps
module test_d_trigger();
reg d, clk;
wire Q;

initial
begin
clk = 0;
d = 0;
end

always #100 clk = ~clk;
always #400
begin
d = ~d;
if(d == 0)
    $finish;
end

d_trigger tmp(
    .d(d),
    .clk(clk),
    .Q(Q)
);
endmodule
