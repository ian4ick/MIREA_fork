`timescale 1ns / 1ps
module test_a_s_rs();
reg r, s;
reg [3:0] args;
wire Q;
initial
begin
    args = 0;
    r = 0; 
    s = 0;
end
/*
always #100
begin
    s = ~s;
    args = args + 1;
    if (args == 2 ** 3 - 1)
        $finish;
end
always #200
begin
    r = ~r;
end
*/

always
begin
    #100 s = 1; r = 0; args = args + 1;
    #100 s = 0; r = 1; args = args + 1;
    #100 s = 0; r = 0; args = args + 1;
    #100 s = 1; r = 1; args = args + 1;
    #100 s = 1; r = 0; args = args + 1;
    #100 s = 0; r = 0; args = args + 1;
    #100 s = 0; r = 1; args = args + 1;
    $finish;
end

async_singlestep_rs tmp(
    .r(r),
    .s(s),
    .Q(Q)
);
endmodule
