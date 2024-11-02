`timescale 1ns / 1ps
module main();
reg clk;
wire [7:0] cnt;
reg oclk;
wire nclk;
initial
begin
    clk = 0;
    oclk = 0;
end

always #1 clk = ~clk;

counter c(
    .clk(clk),
    .cnt(cnt)
);

cldv dv(
    .clk(clk),
    .cnt(cnt),
    .nclk(nclk)
);
endmodule
