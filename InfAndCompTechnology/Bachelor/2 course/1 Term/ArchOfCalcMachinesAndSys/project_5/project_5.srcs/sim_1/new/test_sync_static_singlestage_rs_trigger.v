`timescale 1ns / 1ps
module test_sync_static_singlestage_rs_trigger();
reg r, s, clk;
reg [4:0] args;
wire Q;
initial
begin
    args = 0;
    r = 0; 
    s = 0;
    clk = 0;
end
always #50 args = args + 1;
always@(args)
begin
    clk = args[2] || args[3];
    if (args < 3 || (args > 4 && args < 7))
    begin
        s = args[0];
        r = args[1];
    end
    else
    begin
        if(args == 3 || args == 7)
        begin 
            r = 0;
            s = 0; 
        end
        if(args == 4 || args >= 8)
        begin
            if(args == 9)
                $finish; 
            r = 1; 
            s = 1; 
        end
    end
end


sync_static_singlestage_rs_trigger tmp(
    .clk(clk),
    .r(r),
    .s(s),
    .Q(Q)
);
endmodule
