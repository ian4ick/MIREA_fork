`timescale 1ns / 1ps

module main(    );
reg clk;
integer cnt;
reg [2:0] a;
wire [1:0] state_mealy;
wire [2:0] state_moore;
wire out_mealy, out_moore;
initial
begin
    clk = 0;
    a = 0;
    cnt = 0;
end
always #10 clk = ~clk;

always @(posedge clk)
begin
    cnt = cnt + 1;
    case (cnt)
        1: a = 0;
        2: a = 2;
        3: a = 1;
        4: a = 0;
        5: a = 1;
        6: a = 0;
        7: a = 5;
        8: a = 0;
        9: a = 1;
        10: a = 2;
        11: a = 2;
        12: a = 4;
        13: a = 3;
        14: a = 4;
        15: a = 4;
        16: a = 0;
        17: a = 4;
        18: a = 4;
        19: a = 1;
        20: a = 3;
        21: a = 3;
        22: a = 0;
        23: a = 1;
        24: a = 1;
        25: a = 1;
        26: a = 2;
        27: a = 1;
        28: a = 6;
        29: a = 1;
        30: a = 0;
        31: a = 1;
        32: a = 0;
        33: a = 3;
        34: a = 5;
        35: a = 6;
        36: a = 0;
        default: $finish;
    endcase
end

mealy me(
    .clk(clk),
    .a(a),
    .b(state_mealy),
    .d(out_mealy)
    );
    
moore mo(
    .clk(clk),
    .a(a),
    .b(state_moore),
    .d(out_moore)
);
endmodule
