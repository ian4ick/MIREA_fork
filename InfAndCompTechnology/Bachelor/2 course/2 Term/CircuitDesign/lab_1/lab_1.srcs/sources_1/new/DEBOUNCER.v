`timescale 1ns / 1ps
module DEBOUNCER #(SIZE = 3)
(
input CLK, CLOCK_ENABLE, IN_SIGNAL,
output reg OUT_SIGNAL_ENABLE, OUT_SIGNAL
);

reg [1:0] IN_SIGNAL_SYNCRON;
reg [(SIZE - 1):0] counter;

initial
begin
    IN_SIGNAL_SYNCRON = 0;
    counter = 0;
    OUT_SIGNAL_ENABLE = 0;
    OUT_SIGNAL = 0;
end

always @(posedge CLK)
begin
    IN_SIGNAL_SYNCRON <= {IN_SIGNAL_SYNCRON[0], IN_SIGNAL};
    counter <= (IN_SIGNAL_SYNCRON[1] ~^ OUT_SIGNAL) ?
        {SIZE{1'd0}} : (CLOCK_ENABLE ? counter + 1 : counter);
    OUT_SIGNAL <= ((&(counter) &CLOCK_ENABLE) ? IN_SIGNAL_SYNCRON[1] : OUT_SIGNAL);
    OUT_SIGNAL_ENABLE <= &(counter) &CLOCK_ENABLE &IN_SIGNAL_SYNCRON[1];
end

endmodule
