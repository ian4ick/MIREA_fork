`timescale 1ns / 1ps
module PS2_design(
    input PS_2_clk,
    input PS_2_data,
    input reset,
    input clk,
    output reg [7:0] scan_code,
    output reg valid_out
);

reg [1:0] ps_2_clk_sync = 2'b11, ps_2_data_sync = 2'b11;

always @(posedge clk) begin
    if(reset) begin
        ps_2_clk_sync <= 0;
        ps_2_data_sync <= 0;
    end
    else begin
        ps_2_clk_sync <= {ps_2_clk_sync[0], PS_2_clk};
        ps_2_data_sync <= {ps_2_data_sync[0], PS_2_data};
    end
end

reg ps_2_clk_ff;

always @(posedge clk) begin
    if(reset)
        ps_2_clk_ff <= 0;
    else
        ps_2_clk_ff <= ps_2_clk_sync[1];
end

wire ps_2_clk_edge;
assign ps_2_clk_edge = (ps_2_clk_sync[1] == 0) && (ps_2_clk_sync[1] != ps_2_clk_ff);

reg [3:0] cnt = 0, next_cnt = 0;

always@(posedge clk) begin
    if (reset) cnt <= 4'd0;
    else cnt <= next_cnt;
end

always@* begin
    if (ps_2_clk_edge) begin
        if(cnt == 4'd10)
            next_cnt <= 4'd0;
        else next_cnt <= cnt + 1;
    end
    else next_cnt <= cnt;
end

reg [2:0] state=0, new_state=0;
parameter WAIT_START_BIT = 0, READ_DATA = 1, CHECK_PARITY = 2, STOP_BIT = 3, EMPTY = 4;

always@(posedge clk) begin
    if(reset) state <= 0;
    else state <= new_state;
end

always@* begin
    if (ps_2_clk_edge) begin
        case(state)
            WAIT_START_BIT:
            begin
                if (~ps_2_clk_sync[1])
                    new_state <= READ_DATA;
                else new_state <= state;
            end
            READ_DATA:
            begin
                if(cnt == 4'd8)
                    new_state <= CHECK_PARITY;
                else new_state <= state;
            end
            CHECK_PARITY:
            begin
                if ((~^scan_code) == ps_2_data_sync[1])
                    new_state <= STOP_BIT;
                else new_state <= EMPTY;
            end
            STOP_BIT:
            begin
                if(ps_2_data_sync[1])
                    new_state <= WAIT_START_BIT;
                else new_state <= EMPTY;
            end
            EMPTY:
            begin
                if(cnt == 4'd10)
                    new_state <= WAIT_START_BIT;
                else new_state <= state;
            end
        endcase
    end
    else
        new_state <= state;
end

reg next_valid;

always@(posedge clk)
begin
    if (reset)
        valid_out <= 1'b0;
    else
        valid_out <= next_valid;
end

always@* begin
    if(ps_2_clk_edge && state == STOP_BIT && ps_2_data_sync[1])
        next_valid <= 1'd1;
    else
        next_valid <= 1'd0;
end

reg [7:0] next_scancode;
always@(posedge clk)
begin
    if (reset)
        scan_code <= 1'b0;
    else
        scan_code <= next_scancode;
end

always@* begin
    if(ps_2_clk_edge && state == READ_DATA)
        next_scancode <= {ps_2_data_sync[1],scan_code[7:1]};
    else
        next_scancode <= scan_code;
end

endmodule
