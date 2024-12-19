`timescale 1ns / 1ps

module var1_1(
input clk, b, a, d, c, e,
output OUT
);
reg clkb;
reg dmx_out, mux_out;
reg [7:0] shifter;
initial 
begin
    shifter = 0;
    clkb = 1;
    dmx_out = 0;
    mux_out = 0;
end

always @(posedge clk)
begin
    clkb <= ~b;
    shifter <= {shifter[6:0], clkb};
    dmx_out = 0;
    mux_out = 0;
end

always @(a, d, c, e)
begin
    if (~d)
        dmx_out = a;
    else
        dmx_out = 0;
    if (e)
        mux_out = a & c;
    else
        mux_out = a & dmx_out;
end

assign OUT = mux_out && shifter[7];
endmodule
