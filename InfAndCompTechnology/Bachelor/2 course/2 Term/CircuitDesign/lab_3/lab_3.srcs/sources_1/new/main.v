`timescale 1ns / 1ps
module main(
    input clk,
    input PS_2_clk,
    input PS_2_data,
    input reset,
    output [7:0] AN,
    output [6:0] SEG,
    output LED
);

reg CLOCK_ENABLE = 0;
always @(posedge clk)
    CLOCK_ENABLE <= ~CLOCK_ENABLE;
    
wire cpu_reset_out, cpu_reset_out_enable;

FILTER cpu_reset_filter(
    .CLK(clk),
    .CLOCK_ENABLE(CLOCK_ENABLE),
    .IN_SIGNAL(reset),
    .OUT_SIGNAL(cpu_reset_out),
    .OUT_SIGNAL_ENABLE(cpu_reset_out_enable)
);

wire [9:0] ps2_data_compl;
reg [9:0] delay_data;
wire ps2_data_ex;
always @(posedge clk)
begin
    delay_data <= ps2_data_compl;
end

PS2_manager ps_2(
    .clk(clk),
    .PS_2_clk(PS_2_clk),
    .PS_2_data(PS_2_data),
    .reset(cpu_reset_out_enable),
    .R_O(ps2_data_ex),
    .out(ps2_data_compl)
);

wire [3:0] chastnoe, ostatok;
wire [2:0] ERROR;

Division del(
    .clk(clk),
    .R_I(ps2_data_ex),
    .reset(cpu_reset_out_enable),
    .dataIn(delay_data),
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
    .NUMBER({chastnoe,4'b0,ostatok,5'b0,ERROR,2'b0, delay_data}),
    .AN_MASK({8'b01010100}),
    .AN(AN),
    .SEG(SEG)
);

endmodule