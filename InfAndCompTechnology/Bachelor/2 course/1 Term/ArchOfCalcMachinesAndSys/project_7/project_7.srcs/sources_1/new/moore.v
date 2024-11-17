`timescale 1ns / 1ps
module moore(
input clk,
input [2:0] a,
output reg [2:0] b, 
output d
    );
initial
begin
    b = 0;
end
assign d = (b[2] & b[1] ) | b[0];
always @(posedge clk)
begin
    casex (b)
        3'b00x: 
        begin
        casex (a)
            3'b0x0: b <= 5;
            3'bxx1: b <= 6;
            3'b1x0: b <= 4;
        endcase
        //d = b[0];
        end
        3'b01x: 
        begin
        casex (a)
            3'b000: b <= 0;
            3'bxx0: b <= 1;
            3'b001: b <= 4;
            3'bxx1: b <= 5;
        endcase
        //d = b[0];
        end
        3'b10x: 
        begin
        casex (a)
            3'b000: b <= 4;
            3'b001: b <= 3;
            3'b010: b <= 0;
            3'b011: b <= 1;
            3'b100: b <= 5;
            3'b101: b <= 2;
            3'b110: b <= 1;
            3'b111: b <= 0;
        endcase
        //d = b[0];
        end
        6: 
        begin
        casex (a)
            3'bx0x: b <= 2;
            3'b01x: b <= 4;
            3'b11x: b <= 5;
        endcase
        //d = 1;
        end
    endcase
end
endmodule
