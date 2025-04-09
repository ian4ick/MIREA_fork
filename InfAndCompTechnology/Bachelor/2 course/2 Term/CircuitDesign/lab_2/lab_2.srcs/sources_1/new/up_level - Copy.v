`timescale 1ns / 1ps
module up_level
(
    input clk, btn_c, [15:0] SW,
    output [7:0] AN, [6:0] SEG, [15:0] LED
);
wire R_O;
wire [1:0] err;
wire [15:0] arr_val;
sorter sort(
    .in(SW),
    .clk(clk),
    .R_I(btn_c),
    .out(arr_val),
    .R_O(R_O),
    .err(err)
);

reg CLOK_ENABLE = 0;
always @(posedge clk)
    CLOK_ENABLE <= ~CLOK_ENABLE;
wire btn_c_out, btn_c_out_enable;

DEBOUNCER #(.SIZE(3)) btn_c_debouncer
(
    .CLK(clk),
    .CLOCK_ENABLE(CLOK_ENABLE),
    .IN_SIGNAL(btn_c),
    .OUT_SIGNAL_ENABLE(btn_c_out_enable),
    .OUT_SIGNAL(btn_c_out)
);

reg [31:0] shift_reg;
reg [7:0] an_mask;
initial
begin
    shift_reg = 0;
    an_mask <= 8'b11111111;
end

always@(posedge clk)
begin
    shift_reg <= {16'h0000, arr_val};
    an_mask <= 8'h0f;
end

assign LED[0] = R_O;
assign LED[15:14] = err;

wire clk_div_out;
divider #(.divisor(8000)) divide_clk
(
    .clk(clk),
    .divided_clk(clk_div_out)
);

Seven_Segment_LED segments
(
    .clk(clk_div_out),
    .RESET(1'b0),
    .NUMBER(shift_reg),
    .ANOD_MASK(an_mask),
    .ANOD(AN),
    .SEGMENT(SEG)
);
endmodule
