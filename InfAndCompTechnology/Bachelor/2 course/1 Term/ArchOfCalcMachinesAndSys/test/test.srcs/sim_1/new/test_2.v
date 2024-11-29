`timescale 1ns / 1ps
module test_2();
reg clk, rst_n, shift_in, t;
reg q;
reg [7:0] shift_reg;

integer cnt;
initial
begin
    clk = 0;
    rst_n = 0;
    shift_in = 0;
    t = 0;
    cnt = -1;
end

always @(posedge clk) 
begin
        if (!rst_n)
            shift_reg <= 8'b0;
        else
            shift_reg <= {shift_reg[6:0], shift_in};
end
always @(posedge clk) begin
    if (!rst_n)
        q <= 1'b0;
    else if (t)
        q <= ~q;
end

always #10
begin
    cnt = cnt + 1;
    case (cnt)
        0: clk = 1;
        1: rst_n = 1;
        2: shift_in = 1;
        3: clk = 0;
        4: clk = 1;
        5: clk = 0;
        6: clk = 1;
        7: shift_in = 0;
        8: clk = 0;
        9: clk = 1;
        10: t = 1;
        11: clk = 0;
        12: clk = 1;
        default: $finish;
    endcase
end

endmodule
