`timescale 1ns / 1ps
module d_trigger(d, clk, Q);
input d, clk;
output Q;
reg Q;
always @(clk, d)
begin
    if(!clk)
        Q <= Q;
    else
        case(d)
            0: Q <= 0; 
            1: Q <= 1;
        endcase
end
endmodule
