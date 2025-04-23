`timescale 1ns / 1ps
module test();
reg clk = 0;
always #5 clk <= ~clk;
reg read_mode, write_mode;
reg [3:0] data_in;
FIFO uut(
    .clk(clk), 
    .reset(0),
    .enable(1), 
    .read_mode(read_mode), 
    .write_mode(write_mode),
    .data_in(data_in)
);
initial
begin
    write_mode = 1;
    read_mode = 0;
    data_in = 5;
    repeat(4) @(posedge clk);
    write_mode = 0;
    read_mode = 1;
    repeat(2) @(posedge clk);
    write_mode = 1;
    read_mode = 1;
    data_in = 4'hA;
end
endmodule
