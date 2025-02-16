`timescale 1ns / 1ps
module divider #(divisor = 36)
(
    input clk,
    output reg divided_clk
);

reg [$clog2(divisor/2) - 1 : 0] counter;
initial
    counter = 0;

always @(posedge clk)
begin
    counter <= counter + 1'b1;
    if(counter >= (divisor - 1))
        counter <= 1'b0;
        divided_clk <= (counter < divisor/2)? 1'b1:1'b0;
end
endmodule
