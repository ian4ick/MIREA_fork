`timescale 1ns / 1ps
module d_trigger(
input D, C,
output Q
    );
assign Q = (C & D) | (~C & Q);  
endmodule
