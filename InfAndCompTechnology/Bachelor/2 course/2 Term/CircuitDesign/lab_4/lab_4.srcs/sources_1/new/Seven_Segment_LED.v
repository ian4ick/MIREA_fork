`timescale 1ns / 1ps
module Seven_Segment_LED
(
    input clk, RESET, [15:0] NUMBER, [7:0] ANOD_MASK,
    output [7:0] ANOD, reg [6:0] SEGMENT
);

reg [7:0] ANOD_REG = 0;
assign ANOD = ANOD_REG | ANOD_MASK;

reg [2:0] digit_counter;
wire [3:0] NUMBER_SPLIT [0:7];

genvar i;
generate
    for (i = 0; i < 4; i = i + 1)
    begin
        assign NUMBER_SPLIT[i] = NUMBER[((i + 1) * 4 - 1) -:4];
    end
endgenerate

initial
begin
    digit_counter = 0;
end

always @(posedge clk or posedge RESET)
begin
    digit_counter <= RESET ? 0 : digit_counter + 3'b1;
end

always @(digit_counter)
begin
    case (NUMBER_SPLIT[digit_counter])
        4'h0: SEGMENT <= 7'b1000000;
        4'h1: SEGMENT <= 7'b1111001;
        4'h2: SEGMENT <= 7'b0100100;
        4'h3: SEGMENT <= 7'b0110000;
        4'h4: SEGMENT <= 7'b0011001;
        4'h5: SEGMENT <= 7'b0010010;
        4'h6: SEGMENT <= 7'b0000010;
        4'h7: SEGMENT <= 7'b1111000;
        4'h8: SEGMENT <= 7'b0000000;
        4'h9: SEGMENT <= 7'b0010000;
        4'ha: SEGMENT <= 7'b0001000;
        4'hb: SEGMENT <= 7'b0000011;
        4'hc: SEGMENT <= 7'b1000110;
        4'hd: SEGMENT <= 7'b0100001;
        4'he: SEGMENT <= 7'b0000110;
        4'hf: SEGMENT <= 7'b0001110;
        default: SEGMENT <= 7'b1111111;
    endcase
    
    ANOD_REG <= ~(8'd1 << digit_counter);
    
    case (digit_counter)
        3'd0: ANOD_REG <= 8'b11111110;
        3'd1: ANOD_REG <= 8'b11111101;
        3'd2: ANOD_REG <= 8'b11111011;
        3'd3: ANOD_REG <= 8'b11110111;
        3'd4: ANOD_REG <= 8'b11101111;
        3'd5: ANOD_REG <= 8'b11011111;
        3'd6: ANOD_REG <= 8'b10111111;
        3'd7: ANOD_REG <= 8'b01111111;
        default: ANOD_REG <= 8'b11111111;
    endcase
end

endmodule