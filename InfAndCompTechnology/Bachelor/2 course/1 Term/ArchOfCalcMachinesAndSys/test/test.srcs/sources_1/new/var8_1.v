`timescale 1ns / 1ps
module var8_1(
input [7:0] A,
input C, D,
output [7:0] out
);
reg [7:0] re, mux_re;
initial 
begin
    re = 0;
    mux_re = 8'b11111011;
end

always @(posedge C)
begin
    mux_re[2] <= D;
    mux_re[4] <= ~D;
    if (re[1])
        re <= mux_re;
    else
        re <= A;
end

assign out = re;
endmodule
