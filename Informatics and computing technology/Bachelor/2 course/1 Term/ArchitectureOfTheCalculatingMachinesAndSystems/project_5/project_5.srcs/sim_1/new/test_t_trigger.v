`timescale 1ns / 1ps
module test_t_trigger();
reg t;
reg [2:0] args;
wire Q;
initial
begin
    t = 0;
    args = 0;
end
always #50 
begin
    if(args == 6)
        $finish;
    t = ~t;
    args = args + 1;
end
t_trigger tmp(
    .t(t),
    .Q(Q)
);
endmodule
