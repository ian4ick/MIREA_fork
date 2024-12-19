`timescale 1ns / 1ps
module var5_1(
input [11:0] a, b,
input C,
input [2:0] c,
output reg [11:0] f
);
reg [11:0] re;
wire [11:0] or_out, nor_out;
initial
begin
    re = 0;
end
always @(posedge C)
begin
    re = or_out;
end

always @*
begin
    case (c)
        2: f = a;
        3: f = re;
        4: f = nor_out;
        7: f = 12'hFFF;
        default: f = 0;
    endcase
end

assign or_out = a | b;
assign nor_out = ~(a | b);
endmodule
