`timescale 1ns / 1ps

module UART_TX # 
(
	parameter CLOCK_RATE = 100_000_000,
	parameter BAUD_RATE = 9600
)
(
	input clk,
	input [7:0] UART_TX_Data_In,
	input UART_TX_Ready_In,
	output reg tx,
	output reg idle
);
reg [7:0] data_buf;
reg [$clog2(CLOCK_RATE / BAUD_RATE):0] baud_counter;
reg [3:0] bit_counter;
wire baud_flag;
assign baud_flag = baud_counter == CLOCK_RATE / BAUD_RATE;
reg [1:0] state;
localparam RESET = 0, WAIT_READY_IN = 1, SEND_DATA = 2;

initial 
begin
	state = RESET;
	tx <= 1; 
	data_buf <= 0;
	baud_counter <= 0;
	bit_counter <= 0;
	idle <= 1;	
end
always@ (posedge clk)
begin
	case(state)
		RESET:
			begin
				bit_counter <= 0;
				baud_counter <= 0;
				tx <= 1;
				
				idle <= 1;
				state <= WAIT_READY_IN;
			end
			
		WAIT_READY_IN:
            if (UART_TX_Ready_In) 
                begin
					idle <= 0;
                    data_buf <= UART_TX_Data_In;
                    tx <= 0;
                    state <= SEND_DATA;
                end
		SEND_DATA:
            if (baud_flag)
                begin
                    if (bit_counter == 8)
                        tx <= 1;
                    else if (bit_counter == 9)
                        baud_counter <= 0;
                    else if (bit_counter == 10)
                        state <= RESET;
                    else
                        tx <= data_buf[bit_counter];
                    bit_counter <= bit_counter + 1;
                    baud_counter <= 0;
                end
            else
                baud_counter <= baud_counter + 1;  
	endcase
end
endmodule