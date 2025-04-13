`timescale 1ns / 1ps
module PS2_manager(
    input clk,
    input PS_2_clk,
    input PS_2_data,
    input reset,
    
    output reg R_O,
    output [7:0] out,
    output [1:0] flags
);
parameter WAIT_ONE = 0, WAIT_ZERO = 1;
reg state;
reg release_flag;

wire PS2_out_valid; 
wire [7:0] PS2_out;

initial begin
    state = 0; R_O = 0;
    release_flag = 0;
end

always@(posedge clk)
begin
    if(reset) begin
        state <= 0;
        R_O <= 0;
        release_flag <= 0;
    end
    else begin
        case(state)
            WAIT_ONE: begin
                if (PS2_out_valid) begin
                    if (PS2_out == 8'hF0)
                        release_flag <= 1;
                    else if (release_flag)
                    begin
                        R_O <= 1;
                        release_flag <= 0;
                    end
                    else begin
                        R_O <= R_O;
                        release_flag <= release_flag;
                    end
                    state <= WAIT_ZERO;     
                end
                else state <= state;
            end
            WAIT_ZERO: begin
                R_O <= 0; 
                if (!PS2_out_valid) 
                    state <= WAIT_ONE;  
                else
                    state <= state;
            end       
       endcase
   end  
end

PS2_design ps2(
    .clk(clk),
    .reset(reset),
    .PS_2_clk(PS_2_clk), 
    .PS_2_data(PS_2_data),
    .scan_code(PS2_out),
    .valid_out(PS2_out_valid)
);

reg [7:0] out_gen = 0;
wire [3:0] out_dc;

PS2_DC dc(
    .keycode(PS2_out),
    .out(out_dc),
    .flags(flags)
);

always@* begin
    if (!flags[1]) begin
        if (flags[0])
            out_gen <= {out_gen[3:0], out_dc};
        else
            out_gen <= out_gen;
    end
    else
        out_gen <= out_gen;
end

assign out = out_gen;

endmodule
