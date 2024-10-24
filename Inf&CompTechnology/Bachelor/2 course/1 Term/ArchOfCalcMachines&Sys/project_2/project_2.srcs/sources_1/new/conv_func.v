`timescale 1ns / 1ps
module conv_func(
    input [4:0] x,
    output f
    );
    wire [31:0] f_dc1;
    reg [1:0] in_cd;
    wire Q;
    dc #(5) dc1(
        .in(x),
        .enable(1),
        .f(f_dc1)
    );
    always @(*) begin
        in_cd[0] = f_dc1[1] || f_dc1[2] || f_dc1[5] || f_dc1[6] || f_dc1[11] || f_dc1[12] ||
         f_dc1[13] || f_dc1[14] || f_dc1[17] || f_dc1[18] || f_dc1[19] || f_dc1[20] || 
         f_dc1[23] ||  f_dc1[24] || f_dc1[25] || f_dc1[29] || f_dc1[30];
        in_cd[1] =  f_dc1[0] || f_dc1[3] || f_dc1[4] || f_dc1[7] || f_dc1[8] || 
        f_dc1[9] || f_dc1[10] || f_dc1[15] || f_dc1[16] || f_dc1[21] || f_dc1[22] || 
        f_dc1[26] || f_dc1[27] || f_dc1[28] || f_dc1[31];
    end
    cd #(1) cd1(
        .in(in_cd),
        .Q(Q),
        .f(f)
    );
endmodule
