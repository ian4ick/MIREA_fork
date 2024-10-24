`timescale 1ns / 1ps
module async_singlestage_rs_trigger(r, s, Q);
input r, s;
output Q;
reg Q;

always @(r or s)
begin
    case({r, s})
        0: Q <= Q;
        1: Q <= 1;
        2: Q <= 0;
        3: Q <= 1'bx;
    endcase
end
endmodule
