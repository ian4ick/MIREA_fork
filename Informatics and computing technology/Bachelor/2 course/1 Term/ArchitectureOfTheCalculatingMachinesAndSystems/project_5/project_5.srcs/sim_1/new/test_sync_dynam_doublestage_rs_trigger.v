`timescale 1ns / 1ps
module test_sync_dynam_doublestage_rs_trigger();
reg r, s, nr, ns, clk;
reg [3:0] args;
wire Q;
initial
begin
    args = 1;
    r = 1'bx; 
    s = 1'bx;
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
        3: begin s = 0; r = 1; end
        4: begin s = 1; r = 0; end
        5: begin s = 0; r = 0; end
    endcase
end

sync_dynam_doublestage_rs_trigger tmp(
    .r(r),
    .s(s),
    .ns(ns),
    .nr(nr),
    .clk(clk),
    .Q(Q)
);
endmodule
