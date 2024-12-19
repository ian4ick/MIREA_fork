`timescale 1ns / 1ps
module var6_1(
input [4:0] IN,
input [2:0] Sel,
input C,
output [4:0] OUT
);
reg [4:0] re;
initial
begin
    re  = 0;
end
always @(posedge C)
begin
    case (Sel)
        0: re <= re;
        1: re <= 5'h11;
        2: re <= re | IN;
        4: re <= re & IN;
        default: re <= 0;
    endcase
end

assign OUT = re;
endmodule
