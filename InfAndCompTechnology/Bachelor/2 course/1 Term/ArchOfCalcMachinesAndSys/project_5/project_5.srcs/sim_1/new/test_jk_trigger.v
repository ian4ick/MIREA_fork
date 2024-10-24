`timescale 1ns / 1ps
module test_jk_trigger();
reg k, j, nr, ns, clk;
reg [3:0] args;
wire Q;
initial
begin
    args = 1;
    k = 0; 
    j = 0;
    nr = 1;
    ns = 0;
    clk = 0;
end
always #10 clk = ~clk;

always #40
begin
    args = args + 1;
    if(args == 7)
        $finish;
    if(args <= 3)
    begin
        ns = args[1];
        nr = args[0];
    end
    case(args)
        4: begin j = 1; k = 0; end
        5: begin j = 0; k = 1; end
        6: begin j = 1; k = 1; end
    endcase
end

jk_trigger tmp(
    .k(k),
    .j(j),
    .ns(ns),
    .nr(nr),
    .clk(clk),
    .Q(Q)
);
endmodule
