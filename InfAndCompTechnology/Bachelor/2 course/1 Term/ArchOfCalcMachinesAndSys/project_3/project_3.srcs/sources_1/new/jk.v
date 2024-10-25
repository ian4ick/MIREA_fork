`timescale 1ns / 1ps
module jk(
    input ns, nr, j, k, clk,
    output Q
);
reg Q;

always  @(posedge clk, ns, nr)
begin
    case({ns,nr})
        0: Q <= 1'bx;
        1: Q <= 1;
        2: Q <= 0;
        3: begin
            case({j,k})
                0: Q <= Q;
                1: Q <= 0;
                2: Q <= 1;
                3: Q <= ~Q;
            endcase
        end
    endcase 
end
    
endmodule
