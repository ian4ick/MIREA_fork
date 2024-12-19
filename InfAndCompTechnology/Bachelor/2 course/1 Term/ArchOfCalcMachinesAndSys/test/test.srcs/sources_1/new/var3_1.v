`timescale 1ns / 1ps
module var3_1(
input [2:0] a,
input b,
output reg out
);
reg xor_out;
reg [2:0] mux_in;
initial
begin
    xor_out = 0;
    mux_in = 0;
end
always @*
begin
    xor_out = 0;
    mux_in = 0; 
    case (a)
        1: mux_in[0] = 1;
        2: mux_in[1] = 1;
        4: mux_in[2] = 1;
        5: xor_out = 1;
        7: xor_out = 1;
    endcase
    if (b)
        case (mux_in)
            0: out = xor_out;
            1: out = 1;
            2: out = 0;
            4: out = 1;
        endcase 
    else
        out = 0;
end
endmodule
