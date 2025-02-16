`timescale 1ns / 1ps
module up_level
(
    input clk, btn_c, [3:0] SET_VALUE,
    output [7:0] ANODS, [6:0] SEGMENTS
);

reg CLOK_ENABLE = 0;
always @(posedge clk)
    CLOK_ENABLE <= ~CLOK_ENABLE;
wire btn_c_out, btn_c_out_enable;

DEBOUNCER #(.SIZE(7)) btn_c_debouncer
(
    .CLK(clk),
    .CLOCK_ENABLE(CLOK_ENABLE),
    .IN_SIGNAL(btn_c),
    .OUT_SIGNAL_ENABLE(btn_c_out_enable),
    .OUT_SIGNAL(btn_c_out)
);

reg [31:0] memory;
reg [7:0] an_mask;
initial
    an_mask <= 8'b11111111;

always@(posedge clk)
    if (btn_c_out_enable)
    begin
        an_mask <= {an_mask[6:0], 1'b0};
    end

SHIFT_REGISTER #(.SIZE(32)) shift_register
(
    .CLK(clk),
    .ENABLE(btn_c_out_enable),
    .NEW_VALUE(SET_VALUE),
    .REG_MEMORY(memory)
);

wire clk_div_out;
divider #(.divisor(50)) divide_clk
(
    .clk(clk),
    .divided_clk(clk_div_out)
);

Seven_Segment_LED segments
(
    .clk(clk_div_out),
    .RESET(1'b0),
    .NUMBER(memory),
    .ANOD_MASK(an_mask),
    .ANOD(ANODS),
    .SEGMENT(SEGMENTS)
);
endmodule
