`timescale 1ns / 1ps
module main();
reg clk;
reg [3:0] data;
reg [1:0] addr;
integer cnt;
wire [1:0] enc_out;
wire y;
initial
begin
    clk = 0;
    cnt = -1;
    data = 0;
    addr = 0;
end

always #10
begin
    cnt = cnt + 1;
    case (cnt)
        0: clk = 1;
        
        default: $finish;
    endcase
end

var10_1 schema(
    .data(data),
    .addr(addr),
    .y(y),
    .enc_out(enc_out)
);
endmodule
