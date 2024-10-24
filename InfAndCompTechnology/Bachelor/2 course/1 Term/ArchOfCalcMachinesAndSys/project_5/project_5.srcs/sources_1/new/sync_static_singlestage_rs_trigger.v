`timescale 1ns / 1ps
module sync_static_singlestage_rs_trigger(r, s, clk, Q);
input r, s, clk;
output Q;
reg Q;

always @(clk, r, s)
begin
    if(!clk)
        Q <= Q;
    else
        case({r,s})
            0: Q <= Q; 
            1: Q <= 1;
            2: Q <= 0;
            3: Q <= 1'bx;
        endcase
end
endmodule
