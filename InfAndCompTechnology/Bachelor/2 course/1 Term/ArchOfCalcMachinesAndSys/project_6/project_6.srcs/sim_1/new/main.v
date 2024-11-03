`timescale 1ns / 1ps
module main();
reg clk;
wire [7:0] cnt;
reg [499:0] error_reg, ref_reg;
wire nclk;
integer count;
initial
begin
    count = -1;
    clk = 0;
    error_reg = 0;
    ref_reg = 500'h3fffffffffffffffffffffffffffffffffffff80000000000000000000000000000000000000fffffffffffffffffffffffffffffffffffffe;
end

always #1 clk = ~clk;

always @(posedge clk)
begin
   count = count + 1;
   error_reg[count] = nclk == ref_reg[count];
end

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
