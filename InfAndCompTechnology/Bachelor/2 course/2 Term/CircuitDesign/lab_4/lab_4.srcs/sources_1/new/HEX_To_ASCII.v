`timescale 1ns / 1ps

module HEX_To_ASCII (
    input wire [3:0] HEX_in,
    output reg [7:0] ASCII_out
);

    always @(*) begin
        case (HEX_in)
            4'h0: ASCII_out = 8'h0;
            4'h1: ASCII_out = 8'h1;
            4'h2: ASCII_out = 8'h2;
            4'h3: ASCII_out = 8'h3;
            4'h4: ASCII_out = 8'h4;
            4'h5: ASCII_out = 8'h5;
            4'h6: ASCII_out = 8'h6;
            4'h7: ASCII_out = 8'h7;
            4'h8: ASCII_out = 8'h8;
            4'h9: ASCII_out = 8'h9;
            4'hA: ASCII_out = 8'hA;
            4'hB: ASCII_out = 8'hB;
            4'hC: ASCII_out = 8'hC;
            4'hD: ASCII_out = 8'hD;
            4'hE: ASCII_out = 8'hE;
            4'hF: ASCII_out = 8'hF;
            default: ASCII_out = 8'h0;
        endcase
    end

endmodule