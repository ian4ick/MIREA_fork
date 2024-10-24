`timescale 1ns / 1ps
module test_sync_dynam_singlestage_rs_trigger();
reg nr, ns, clk;
reg [2:0] args;
wire Q;
initial
begin
    args = 7;
    nr = 1'bx; 
    ns = 1'bx;
    clk = 0;
end
always #5 clk = ~clk;

always #10
begin
    nr = args[0];
    ns = args[1];
    args = args + 1;
    if(args == 6)
        $finish;
end

sync_dynam_singlestage_rs_trigger tmp(
    .nr(nr),
    .ns(ns),
    .Q(Q),
    .clk(clk)
);
endmodule
