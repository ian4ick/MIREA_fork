`timescale 1ns / 1ps
module test_1();
reg [2:0] a;
reg b;
wire OUT;

reg [2:0] mux_input;
reg xor_out, mux_out;

// FOR TESTING
// integer cnt;

initial
begin
    a = 0;
    b = 0;
    // cnt = -1;
end

always @(a,b)
begin
    mux_input = 0;
    xor_out = 0;
    case (a)
        1: mux_input[0] = 1;
        2: mux_input[1] = 1;
        4: mux_input[2] = 1;
        5: xor_out = 1;
        7: xor_out = 1;
    endcase
    mux_out = b;
    if (b)
    begin
        case (mux_input)
            0: mux_out = xor_out;
            1: mux_out = 1;
            2: mux_out = 0;
            3: mux_out = 0;
            4: mux_out = 1;
            5: mux_out = 1;
            6: mux_out = 0;
            7: mux_out = 0;
        endcase 
    end
end

assign OUT = mux_out;

// FOR TESTING
/*always #10
begin
    cnt = cnt + 1;
    case (cnt)
        0: a = 4;
        1: b = 1;
        2: a = 5;
        3: a = 6;
        4: a = 2;
        5: a = 3;
        6: a = 1;
        default: $finish;
    endcase
end*/
endmodule
