`timescale 1ns / 1ps
module var6_2(
    input wire clk,
    input wire rst_n,
    input wire d,
    input wire shift_in,
    output reg q,
    output reg [7:0] shift_reg
);
    always @(posedge clk) begin
        if (!rst_n)
            q <= 1'b0;
        else
            q <= d;
    end
    always @(posedge clk) begin
        if (!rst_n)
            shift_reg <= 8'b0;
        else
            shift_reg <= {shift_reg[6:0], shift_in};
    end
endmodule
