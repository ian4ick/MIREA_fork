`timescale 1ns / 1ps
module d_test();
reg [1:0] args;
reg stop;
reg clk, D, C, stop;
wire Q;
initial
begin
    stop = 0;
    D = 0;
    C = 1;
    args = 0;
    clk = 0;
end
always #10 clk = ~clk;
always @(posedge clk)
begin
    C = args[1];
    D = args[0];
    args = args + 1;
    if (stop == 1)
        $finish;
    if (args == 0)
        stop = 1;
end
d_trigger f(
    .D(D),
    .C(C),
    .Q(Q));
endmodule
