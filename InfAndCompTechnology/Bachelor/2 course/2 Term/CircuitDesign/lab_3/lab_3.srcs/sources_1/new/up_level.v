`timescale 1ns / 1ps
module up_level(
    input clk,
    input btn_c,
    input cpu_reset,
    input [9:0] SW,
    output [7:0] AN,
    output [6:0] SEG,
    output LED
);

reg CLOCK_ENABLE = 0;
always @(posedge clk)
    CLOCK_ENABLE <= ~CLOCK_ENABLE;
    
wire btn_c_out, btn_c_out_enable;

FILTER btn_c_filter(
    .CLK(clk),
    .CLOCK_ENABLE(CLOCK_ENABLE),
    .IN_SIGNAL(btn_c),
    .OUT_SIGNAL(btn_c_out),
    .OUT_SIGNAL_ENABLE(btn_c_out_enable)
);

wire cpu_reset_out, cpu_reset_out_enable;

FILTER cpu_reset_filter(
    .CLK(clk),
    .CLOCK_ENABLE(CLOCK_ENABLE),
    .IN_SIGNAL(~cpu_reset),
    .OUT_SIGNAL(cpu_reset_out),
    .OUT_SIGNAL_ENABLE(cpu_reset_out_enable)
);

wire [3:0] chastnoe, ostatok;
wire [2:0] ERROR;

Division del(
    .clk(clk),
    .R_I(btn_c_out_enable),
    .reset(cpu_reset_out_enable),
    .dataIn(SW),
    .R_O(LED),
    .Res(chastnoe),
    .Remains(ostatok),
    .ERR(ERROR)
);

wire clk_div_out;
clk_div clk_div1(
    .clk(clk),
    .clk_div(clk_div_out)
);

SevenSegmentLED seg(
    .clk(clk_div_out),
    .RESET(cpu_reset_out_enable),
    .NUMBER({chastnoe,4'b0,ostatok,5'b0,ERROR,2'b0, SW}),
    .AN_MASK({8'b01010100}),
    .AN(AN),
    .SEG(SEG)
);
endmodule
