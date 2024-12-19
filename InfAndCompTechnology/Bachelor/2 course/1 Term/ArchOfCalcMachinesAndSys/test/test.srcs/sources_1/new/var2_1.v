`timescale 1ns / 1ps
module var2_1(
input i0,i1,i2,i3, c,
output out,
output [7:0] out1, out2
);
reg [3:0] shift1, shift2;
wire [7:0] dmx_in;

initial
begin
    shift1 = 0;
    shift2 = 0;
end
always @(posedge c)
begin
    shift1 <= {i3|i0, shift1[3:1]};
    if (i2)
        shift2 <= shift1;
end
assign dmx_in = {shift2[2:0], 1'b1, shift1[3:0]};
assign out = ~shift2[3];
assign out1 = ~shift2[3] ? dmx_in : 0;
assign out2 = shift2[3] ? dmx_in : 0;
endmodule
