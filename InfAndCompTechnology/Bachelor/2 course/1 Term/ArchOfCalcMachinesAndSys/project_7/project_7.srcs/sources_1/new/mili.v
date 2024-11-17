    `timescale 1ns / 1ps
    module mealy(
    input clk, 
    input [2:0] a,
    output reg [1:0] b, 
    output reg d
    );
    initial
    begin
        b = 0;
    end
    always @(posedge clk)
    begin
        case (b)
            2'b00: 
            begin
            if (a[0] == 1)
                b <= 2'b11;
            else
                b <= 2'b10;
            d = ~a[2] | a[0];
            end
            2'b01:
            begin
            if (a[0] == 1)
                b <= 2'b10;
            else
                b <= 2'b00;
            d = a[2] | a[1];
            end
            2'b10:
            begin
            casex (a)
                3'bx1x: b <= 2'b00;
                3'bx00: b <= 2'b10;
                3'bx01: b <= 2'b01;
            endcase
            d = (~a[2] & a[0]) | (a[2] & ~a[0]);
            end
            2'b11:
            begin
            if (a[1] == 1)
                b <= 2'b10;
            else
                b <= 2'b01;
            d = a[2] & a[1];        
            end
        endcase
    end
    endmodule
