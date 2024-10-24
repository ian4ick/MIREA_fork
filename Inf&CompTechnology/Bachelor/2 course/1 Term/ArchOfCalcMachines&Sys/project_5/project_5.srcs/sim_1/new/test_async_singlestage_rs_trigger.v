`timescale 1ns / 1ps
module test_async_singlestage_rs_trigger();
reg r, s;
reg [2:0] args;
wire Q;
initial
begin
    args = 0;
    r = 0; 
    s = 0;
end

always #100
begin
    if (args < 2)
    begin
        args = args + 1;
        s = args[0];
        r = args[1];
    end
    else
    begin
        case(args)
            2: begin r = 0; s = 0; args = args + 1; end
            3: begin r = 1; s = 1; args = args + 1; end
            4: $finish;
        endcase
    end
end

/*
always
begin
    #100 s = 1; r = 0; args = args + 1;
    #100 s = 0; r = 1; args = args + 1;
    #100 s = 0; r = 0; args = args + 1;
    #100 s = 1; r = 1; args = args + 1;
    #100 s = 1; r = 0; args = args + 1;
    #100 s = 0; r = 0; args = args + 1;
    #100 s = 0; r = 1; args = args + 1;
    $finish;
end
*/
async_singlestage_rs_trigger tmp(
    .r(r),
    .s(s),
    .Q(Q)
);
endmodule
