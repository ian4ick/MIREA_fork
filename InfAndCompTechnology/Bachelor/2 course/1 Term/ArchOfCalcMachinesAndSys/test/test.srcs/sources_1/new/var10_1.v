`timescale 1ns / 1ps
module var10_1(
input A, Clk,
input S,R,
input J,K,
input D,
output OUT
);
reg RS, JK;
reg mx1,mx2,mx3;
initial
begin
    RS = 0;
    JK = 0;
    mx1 = 0;
    mx2 = 0;
    mx3 = 0;
end
always @(posedge Clk)
begin
    if (S & ~R)
        RS = 1;
    else if (~S & R)
        RS = 0;
    if (J & ~K)
        JK = 1;
    else if (~J & K)
        JK = 0;
    else if (J & K)
        JK = ~JK;
    
    if (A)
    begin
        mx1 = JK;
        mx2 = JK;
        mx3 = RS;
    end
    else
    begin
        mx1 = RS;
        mx2 = D;
        mx3 = D;
    end
end

assign OUT = mx1 | mx2 | mx3;
endmodule
