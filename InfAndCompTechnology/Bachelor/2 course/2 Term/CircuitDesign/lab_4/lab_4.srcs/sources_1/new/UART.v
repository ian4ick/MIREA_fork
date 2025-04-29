`timescale 1ns / 1ns

module UART #
(
    localparam CLOCK_RATE = 100_000_000,
    localparam BAUD_RATE = 9600,
    localparam DIGIT_COUNT = 4
)
(
	input clk,
	input RsRx,
	output RsTx,
	
	output [7:0] AN, [6:0] SEG,
	output DONE,
    output LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8,
    output LED9, LED10, LED11, LED12, LED13, LED14, LED15
);

wire [7:0] element;
wire [7:0] answ;
wire Ready_Input, Ready_Output;
wire reset = 1'b0;

reg [7:0] out_test;

always @(posedge clk)
begin
    if (answ == 0)
        out_test <= element;
    else
        out_test <= answ;
end

UART_Input_Manager #(.DIGIT_COUNT(DIGIT_COUNT)) uart_input_manager 
(
	.clk(clk),
	.reset(reset),
	.RsRx(RsRx),
	.out(element),
	.ready_out(Ready_Input)
);

UART_Output_Manager uart_output_manager 
(
	.clk(clk),
	.reset(reset),
	.ready_in(Ready_Output),
	.data_in(answ),
	.RsTx(RsTx)
);

bucket_sort sorter (
    .clk(clk),
    .data_in(element),
    .R_I(Ready_Input),
    .R_O(Ready_Output),
    .reset(1'b0),
    .done(DONE),
    .led1(LED1),
    .led2(LED2),
    .led3(LED3),
    .led4(LED4),
    .led5(LED5),
    .led6(LED6),
    .led7(LED7),
    .led8(LED8),
    .led9(LED9),
    .led10(LED10),
    .led11(LED11),
    .led12(LED12),
    .led13(LED13),
    .led14(LED14),
    .led15(LED15),
    .data_out(answ)
);

reg [31:0] shift_reg;
reg [7:0] an_mask;

initial
begin
    shift_reg = 0;
    an_mask <= 8'b11111111;
end

always@* begin
    shift_reg <= {24'h0, out_test};
    an_mask <= 8'hf0;
end

wire clk_div_out;
divider #(.divisor(8000)) divide_clk (
    .clk(clk),
    .divided_clk(clk_div_out)
);

Seven_Segment_LED segments (
    .clk(clk_div_out),
    .RESET(~reset),
    .NUMBER(shift_reg),
    .ANOD_MASK(an_mask),
    .ANOD(AN),
    .SEGMENT(SEG)
);

endmodule