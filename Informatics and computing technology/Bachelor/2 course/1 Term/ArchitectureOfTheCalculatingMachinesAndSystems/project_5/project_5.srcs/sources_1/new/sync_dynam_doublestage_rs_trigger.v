`timescale 1ns / 1ps
module sync_dynam_doublestage_rs_trigger(r, nr, s, ns, clk, Q);
input r, nr, s, ns, clk;
output Q;
reg Q;
always @(posedge clk, ns, nr)
begin
    case({ns, nr})
        0: Q <= 1'bx;
        1: Q <= 1;
        2: Q <= 0;
        3: begin
            case({r,s})
                0: Q <= Q; 
                1: Q <= 1; 
                2: Q <= 0; 
                3: Q <= 1'bx; 
            endcase
        end
    endcase
end
endmodule
