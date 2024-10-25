`timescale 1ns / 1ps
module rs_test();
reg r,s, clk;
reg [1:0] args;
wire Q;
initial
begin
    args = 2;
    r = 0;
    s = 0;
    clk = 0;
end

always #10 clk = ~clk;
always @(posedge clk)
begin
    r = args[1];
    s = args[0];
    args = args - 1;
    if (args == 2)
    begin
        $finish;
    end
        
end
rs f(
    .r(r),
    .s(s),
    .Q(Q)
);
endmodule
