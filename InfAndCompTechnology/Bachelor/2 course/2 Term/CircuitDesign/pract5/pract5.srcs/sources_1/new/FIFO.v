`timescale 1ns / 1ps
module FIFO#(
    DATA_SIZE = 4,
    MEM_SIZE = 6
)(
    input clk, reset, enable, read_mode, write_mode,
    input [DATA_SIZE-1:0] data_in,
    output reg [DATA_SIZE-1:0] data_out,
    output reg valid_out, full, empty
);
reg [DATA_SIZE-1:0] mem [0:MEM_SIZE-1];
reg [DATA_SIZE-1:0] data_out_next;
reg valid_out_next, full_next, empty_next;
localparam ADDR_SIZE = $clog2(MEM_SIZE);
reg [ADDR_SIZE-1:0] read_pointer, read_pointer_next;
reg [ADDR_SIZE-1:0] write_pointer, write_pointer_next;
// Запись
always @(posedge clk)
begin
    if (!reset && !full && write_mode && enable && !(empty && read_mode))
        mem[write_pointer] <= data_in;
end
// Чтение
always @(posedge clk)
begin
    if (reset) begin
        valid_out <= 0;
    end else
        valid_out <= valid_out_next;
end
always @(posedge clk)
begin
    if (reset) begin
        data_out <= 0;
    end else
        data_out <= data_out_next;
end
always @*
begin
    if ((!empty || empty && write_mode) && !reset && enable && read_mode)
        valid_out_next <= 1;
    else
        valid_out_next <= 0;
end
always @*
begin
    if (!empty && !reset && enable && read_mode)
        data_out_next <= mem[read_pointer];
    else if (empty && !reset && enable && read_mode && write_mode)
        data_out_next <= data_in;
    else
        data_out_next <= data_out;
end
always @(posedge clk)
begin
    if (reset) begin
        read_pointer <= 0;
        write_pointer <= 0;
        full <= 0;
        empty <= 1;
    end else if (enable) begin
        read_pointer <= read_pointer_next;
        write_pointer <= write_pointer_next;
        full <= full_next;
        empty <= empty_next;
    end
end
localparam NONE = 0, READ = 1, WRITE = 2, READ_WRITE = 3;
reg [1:0] operation;
always @*
begin
    case ({write_mode, read_mode})
        2'b01: operation <= (~empty) ? READ : NONE;
        2'b10: operation <= (~full) ? WRITE : NONE;
        2'b11: operation <= READ_WRITE;
            /*case ({full, empty})
                // 2'b01: operation <= WRITE;
                2'b10: operation <= READ;
                default: operation <= READ_WRITE;
            endcase*/   
        default: operation <= NONE;   
    endcase
    case (operation)
        NONE: begin
            read_pointer_next <= read_pointer;
            write_pointer_next <= write_pointer;
            full_next <= full;
            empty_next <= empty;
        end
        READ: begin
            read_pointer_next <= NEXT(read_pointer);
            write_pointer_next <= write_pointer;
            full_next <= 0;
            empty_next <= (read_pointer_next == write_pointer);
        end
        WRITE: begin
            read_pointer_next <= read_pointer;
            write_pointer_next <= NEXT(write_pointer);
            full_next <= (write_pointer_next == read_pointer);
            empty_next <= 0;
        end
        READ_WRITE: begin
            read_pointer_next <= empty ? read_pointer : NEXT(read_pointer);
            write_pointer_next <= empty ? write_pointer : NEXT(write_pointer);
            full_next <= full;
            empty_next <= empty;
        end
    endcase
end
function [ADDR_SIZE-1:0] NEXT (input [ADDR_SIZE-1:0] pointer);
    if (pointer == MEM_SIZE-1)
        NEXT = 0;
    else
        NEXT = pointer + 1;
endfunction
integer i;
initial
begin
    write_pointer <= 0;
    read_pointer <= 0;
    full <= 0;
    empty <= 1;
    data_out <= 0;
    valid_out <= 0;
    for (i=0; i < MEM_SIZE; i = i + 1)
        mem[i] <= 0;
end 
endmodule
