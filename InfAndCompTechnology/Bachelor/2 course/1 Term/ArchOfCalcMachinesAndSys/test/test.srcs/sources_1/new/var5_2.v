`timescale 1ns / 1ps
module var5_2(
    input wire clk,
    input wire rst_n,
    input wire shift_in,
    input wire [3:0] data,
    output reg [7:0] shift_reg,
    output reg [1:0] enc_out
);
    always @(posedge clk) begin
        if (!rst_n)
            shift_reg <= 8'b0;
        else
            shift_reg <= {shift_reg[6:0], shift_in};
    end
    always @* begin
        enc_out = 2'b00;
        if (data[0]) enc_out = 2'b00;
        else if (data[1]) enc_out = 2'b01;
        else if (data[2]) enc_out = 2'b10;
        else if (data[3]) enc_out = 2'b11;
    end
endmodule
