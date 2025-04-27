`timescale 1ns / 1ps
module ASCII_To_HEX (
    input wire [7:0] ASCII_in,
    output reg [3:0] HEX_out
);
always @(*) begin
   case (ASCII_in)
        8'h00: HEX_out = 4'h0;
        8'h01: HEX_out = 4'h1;
        8'h02: HEX_out = 4'h2;
        8'h03: HEX_out = 4'h3;
        8'h04: HEX_out = 4'h4;
        8'h05: HEX_out = 4'h5;
        8'h06: HEX_out = 4'h6;
        8'h07: HEX_out = 4'h7;
        8'h08: HEX_out = 4'h8;
        8'h09: HEX_out = 4'h9;
        8'h0A: HEX_out = 4'hA;
        8'h0B: HEX_out = 4'hB;
        8'h0C: HEX_out = 4'hC;
        8'h0D: HEX_out = 4'hD;
        8'h0E: HEX_out = 4'hE;
        8'h0F: HEX_out = 4'hF;
        default: HEX_out = 4'h0;
    endcase
end

endmodule