`timescale 1ns / 1ps

module ASCII_To_HEX (
    input wire [7:0] ASCII_in,
    output reg [3:0] HEX_out
);

    always @(*) begin
        case (ASCII_in)
            8'h0: HEX_out = 4'h0;
            8'h1: HEX_out = 4'h1;
            8'h2: HEX_out = 4'h2;
            8'h3: HEX_out = 4'h3;
            8'h4: HEX_out = 4'h4;
            8'h5: HEX_out = 4'h5;
            8'h6: HEX_out = 4'h6;
            8'h7: HEX_out = 4'h7;
            8'h8: HEX_out = 4'h8;
            8'h9: HEX_out = 4'h9;
            8'hA: HEX_out = 4'hA;
            8'hB: HEX_out = 4'hB;
            8'hC: HEX_out = 4'hC;
            8'hD: HEX_out = 4'hD;
            8'hE: HEX_out = 4'hE;
            8'hF: HEX_out = 4'hF;
            default: HEX_out = 4'h0;
        endcase
    end

endmodule