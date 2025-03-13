`timescale 1ns / 1ps
module test();
reg [2:0] a,b,c,d,e;
wire [3:0] f;
initial
begin
    a = -1;
    b = -1;
    c = 1;
    d = 1;
    e = 1;
end
main func(.a(a), .b(b), .c(c), .d(d), .e(e), .f(f));
endmodule
