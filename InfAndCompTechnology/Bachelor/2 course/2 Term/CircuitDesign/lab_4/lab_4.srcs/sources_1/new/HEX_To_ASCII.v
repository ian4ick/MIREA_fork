`timescale 1ns / 1ps

module HEX_To_ASCII (
    input wire [3:0] HEX_in,
    output reg [7:0] ASCII_out
);
always @(*) begin
    case (HEX_in)
        4'h0: ASCII_out = 8'h00;
        4'h1: ASCII_out = 8'h01;
        4'h2: ASCII_out = 8'h02;
        4'h3: ASCII_out = 8'h03;
        4'h4: ASCII_out = 8'h04;
        4'h5: ASCII_out = 8'h05;
        4'h6: ASCII_out = 8'h06;
        4'h7: ASCII_out = 8'h07;
        4'h8: ASCII_out = 8'h08;
        4'h9: ASCII_out = 8'h09;
        4'hA: ASCII_out = 8'h0A;
        4'hB: ASCII_out = 8'h0B;
        4'hC: ASCII_out = 8'h0C;
        4'hD: ASCII_out = 8'h0D;
        4'hE: ASCII_out = 8'h0E;
        4'hF: ASCII_out = 8'h0F;
        default: ASCII_out = 8'h00;
    endcase
end

endmodule