`timescale 1ns / 1ps
module dc_func(
    input [4:0] x,
    output f
    );
    wire [3:0] f_dc1, f_dc2, f_dc3, f_dc4, f_dc5, f_dc6, f_dc7, f_dc8, f_dc9;
    dc #(2) dc1(
        .in(x[4:3]),
        .enable(1),
        .f(f_dc1)
    );
    dc #(2) dc2(
        .in(x[3:2]),
        .enable(f_dc1[0] || f_dc1[1]),
        .f(f_dc2)
    );
    dc #(2) dc5(
        .in(x[1:0]),
        .enable(f_dc2[3]),
        .f(f_dc5)
    );
    dc #(2) dc6(
        .in(x[3:2]),
        .enable(f_dc1[2] || f_dc1[3]),
        .f(f_dc6)
    );
    dc #(2) dc3(
        .in(x[1:0]),
        .enable(f_dc2[0] || f_dc2[1] || f_dc6[3]),
        .f(f_dc3)
    );
    dc #(2) dc4(
        .in(x[1:0]),
        .enable(f_dc2[2]),
        .f(f_dc4)
    );
    dc #(2) dc7(
        .in(x[1:0]),
        .enable(f_dc6[0]),
        .f(f_dc7)
    );
    dc #(2) dc8(
        .in(x[1:0]),
        .enable(f_dc6[1]),
        .f(f_dc8)
    );
    dc #(2) dc9(
        .in(x[1:0]),
        .enable(f_dc6[2]),
        .f(f_dc9)
    );
    assign f = f_dc3[0] || f_dc3[3] ||
        f_dc4[0] || f_dc4[1] || f_dc4[2] ||
        f_dc5[3] ||
        f_dc7[0] ||
        f_dc8[1] || f_dc8[2] ||
        f_dc9[2] || f_dc9[3]
        ;
   
endmodule
