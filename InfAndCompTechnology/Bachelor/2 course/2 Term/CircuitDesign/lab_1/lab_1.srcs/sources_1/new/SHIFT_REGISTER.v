`timescale 1ns / 1ps
module SHIFT_REGISTER #(SIZE = 32)
(
input CLK, ENABLE, [3:0] NEW_VALUE,
output reg [(SIZE - 1) : 0] REG_MEMORY
);

initial
begin
    REG_MEMORY = 0;
end

always @(posedge CLK)
begin
    REG_MEMORY <= ((ENABLE) ? {REG_MEMORY[(SIZE - 4):0], NEW_VALUE} : REG_MEMORY);
end

endmodule
