`timescale 1ns / 1ps
module mux_func(
    input [4:0] x,
    output f
    );
    wire f_mx1, f_mx2, f_mx3, f_mx4, f_mx5, f_mx6, f_mx, f_mx8, f_mx9;
    
    mux2_1 mx1(
        .in0(~x[0]),
        .in1(x[0]),
        .a(x[1]),
        .f(f_mx1)
    );
    mux2_1 mx2(
        .in0(x[1]),
        .in1(f_mx1),
        .a(x[2]),
        .f(f_mx2)
    );
    mux2_1 mx3(
        .in0(f_mx9),
        .in1(~f_mx1),
        .a(x[2]),
        .f(f_mx3)
    );
    mux2_1 mx4(
        .in0(f_mx8),
        .in1(~f_mx8),
        .a(x[2]),
        .f(f_mx4)
    );
    mux2_1 mx5(
        .in0(f_mx1),
        .in1(f_mx4),
        .a(x[3]),
        .f(f_mx5)
    );
    mux2_1 mx6(
        .in0(f_mx3),
        .in1(f_mx2),
        .a(x[3]),
        .f(f_mx6)
    );
    mux2_1 mx7(
        .in0(f_mx5),
        .in1(f_mx6),
        .a(x[4]),
        .f(f_mx)
    );
    mux2_1 mx8(
        .in0(1),
        .in1(~x[0]),
        .a(x[1]),
        .f(f_mx8)
    );
    mux2_1 mx9(
        .in0(~x[0]),
        .in1(0),
        .a(x[1]),
        .f(f_mx9)
    );
    assign f = f_mx;
endmodule
