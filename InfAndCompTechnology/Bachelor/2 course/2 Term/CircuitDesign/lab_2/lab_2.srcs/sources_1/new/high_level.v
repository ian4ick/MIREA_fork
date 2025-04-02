`timescale 1ns / 1ps
module high_level(
    input [15:0] SW,
    input clk,
    input btn_c,
    output [15:0] LED
    );
wire R_O;
wire [1:0] err;
sorter sort(
    .in(SW),
    .clk(clk),
    .R_I(btn_c),
    .out(LED),
    .R_O(R_O),
    .err(err)
);
endmodule
