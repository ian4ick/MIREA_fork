`timescale 1ns / 1ps

module UART_Output_Manager #
(
	RESULT_SIZE = 4,
	CLOCK_RATE = 100_000_000,
    BAUD_RATE = 9600,
    localparam ASCII_SIZE = 8,
    localparam HEX_SIZE = 4
    
//    localparam ERROR_IN_BIT_SIZE = $clog2(ERROR_COUNT)
    
)
(
	input clk,
	input reset,
	
	input ready_in,
	input [RESULT_SIZE * HEX_SIZE-1:0] data_in,
	
	output RsTx
	
//	input [ERROR_IN_BIT_SIZE-1:0] error_in 
	
);

/*
localparam ERROR_HEX_SIZE = (ERROR_IN_BIT_SIZE % HEX_SIZE == 0) 
                          ? (ERROR_IN_BIT_SIZE / HEX_SIZE) 
                          : (ERROR_IN_BIT_SIZE / HEX_SIZE + 1);
localparam ERROR_HEX_BIT_SIZE = HEX_SIZE * ERROR_HEX_SIZE;
wire [ERROR_HEX_BIT_SIZE - 1 : 0] error_to_send = 
{
    {(ERROR_HEX_BIT_SIZE - ERROR_IN_BIT_SIZE){1'b0}},
    error_in
};
*/

wire [RESULT_SIZE * ASCII_SIZE - 1 : 0] tmp_data;

// wire [ERROR_HEX_SIZE * ASCII_SIZE - 1 : 0] tmp_error;

genvar g;
generate
	for (g = 0; g < RESULT_SIZE; g = g + 1)
	begin
		HEX_To_ASCII hr( 
              data_in[HEX_SIZE * (RESULT_SIZE - g) - 1 -: HEX_SIZE], 
              tmp_data[ASCII_SIZE * (RESULT_SIZE - g) - 1 -: ASCII_SIZE] 
		);
	end
	
	/*
	for (g = 0; g < ERROR_HEX_SIZE; g = g + 1)
	begin
		HEX_To_ASCII hr( 
		      error_to_send[HEX_SIZE * (ERROR_HEX_SIZE - g) - 1 -: HEX_SIZE], 
		      tmp_error[ASCII_SIZE * (ERROR_HEX_SIZE - g) - 1 -: ASCII_SIZE]
		);
	end
	*/
		
endgenerate

reg [2:0] state;
localparam RESET = 0, PREPARE_DATA = 1, SEND_DATA = 2;
localparam RESULT_TITLE_SIZE = 8;
localparam RESULT_CHAR_ARRAY_SIZE = RESULT_TITLE_SIZE + RESULT_SIZE + 2;   
reg [ASCII_SIZE * RESULT_CHAR_ARRAY_SIZE - 1:0] result_char_array;
localparam END_SEQ_SIZE = 2;

reg [3:0] char_counter;
reg [3:0] char_max_index;
reg package_ready;
reg [ASCII_SIZE-1:0] package_out;
integer i;

// reg error_mode;

initial 
begin
	result_char_array[ASCII_SIZE * 
	RESULT_CHAR_ARRAY_SIZE - 1 -: ASCII_SIZE * RESULT_TITLE_SIZE] = "Result: ";
	result_char_array[ASCII_SIZE * END_SEQ_SIZE - 1 : 0] = 16'h0D0A;
	
	char_counter <= 0;
	char_max_index <= 0;
	
	package_out <= 0;
	package_ready <= 0;
	
	state <= RESET;
	
	
//  error_char_array[ASCII_SIZE * 
//  ERROR_CHAR_ARRAY_SIZE - 1 -: ASCII_SIZE * ERROR_TITLE_SIZE] = "Error: ";
//	error_char_array[ASCII_SIZE * (END_SEQ_SIZE + ERROR_AFTER_SIZE) - 1 -: ASCII_SIZE * 
//  ERROR_AFTER_SIZE] = "!";
//	error_char_array[ASCII_SIZE * END_SEQ_SIZE - 1 : 0] = 16'h0D0A;
	
//	error_mode <= 0;
	
end

always@(posedge clk)
begin: main_block
	case(state)
		RESET:
			begin
				char_counter <= 0;
				char_max_index <= 0;
				package_out <= 0;
	            package_ready <= 0;
				state <= PREPARE_DATA;
				
//				error_mode <= 0;
				
			end
		PREPARE_DATA:
			if (ready_in)
				begin
				
					begin
						for (i = 0; i < RESULT_SIZE; i = i + 1)
							result_char_array[ASCII_SIZE * 
							(RESULT_CHAR_ARRAY_SIZE - RESULT_TITLE_SIZE - i) - 
							1 -: ASCII_SIZE] 
								<=  tmp_data[ASCII_SIZE * (RESULT_SIZE - i) - 
								1 -: ASCII_SIZE];
						char_max_index <= RESULT_CHAR_ARRAY_SIZE - 1;
					end
					
					state <= SEND_DATA;
					
					/*
					if (error_to_send == 0)
						begin
							// ?????? ??????? ?? ??????? ????????????? ??????
							for (i = 0; i < RESULT_SIZE; i = i + 1)
								result_char_array[ASCII_SIZE * (RESULT_CHAR_ARRAY_SIZE - 
								RESULT_TITLE_SIZE - i) - 1 -: ASCII_SIZE] 
									<=  tmp_data[ASCII_SIZE * 
									(RESULT_SIZE - i) - 1 -: ASCII_SIZE];
							char_max_index <= RESULT_CHAR_ARRAY_SIZE - 1;
						end
					else
						begin
							for(i = 0; i < ERROR_HEX_SIZE; i = i + 1)
								error_char_array[ASCII_SIZE * (ERROR_CHAR_ARRAY_SIZE - 
								ERROR_TITLE_SIZE - i) - 1 -: ASCII_SIZE] 
									<=  tmp_error[ASCII_SIZE * 
									(ERROR_HEX_SIZE - i) - 1 -: ASCII_SIZE];
							char_max_index <= ERROR_CHAR_ARRAY_SIZE - 1;
							error_mode <= 1;
						end
					state <= SEND_DATA;
                    */
					
				end
			
		SEND_DATA:
			begin
				package_ready <= 1;
				
				package_out <= result_char_array[ASCII_SIZE * 
				(RESULT_CHAR_ARRAY_SIZE - char_counter) - 1 -: ASCII_SIZE];
				
				/*
				package_out <= error_mode ? error_char_array[ASCII_SIZE * 
				(ERROR_CHAR_ARRAY_SIZE - char_counter) - 1 -: ASCII_SIZE] 
				: result_char_array[ASCII_SIZE * 
				(RESULT_CHAR_ARRAY_SIZE - char_counter) - 1 -: ASCII_SIZE];
				*/
				
				char_counter <= char_counter + 1;
				if (char_counter == char_max_index)
					begin
						state <= RESET;
					end
			end
	endcase
end

localparam FIFO_MEM_SIZE = RESULT_CHAR_ARRAY_SIZE;
localparam FIFO_DATA_SIZE = ASCII_SIZE;
wire FIFO_write_mode;
assign FIFO_write_mode = package_ready;
wire [FIFO_DATA_SIZE-1:0] FIFO_data_in;
assign FIFO_data_in = package_out;
wire FIFO_read_mode;
wire [FIFO_DATA_SIZE-1:0] FIFO_data_out;
wire FIFO_empty;
wire FIFO_full;

SimpleFIFO #(
	.MEM_SIZE(FIFO_MEM_SIZE),	
    .DATA_SIZE(FIFO_DATA_SIZE)
) 
simpleFIFO(
    .enable(1'b1),
    .reset(reset),
    .clk(clk),
    .read_mode(FIFO_read_mode),
    .write_mode(FIFO_write_mode),
    .data_in(FIFO_data_in),
    .data_out(FIFO_data_out),
    .full(FIFO_full),
    .empty(FIFO_empty),
    .valid(FIFO_valid)
);

wire UART_Ready_To_Send;
assign FIFO_read_mode = UART_Ready_To_Send & !FIFO_valid;

wire UART_TX_Ready_In = FIFO_valid;
wire [7:0] UART_TX_Data_In = FIFO_data_out;

UART_TX #(.CLOCK_RATE(CLOCK_RATE), .BAUD_RATE(BAUD_RATE)) uart_tx
(
	.clk(clk),
	.UART_TX_Ready_In(UART_TX_Ready_In),
	.UART_TX_Data_In(UART_TX_Data_In),
	.idle(UART_Ready_To_Send),
	.tx(RsTx)
);

endmodule

