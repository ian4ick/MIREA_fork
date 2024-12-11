`timescale 1ns / 1ps
module main();
reg clk;
reg in, c_en, goal;
wire out_s;
initial
begin
    clk = 0;
    c_en = 0;
    goal = 1;
    repeat(8)
    begin
        #50 $srandom(33985);
        repeat($urandom_range(300,0))
        begin
            if (goal)
                in = $random;
            else
                in = ~$random;
            #3;
        end
        #1000;
        goal = ~goal;
    end
end
always #5 clk = ~clk;

operator op(
    .clk(clk),
    .in_signal(in),
    .out_signal(out_s)
);
endmodule
