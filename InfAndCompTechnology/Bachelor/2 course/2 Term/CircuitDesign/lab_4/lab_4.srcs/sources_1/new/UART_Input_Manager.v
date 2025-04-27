`timescale 1ns / 1ps

module UART_Input_Manager #
(
	CLOCK_RATE = 100_000_000,
    BAUD_RATE = 9600,
	DIGIT_COUNT = 4
)
(
	input clk,
	input reset,
	input RsRx,
	
	output reg [DIGIT_COUNT * 4 - 1 : 0] out,
	output reg ready_out
);

wire UART_RX_Ready_Out;
wire [7:0] UART_RX_Data_Out;
localparam RX_DATA_SIZE = 8;

UART_RX #(.CLOCK_RATE(CLOCK_RATE), .BAUD_RATE(BAUD_RATE)) uart_rx
(
	.clk(clk),
	.rx(RsRx),
	.UART_RX_Ready_Out(UART_RX_Ready_Out),
	.UART_RX_Data_Out(UART_RX_Data_Out)
);

localparam FIFO_MEM_SIZE = 6;
localparam FIFO_DATA_SIZE = RX_DATA_SIZE;

wire FIFO_write_mode;
assign FIFO_write_mode = UART_RX_Ready_Out;
wire [FIFO_DATA_SIZE-1:0] FIFO_data_in;
assign FIFO_data_in = UART_RX_Data_Out;

reg FIFO_read_mode;
wire [FIFO_DATA_SIZE-1:0] FIFO_data_out;

wire FIFO_empty;
wire FIFO_full;
wire FIFO_valid;

SimpleFIFO #(
	.MEM_SIZE(FIFO_MEM_SIZE),	
    .DATA_SIZE(FIFO_DATA_SIZE)
) 
simpleFIFO(
    .reset(reset),
    .clk(clk),
    .enable(1'b1),
    .read_mode(FIFO_read_mode),
    .write_mode(FIFO_write_mode),
    .data_in(FIFO_data_in),
    .data_out(FIFO_data_out),
    .full(FIFO_full),
    .empty(FIFO_empty),
    .valid(FIFO_valid)
);

localparam ASCII_SIZE = 8;
localparam HEX_SIZE = 4;
wire [ASCII_SIZE-1:0] ASCII_in = FIFO_data_out;
wire [HEX_SIZE-1:0] HEX_out;
ASCII_To_HEX a1(ASCII_in, HEX_out);
reg FIFO_ready_out = 0;

always@(posedge clk)
begin
    if (reset)
        begin
            ready_out <= 0;
            out <= 0;        
            FIFO_read_mode <= 1;
        end
    else
        begin
            if (FIFO_valid)
                begin
                    FIFO_ready_out <= 1;
                    out <= {12'h0, HEX_out};
                end
            else
                begin
                    if (FIFO_ready_out)
                        begin
                            ready_out <= 1;
                            FIFO_ready_out <= 0;
                        end
                    else
                        ready_out <= 0;
                end
        end         
end  

initial
begin
    FIFO_read_mode <= 1;
	out <= 0;
	ready_out <= 0;
end

endmodule