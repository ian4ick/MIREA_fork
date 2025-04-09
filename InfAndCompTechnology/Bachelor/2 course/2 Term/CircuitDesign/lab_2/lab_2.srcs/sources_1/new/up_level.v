`timescale 1ns / 1ps
module up_level
(
    input clk, btn_c, [15:0] SW,
    output [7:0] AN, [6:0] SEG, [15:0] LED
);
wire R_O;
wire [1:0] err;
wire [15:0] arr_val;
wire [5:0] st;
//wire btn_c; 
//wire [15:0] SW;

wire [3:0] nn, reg_i;
    wire [15:0] arr1;
    wire [15:0] arr2;
    wire [15:0] arr3;

reg CLOK_ENABLE = 0;

always @(posedge clk)
    CLOK_ENABLE <= ~CLOK_ENABLE;
wire btn_c_out, btn_c_out_enable;

DEBOUNCER #(.SIZE(5)) btn_c_debouncer
(
    .CLK(clk),
    .CLOCK_ENABLE(CLOK_ENABLE),
    .IN_SIGNAL(btn_c),
    .OUT_SIGNAL_ENABLE(btn_c_out_enable),
    .OUT_SIGNAL(btn_c_out)
);

sorter sort(
    .in(SW),
    .clk(clk),
    .R_I(btn_c_out),
    .out(arr_val),
    .R_O(R_O),
    .err(err),
    .st(st),
    .nn(nn),
    .arr1(arr1),
    .arr2(arr2),
    .arr3(arr3),
    .reg_i(reg_i)
);

reg [31:0] shift_reg;
reg [7:0] an_mask;
initial
begin
    shift_reg = 0;
    an_mask <= 8'b11111111;
end

always@* begin
//if (btn_c_out_enable) begin
    shift_reg <= {16'h0000, arr_val};
    an_mask <= 8'hf0;
end //end

assign LED[0] = R_O;
assign LED[6:1] = st;
assign LED[13:7] = 0;
assign LED[15:14] = err;

wire clk_div_out;
divider #(.divisor(8000)) divide_clk
(
    .clk(clk),
    .divided_clk(clk_div_out)
);/*
vio_0 vio(
    .clk(clk),
    .probe_in0(arr_val),
    .probe_in1(st),
    .probe_in2(err),
    .probe_in3(nn),
    .probe_in4(arr1),
    .probe_in5(arr2),
    .probe_in6(arr3),
    .probe_in7(reg_i),
    .probe_out0(SW),
    .probe_out1(btn_c)
);*/
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
