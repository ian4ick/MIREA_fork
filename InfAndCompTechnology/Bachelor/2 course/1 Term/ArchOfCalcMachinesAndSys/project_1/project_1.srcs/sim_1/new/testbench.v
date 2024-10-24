`timescale 1ns / 1ps

module testbench();
reg clk;
reg [4:0] args;
wire sdnf, mdnf;
reg [31:0] ref_reg, error_reg_sdnf, error_reg_mdnf;

initial
begin
    ref_reg = 32'h99e18639;
    args = 0;
    clk = 0;
    error_reg_sdnf = 0;
    error_reg_mdnf = 0;
end

always #10 clk = ~clk;

always@(posedge clk)
begin
    error_reg_sdnf[args] <= (sdnf ~^ ref_reg[31 - args]);
    error_reg_mdnf[args] <= (mdnf ~^ ref_reg[31 - args]);
    args <= args + 1;
    if (args == 32)
        $finish;
end

main mod_f(
    .x(args) ,
    .f_sdnf(sdnf),
    .f_mdnf(mdnf)
);
endmodule
