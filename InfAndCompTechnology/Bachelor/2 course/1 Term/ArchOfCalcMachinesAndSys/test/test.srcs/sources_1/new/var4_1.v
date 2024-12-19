`timescale 1ns / 1ps
module var4_1(
input Q, a, C,
input [9:0] A,
output O1, 
output [7:0] O2
);
reg [10:0] shifter;
initial 
begin
    shifter = 0;
end
always @(posedge C)
begin
    if (Q)
        shifter = {a, shifter[10:1]};
end

assign O1 = shifter[0];
assign O2 = shifter[10:3];
endmodule
