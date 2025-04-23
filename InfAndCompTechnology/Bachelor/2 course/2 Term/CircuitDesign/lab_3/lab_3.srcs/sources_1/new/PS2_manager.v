`timescale 1ns / 1ps
module PS2_manager(
    input clk,
    input PS_2_clk,
    input PS_2_data,
    input reset,
    
    output reg R_O,
    output reg [9:0] out
);
reg conf;
wire release_dc, dc_valid, enter_dc;
wire PS2_out_valid; 
wire [7:0] PS2_out;

initial begin
    out = 0;
    R_O = 0;
    conf = 0;
end

PS2_design ps2(
    .clk(clk),
    .reset(reset),
    .PS_2_clk(PS_2_clk), 
    .PS_2_data(PS_2_data),
    .scan_code(PS2_out),
    .valid_out(PS2_out_valid)
);

reg [9:0] out_gen = 0;
wire [3:0] out_dc;

PS2_DC dc(
    .keycode(PS2_out), .clk(clk), .valid_in(PS2_out_valid), .reset(reset),
    .out(out_dc),
    .key_release(release_dc), .valid_out(dc_valid), .enter_release(enter_dc)
);

always@(posedge clk) begin
    conf <= dc_valid && enter_dc;
    if (dc_valid) begin
        if (enter_dc)
            out_gen <= 0;
        else begin
            if (release_dc)
                out_gen <= out_gen;
            else
                out_gen <= {2'b00, out_gen[3:0], out_dc};
        end
    end
    else
        out_gen <= out_gen;
end

always@* begin
    out <= out_gen;
    R_O <= conf;
end

endmodule