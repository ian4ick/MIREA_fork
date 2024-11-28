`timescale 1ns / 1ps
module demo_1(    );
reg clk, b, en, C, E, A, D;
wire Q, O2, OUT;
reg shift_out, mux_out;
reg d_state;
reg [7:0] shifter;
integer cnt;
reg clkk;
reg dmx_out0;
initial 
begin
    clk = 0;
    b = 0;
    en = 0;
    C = 0;
    E = 0;
    A = 0;
    D = 0;
    d_state = 0;
    shifter = 0;
    cnt = -1;
    clkk = 0;
end
always @(posedge clk)
begin
    shift_out = shifter[0];
    shifter = shifter >> 1;
    shifter[7] = ~d_state;
    d_state = (d_state & ~en) | (b & en);
    
end
always @(A, D, C, E)
begin
    dmx_out0 = A & ~D;
    mux_out = A & ((dmx_out0 & ~E) | (C & E));
end
always #10 clkk = ~clkk;
always @(clkk)
begin
   cnt = cnt + 1;
   if (cnt < 20)
   begin
    clk = ~clk;
    clk = ~clk;
   end
    
   case (cnt)
    3: b = 1;
    4: en = 1;
    5: en = 0;
    6: b = 0;
    9: en = 1;
    21: E = 1;
    22: A = 1;
    23: C = 1;
    24: D = 1;
    25: E = 0; 
    endcase
end
assign O2 = A & D;
assign OUT = shift_out & mux_out;
assign Q = d_state;

endmodule
