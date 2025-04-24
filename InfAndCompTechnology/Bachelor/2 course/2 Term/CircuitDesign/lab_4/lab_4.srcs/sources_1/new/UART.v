`timescale 1ns / 1ps
module UART#
(
    localparam CLOCK_RATE = 100_000_000, // ������� ���� XC7A100T-1CSG324 ��������� Artix-7 (� ��)
    localparam BAUD_RATE = 9600,	// �������� �������� ������ �� UART (� ���)
    localparam ERROR_COUNT = 3, // ���������� ��������� ������ ��������� ��������
    localparam DIGIT_COUNT = 4 // ����������� ������� ������, �������������� � 16-������ ����
)
(
	input clk,		// ������������
	input RsRx,	 	// ��� ����������� ������ (UART_RX)
	output RsTx 	// ��� ������������ ������ (UART_TX)	
);

// FSM
wire [15:0] FSM_Data_Input;	  // ���� ������� ������ ��������
wire FSM_Ready_Input;		  // ������ � ���, ��� ������ �� ����� �������� ������������
wire FSM_Ready_Output;		  // ������ � ���, ��� ������ �� ������ �������� ������������
wire [15:0] FSM_Data_Output;  // ���� �������� ������ ��������
wire [1:0] FSM_Error_Output;  // ���� ������ �� ������ ��������
wire reset = 1'b0;

// �������, ������������ ������������ ������� ������ � UART
UART_Input_Manager #(.DIGIT_COUNT(DIGIT_COUNT)) uart_input_manager 
(
	.clk(clk), 		// ���� �������������
	.reset(reset),
	.RsRx(RsRx),
	.out(FSM_Data_Input),// ����� �� ��������� ��� ����� ��������� ��������
	.ready_out(FSM_Ready_Input)	// ����� - ������ � ���, ��� ������ �� ������ <number_out> ������������
);
// �������, ������������ ������������ �������� ������ �� UART
UART_Output_Manager #(.ERROR_COUNT(ERROR_COUNT)) uart_output_manager 
(
	.clk(clk), // ����: ������������
	.reset(reset),
	.ready_in(FSM_Ready_Output), // ����: ������ � ���, ��� ������ ��� �������� �� UART ������������
	.data_in(FSM_Data_Output),   // ����: ������ ��� �������� �� UART
	.error_in(FSM_Error_Output), // ����: ������ �� ������� ��� �������� �� UART
	.RsTx(RsTx)
);
fsm #(16) FSM(
	.clk(clk),
	.R_I(FSM_Ready_Input),
	.reset(0),
	.R_O(FSM_Ready_Output),
	.dataIn(FSM_Data_Input),
	.dataOut(FSM_Data_Output),
	.error(FSM_Error_Output)
);
endmodule
