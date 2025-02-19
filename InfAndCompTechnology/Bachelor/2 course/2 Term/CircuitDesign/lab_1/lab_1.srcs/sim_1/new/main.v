`timescale 1ns / 1ps
module main();
reg clk, sync;
reg [3:0] val;
wire [7:0] anods;
wire [6:0] segments;

integer count;
initial
begin
    clk = 0;
    val = 7;
    sync = 1;
    count = -1;
end
always #10 clk = ~clk;

always @(posedge clk)
begin
    count = count + 1;
    case(count)
        30: sync = 0;
        31: val = 8;
        62: sync = 1;
        90: sync = 0;
        91: val = 6;
        122: sync = 1;
        150: sync = 0;
        151: val = 9;
        182: sync = 1;
        210: sync = 0;
        211: val = 6;
        240: sync = 1;
        270: sync = 0;
        271: val = 2;
        302: sync = 1;
        330: sync = 0;
        331: val = 1;
        360: sync = 0;
        390: sync = 1;
        391: val = 0;
        420: sync = 1;
    endcase
end

up_level display(
    .clk(clk),
    .btn_c(sync),
    .SW(val),
    .AN(anods),
    .SEG(segments)
);
endmodule
