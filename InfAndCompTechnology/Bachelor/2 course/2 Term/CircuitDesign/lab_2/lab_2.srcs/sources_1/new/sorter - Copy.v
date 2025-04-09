`timescale 1ns / 1ps
module sorter(
    input clk,
    input R_I,
    input [15:0] in,
    output reg R_O,
    output reg [15:0] out,
    output reg [1:0] err,
    output reg [5:0] st,
    output reg [3:0] reg_i
);
reg [4:0] state, next_state;
reg [3:0] n, i, j, out_i, input_i, sort_i, sort_j;
reg [15:0] reg_in, reg_out, x, y;
reg [15:0] arr [0:15];
reg tmp, tmp2, sync, rin, tmp3, tmp4, tmp5, tmp6;
reg [4:0] exponent;
reg [9:0] mantissa;

initial
begin
    rin <= 0;
end

always @(R_I)
begin
    if (R_I)
    begin
        reg_in <= in;
        
        tmp3 = 0;
    end else if (~R_I) begin
        tmp3 = 1;
    end
    rin <= R_I;
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
    0: n <= 0;
    1: n <= reg_in[3:0];
    endcase
end
always @*
begin
    case (state)
    4: begin
    arr[i] <= reg_in;
    tmp4 <= 1;
    end
    14: arr[j] <= y;
    16: arr[j] <= x;
    default: tmp4 <= 0;
    endcase
end
always @(state)
begin
// TODO FIX ERR 1 AND ERR 2
    case (state)
        0: if (~R_I) next_state <= 1;
        1: if (R_I & reg_in != 0 & n != 0) next_state <= 2;
        2: next_state <= 3;
        3: if (~R_I) if (err == 0) begin 
                next_state <= 4; 
                input_i <= 0;
            end else next_state <= 20;
        4: if (R_I & tmp5) next_state <= 5;
        5: if (~R_I) if (err == 2) begin
        next_state <= 20; 
        end else begin 
        next_state <= 6;
        tmp6 <= 1;
        end
        6: if (tmp6) begin
            if (i < n) begin
                next_state <= 19;
                input_i <= input_i + 1;
                tmp6 <= 0;
            end else
                next_state <= 9;
        end
        7: begin
            next_state <= 8;
            out_i <= 0;
        end
        8: if (R_I) begin
            if (i < n) begin
                next_state <= 18;
                out_i <= out_i + 1;
            end else
                next_state <= 0;
        end
        9: next_state <= 7;
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
        18: if (~R_I) next_state <= 8;
        19: next_state <= 4;
        20: if (R_I) next_state <= 0;
        default: next_state <= 0;
    endcase
end
always @*
begin
    case (state)
    1: if (R_I) err <= 0;
    2: if (reg_in < 16 && reg_in > 0) err <= 0; else err <= 1;
    4: if (tmp4)
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
            tmp5 <= 1;
        end
    default: tmp5 <= 0;
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
    19: i <= input_i;
    endcase
end
always @*
begin
    R_O <= out != 0;
end
always @(posedge clk)
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
always @* st <= {0, state};
always @* reg_i <= i;
endmodule