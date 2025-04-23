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
    // Запись в пустой буфер
    write_mode = 1;
    read_mode = 0;
    data_in = 5;
    repeat(1) @(negedge clk);
    // Чтение из буфера размером 1
    write_mode = 0;
    read_mode = 1;
    repeat(1) @(negedge clk);
    // Запись и чтение одновременно в пустой буфер
    write_mode = 1;
    read_mode = 1;
    data_in = 4'hA;
    repeat(1) @(negedge clk);
    // Заполнение буфера до конца
    write_mode = 1;
    read_mode = 0;
    data_in = 3;
    repeat(3) @(negedge clk);
    data_in = 4;
    repeat(3) @(negedge clk);
    // Чтение из буфера до того, пока он не опустеет
    write_mode = 0;
    read_mode = 1;
    repeat(6) @(negedge clk);
    $finish;
end
endmodule
