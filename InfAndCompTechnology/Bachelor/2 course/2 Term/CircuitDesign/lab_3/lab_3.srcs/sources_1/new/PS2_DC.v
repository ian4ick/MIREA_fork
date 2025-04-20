`timescale 1ns / 1ps
module PS2_DC(
    input [7:0] keycode,
    input clk, reset, valid_in,
    output reg [3:0] out,
    output reg valid_out,
    output reg key_release,
    output reg enter_release
);
reg new_key_release;
parameter [7:0] ENTER_CODE = 8'h5A;

initial begin 
    out = 0;
    key_release = 0;
    valid_out = 0;
    enter_release = 0;
end

always@(posedge clk) begin
    if(reset)
        key_release <= 0;
    else
        key_release <= new_key_release;
end

always@* begin
    if(valid_in && keycode == 8'hf0)
        new_key_release <= 1;
    else new_key_release <= 0;
    /*
    if(valid_in && keycode != 8'hf0)
        new_key_release <= 0;
    else
        new_key_release <= key_release;
    */
end

always@(posedge clk) begin
    if(valid_in && !key_release)
        case(keycode)
            8'h45: begin out = 4'h0; valid_out <= 1; enter_release <= 0; end
            8'h16: begin out = 4'h1; valid_out <= 1; enter_release <= 0; end
            8'h1E: begin out = 4'h2; valid_out <= 1; enter_release <= 0; end
            8'h26: begin out = 4'h3; valid_out <= 1; enter_release <= 0; end
            8'h25: begin out = 4'h4; valid_out <= 1; enter_release <= 0; end
            8'h2E: begin out = 4'h5; valid_out <= 1; enter_release <= 0; end
            8'h36: begin out = 4'h6; valid_out <= 1; enter_release <= 0; end
            8'h3D: begin out = 4'h7; valid_out <= 1; enter_release <= 0; end
            8'h3E: begin out = 4'h8; valid_out <= 1; enter_release <= 0; end
            8'h46: begin out = 4'h9; valid_out <= 1; enter_release <= 0; end
            8'h1C: begin out = 4'hA; valid_out <= 1; enter_release <= 0; end
            8'h32: begin out = 4'hB; valid_out <= 1; enter_release <= 0; end
            8'h21: begin out = 4'hC; valid_out <= 1; enter_release <= 0; end
            8'h23: begin out = 4'hD; valid_out <= 1; enter_release <= 0; end
            8'h24: begin out = 4'hE; valid_out <= 1; enter_release <= 0; end
            8'h2B: begin out = 4'hF; valid_out <= 1; enter_release <= 0; end
            ENTER_CODE: begin out = 4'h0; valid_out <= 1; enter_release <= 1; end
            default: 
            begin out = 4'h0; valid_out <= 0; enter_release <= 0; end
         endcase
     else begin out = 4'h0; valid_out <= 0; enter_release <= 0; end
end

endmodule