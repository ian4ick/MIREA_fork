`timescale 1ns / 1ps

module jk_test();
reg ns, nr, j, k, clk;
reg [2:0] args;
wire Q;
initial
begin
    ns = 0;
    nr = 0;
    j = 0;
    k = 0;
    clk = 0;
    args = 1;
end

always #10 clk = ~clk;
always #40
begin
    if (args < 4)
    begin
        ns = args[1];
        nr = args[0];
    end
    case(args)
        4: begin j = 1; k = 0; end
        5: begin j = 0; k = 1; end
        6: begin j = 1; k = 1; end
    endcase
    args = args + 1;
    if (args == 0)
        $finish;
end

jk f(
    .ns(ns),
    .nr(nr),
    .j(j),
    .k(k),
    .clk(clk),
    .Q(Q)
);
endmodule
