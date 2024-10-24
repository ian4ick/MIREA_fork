`timescale 1ns / 1ps

module testbench();
reg clk, stop;
reg [1:0] args;
wire f_mux, f_cd_q;
wire [1:0] f_cd;
wire [3:0] f_dc;
reg [0:3] ref_reg, error_reg_mux, error_reg_dc, error_reg_cd;
initial
begin
    stop = 0;
    args = 0;
    clk = 0;
    ref_reg = 2'b0001;
    error_reg_mux = 0;
    error_reg_dc = 0;
    error_reg_cd = 0;
end

always #10 clk = ~clk;

always@(posedge clk)
begin
    error_reg_mux[args] <= (f_mux ~^ ref_reg[args]); 
    if (f_dc[args] == 1)
        error_reg_dc[args] <= 1;
    error_reg_cd[args] <= (f_cd == args || (f_cd_q == 1 && args == 0));
    args <= args + 1;
    if (args == 0)
    begin
        if (stop == 1)
            $finish;
        stop = 1;
    end
end

mux mx(
    .a(args),
    .inputs(ref_reg),
    .enable(1),
    .f(f_mux)
);

dc decoder(
    .in(args),
    .enable(1),
    .f(f_dc)
);

cd coder(
    .in(f_dc),
    .Q(f_cd_q),
    .f(f_cd)
);
endmodule
