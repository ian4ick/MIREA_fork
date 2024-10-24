`timescale 1ns / 1ps
module t_trigger(Q, t);
input t;
output Q;
reg Q;
initial
    Q = 0;
always@(negedge t)
    Q <= ~Q;
endmodule

