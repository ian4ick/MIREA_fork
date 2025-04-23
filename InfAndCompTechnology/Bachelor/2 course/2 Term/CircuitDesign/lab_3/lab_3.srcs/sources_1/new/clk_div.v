`timescale 1ns / 1ps
module clk_div(
    input clk,
    output reg clk_div
);

reg[15:0] clk_counter = 0; 
initial clk_div = 0;

always@ (posedge clk)
begin
if (clk_counter >= (2**1 - 1) >> 1)
    begin
        clk_counter <= 0;
        clk_div <= ~clk_div;
    end
else
    begin
        clk_counter <= clk_counter + 1;
    end
end

endmodule
