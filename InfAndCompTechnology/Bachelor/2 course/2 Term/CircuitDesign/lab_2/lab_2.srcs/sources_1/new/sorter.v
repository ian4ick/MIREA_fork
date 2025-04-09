`timescale 1ns / 1ps
module sorter(
    input clk,
    input R_I,
    input [15:0] in,
    output reg R_O,
    output reg [15:0] out,
    output reg [1:0] err,
    output [5:0] st,
    output [3:0] nn,
    output [15:0] arr1,
    output [15:0] arr2,
    output [15:0] arr3,
    output [3:0] reg_i
);
reg [5:0] state, next_state;
reg [3:0] n, i, j, next_i, next_j;
reg [15:0] reg_in, reg_out, x, y;
reg [15:0] arr [0:15];
reg tmp, tmp2, sync, rin;
reg [4:0] exponent;
reg [9:0] mantissa;

initial
begin
    state <= 0;
    next_i <= 0;
    next_j <= 0;
end
always @(posedge clk) begin
    reg_in <= in;
    rin <= R_I;
    case (state)
        1: n <= reg_in[3:0];
        4: arr[i] <= reg_in;
        11: x <= arr[j];
        14: arr[j] <= arr[j-1];
        16: arr[j] <= x;
        8, 28, 29: out <= (i < n) ? arr[i] : 16'b0;
        default: out <= 16'b0;
    endcase

end
always @*
begin
    next_i <= i;
    next_j <= j;
    case (state)
        0: if (R_I) next_state <= 1; else next_state <= 0;
        1: if (~R_I) begin
            next_state <= 2; 
        end else next_state <= 1;
        2: if (err == 0) 
            next_state <= 3;
        else 
            next_state <= 0;
        3: if (R_I) begin
            if (err == 0 && n > 0) begin
                next_i <= 0;
                next_state <= 4; 
            end else 
                next_state <= 0;
        end else next_state <= 3;
        4: if (~R_I) begin
        if (err == 0)
            next_state <= 5; 
        else
            next_state <= 0;
        end else next_state <= 4;
        5:  if (err == 2) 
                next_state <= 30; 
            else 
                next_state <= 6;
        6: if (R_I) begin
            if (i < n - 1) begin
                next_i <= i + 1;
                next_state <= 4;
            end else
                next_state <= 9;
        end else next_state <= 6;
        7: if (~R_I) begin
            next_i <= 0;
            next_state <= 8;
        end else next_state <= 7;
        8: if (R_I) begin
            if (i < n) begin
                next_state <= 28;
            end else
                next_state <= 0;
        end else next_state <= 8;
        9: begin 
            next_i <= 1;
            next_state <= 10;
        end
        10: begin
        if (i < n) begin
            next_j <= i; 
            next_state <= 11; 
        end else 
            next_state <= 7;
        end
        11: begin
            
            next_state <= 12;
        end
        12: begin if (j > 0 && tmp2) next_state <= 13; 
        else next_state <= 16;
        end
        13: begin
            next_state <= 14;
        end
        14: begin
            
            next_state <= 15;
        end
        15: begin
            next_state <= 12;
            next_j <= j - 1;
        end
        16: begin 
        
        next_state <= 17;
        end
        17: begin 
        next_i <= i + 1;
        next_state <= 10;
        end
        28: if (~R_I) begin
            next_i <= i + 1;
            next_state <= 8; 
        end else next_state <= 28;
        30: if (~R_I) next_state <= 0; else next_state <= 30;
        default: next_state <= 0;

    endcase
end
always @*
begin
    case (state)
    1: err <= 0;
    2: if (reg_in < 16 && reg_in > 0) err <= 0; else err <= 1;
    4: 
        begin
            exponent = reg_in[14:10];
            mantissa = reg_in[9:0];
            tmp = exponent == 5'b00000;
            tmp = tmp &&  mantissa != 10'b0;
            tmp = tmp || exponent == 5'b11111;
            if (tmp)
                err <= 2;
            else
                err <= 0;
        end
    5: begin
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
    default: err <= err;
    endcase
end
always @(posedge clk)
begin
    state <= next_state;
    i <= next_i;
    j <= next_j;
end
always @*
begin
    R_O <= out != 0;
end
always @* begin
    tmp2 = (x[15] > arr[j-1][15]);
    if (!tmp2 && (x[15] == arr[j-1][15])) begin
        tmp2 = (x[14:10] < arr[j-1][14:10]);
        if (!tmp2 && (x[14:10] == arr[j-1][14:10])) begin
            tmp2 = (x[9:0] < arr[j-1][9:0]);
        end
        if (x[15] == 1)
            tmp2 = ~tmp2;
    end
end

assign st = state;
assign nn = n;
assign arr1 = arr[0];
assign arr2 = arr[1];
assign arr3 = arr[2];
assign reg_i = i;
endmodule