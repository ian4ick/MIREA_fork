`timescale 1ns / 1ps
module var7_1(
input [3:0] A,
output [3:0] OUT,
output a
);
reg [3:0] pri;
initial
pri = 0;
always @(A)
begin
    case (A)
        0: pri = 9;
        1: pri = 0;
        2: pri = 1;
        3: pri = 5;
        4: pri = 2;
        5: pri = 4;
        6: pri = 13;
        7: pri = 6;
        8: pri = 7;
        9: pri = 3;
        10: pri = 10;
        11: pri = 8;
        12: pri = 14;
        13: pri = 11;
        14: pri = 15;
        15: pri = 4'hx;
    endcase
end
assign OUT = pri;
assign a = pri == 15;
endmodule
