`timescale 1ns / 1ps
module function_test();
reg clk, stop;
reg [4:0] args;
wire f_mux, f_dc, f_cd;
reg [0:31] ref_reg, error_reg_mux, error_reg_dc, error_reg_cd;
initial
begin
    stop = 0;
    args = 0;
    clk = 0;
    ref_reg = 32'h99e18639;
    error_reg_mux = 0;
    error_reg_dc = 0;
    error_reg_cd = 0;
end

always #10 clk = ~clk;

always@(posedge clk)
begin
    error_reg_mux[args] <= (f_mux ~^ ref_reg[args]); 
    error_reg_dc[args] <= (f_dc ~^ ref_reg[args]);
    error_reg_cd[args] <= (f_cd ~^ ref_reg[args]);
    args <= args + 1;
    if (args == 0)
    begin
        if (stop == 1)
            $finish;
        stop = 1;
    end
end

mux_func mx(
    .x(args),
    .f(f_mux)
);
dc_func dc_f(
    .x(args),
    .f(f_dc)
);
conv_func cd_f(
    .x(args),
    .f(f_cd)
);
endmodule
