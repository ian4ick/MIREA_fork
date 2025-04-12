`timescale 1ns / 1ps
module Division(
    input [9:0] dataIn,
    input R_I,
    input reset,
    input clk,
    output [3:0] Res,
    output [3:0] Remains,
    output reg R_O,
    output [2:0] ERR
);

parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8;

reg [0:3] state;
reg [0:9] REG_Divisible;
reg [0:9] REG_Divider;
reg [0:9] REG_Res;
reg [0:9] REG_Remains;
reg [2:0] REG_ERR;
reg [3:0] REG_i;
reg [0:9] REG_partial;

initial 
begin 
    state = S0;
    REG_Divisible = 1'b0;
    REG_Divider = 1'b0;
    REG_Res = 1'b0;
    REG_Remains = 1'b0;
    REG_ERR = 0;
    R_O = 0;
    REG_i = 0;
    REG_partial = 1'b0;
end

always @(posedge clk)
begin
    if (reset)
        state <= S0;
    else 
        case(state)
        S0:
            begin
                REG_Divisible = 1'b0;
                REG_Divider = 1'b0;
                REG_Res = 1'b0;
                REG_Remains = 1'b0;
                REG_ERR = 0;
                R_O = 0;
                REG_i = 0;
                REG_partial = 1'b0;
                state <= S1;
            end
        S1:
            if (R_I)
            begin
                REG_Divisible = dataIn;
                state <= S2;
            end
        S2:
            if (REG_Divisible > 8'b11111111)
                REG_ERR <= 2;
            else
                state <= S3;
        S3:
            if (R_I)
            begin
                REG_Divider = dataIn;
                state <= S4;
            end
        S4:
            if (REG_Divider == 0)
                REG_ERR <= 1;
            else
                state <= S5;
        S5:
            if (REG_Divider > 4'b1111)
                REG_ERR <= 3;
            else
                state <= S6;
        S6:
            if (REG_i == 10)
                begin
                    REG_Remains = REG_partial;
                    state <= S8;
                end
            else
                begin
                    REG_partial = REG_partial<<1;
                    REG_partial[9] = REG_Divisible[REG_i];
                    REG_Divisible[REG_i] = 0;
                    state <=S7;
                end
        S7:
            if (REG_partial >= REG_Divider)
                begin
                    REG_Res = REG_Res <<1;
                    REG_Res[9] = 1;
                    REG_partial <= REG_partial - REG_Divider;
                    REG_i = REG_i + 1;
                    state = S6;
                end
            else
                begin
                    REG_Res = REG_Res <<1;
                    REG_Res[9]=0;
                    REG_i = REG_i + 1;
                    state = S6;
                end
        S8:
            if (REG_Res > 4'b1111)
                REG_ERR = 4;
            else
            begin
                R_O <= 1;
            end
    endcase
end

assign Res = REG_Res;
assign Remains = REG_Remains;
assign ERR = REG_ERR;

endmodule
