`timescale 1ns / 1ps
module sorter(
    input clk,
    input R_I,
    input [15:0] in,
    output reg R_O,
    output reg [15:0] out,
    output reg [1:0] err
);
reg [4:0] state, next_state;
reg [3:0] n, i, j, out_i, input_i, sort_i, sort_j;
reg [15:0] reg_in, reg_out, x, y;
reg [15:0] arr [0:15];
reg tmp, tmp2, sync, rin;
reg [4:0] exponent;
reg [9:0] mantissa;


always @(R_I)
begin
    rin <= R_I;
    if (rin < R_I)
    begin
        reg_in <= in;
        
        case (state)
        8: out_i <= out_i + 1;
        default: out_i <= 0;
        endcase
    end else if (rin > R_I) begin
        case (state)
        3: input_i <= 0;
        5: input_i <= input_i + 1;
        endcase
    end
end
always @*
begin
    case (state)
    8: if (i < n) out <= arr[i]; else out <= 0;
    default: out <= 0;
    endcase
end
always @*
begin
    case (state)
    1: n <= reg_in;
    endcase
end
always @*
begin
    case (state)
    4: arr[i] <= reg_in;
    14: arr[j] <= y;
    16: arr[j] <= x;
    endcase
end
always @(posedge clk)
begin
    case (state)
        0: if (~R_I) next_state <= 1;
        1: if (R_I) next_state <= 2;
        2: next_state <= 3;
        3: if (~R_I) if (err == 0) next_state <= 4; else next_state <= 0;
        4: if (R_I) next_state <= 5;
        5: if (~R_I) if (err == 2) next_state <= 0; else next_state <= 6;
        6: begin
            if (i < n)
                next_state <= 4;
            else
                next_state <= 9;
        end
        7: next_state <= 8;
        8: begin
            if (i < n)
                next_state <= 8;
            else
                next_state <= 0;
        end
        9: next_state <= 10;
        10: begin
        if (i < n) next_state <= 11; else next_state <= 7;
        end
        11: next_state <= 12;
        12: begin if (j > 0 && tmp2) next_state <= 13; 
        else next_state <= 16;
        end
        13: next_state <= 14;
        14: next_state <= 15;
        15: next_state <= 12;
        16: next_state <= 17;
        17: next_state <= 10;
        18: next_state <= 0;
        default: next_state <= 0;
    endcase
end
always @*
begin
    case (state)
    1: err <= 0;
    2: if (reg_in < 16) err <= 0; else err <= 1;
    4: 
        begin
            exponent = arr[i][14:10];
            mantissa = arr[i][9:0];
            tmp = exponent == 5'b00000;
            tmp = tmp &&  mantissa != 10'b0;
            tmp = tmp || exponent == 5'b11111;
            if (tmp)
                err <= 2;
            else
                err <= 0;
        end
    endcase
end
always @(state)
begin
    case (state)
    9: sort_i <= 1;
    10: sort_j <= sort_i;
    15: sort_j <= sort_j - 1;
    17: sort_i <= sort_i + 1;
    endcase
end
always @*
begin
    case (state)
    11: x <= arr[j];
    13: y <= arr[j-1];
    endcase
end
always @*
begin
    case (state)
    3: i <= input_i;
    5: i <= input_i;
    7: i <= out_i;
    8: i <= out_i;
    9: i <= sort_i;
    10: j <= sort_j;
    15: j <= sort_j;
    17: i <= sort_i;
    endcase
end
always @*
begin
    R_O <= out != 0;
end
always @*
begin
    state <= next_state;
end
always @*
begin
    tmp2 = x[15] > arr[j-1][15];
    if (~tmp2 && x[15] == arr[j-1][15]) begin
        tmp2 = x[14:10] < arr[j-1][14:10];
        if (~tmp2 && x[14:10] == arr[j-1][14:10]) begin
            tmp2 = x[9:0] < arr[j-1][9:0];
        end
        if (x[15] == 1)
            tmp2 = ~tmp2;
    end
end
endmodule