`timescale 1ns / 1ps
module main(
    );
reg clk, R_I;
reg [31:0] numbers;
wire [15:0] LED;

wire [7:0] AN;
wire [6:0] SEG;
reg [15:0] in, min, mean, max;
initial
begin
    #50 $srandom(33985);
    // Установка 3х тестовых чисел
    min = 16'b1111010100010010;
    max = 16'b0111100111010010;
    mean = 16'b0000011000000000;
    clk = 0;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    // Тест на число элементом, превышающее допустимое
    in = 19;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    //Сброс теста
    R_I = 1;
    #300;
    R_I = 0; 
    #300;
    // Тест ввода недопустимого числа
    in = 3;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    in = 16'b1111110000000001;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    // Тест с убывающими значениями
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #3000;
    in = 3;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    in = max;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    in = mean;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    in = min;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #1550;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1; //fjlkdsjfa
    #300
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1; 
    #300
    R_I = 0;
    #300
    R_I = 1;
    #300
    R_I = 0;
    #300
    R_I = 1;
    #300
    // Тест с повторяющимися значениями
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #3000;
    in = 4;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    in = mean;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    in = mean;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    in = min;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    in = max;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #550;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = $random;
        #3;
    end
    R_I = 1;
    #300;
    repeat($urandom_range(30,0)) begin
        R_I = ~$random;
        #3;
    end
    R_I = 0;
    $finish;
end
reg [3:0] number;
always #10
begin
    case (SEG)
        7'b1000000: number = 4'h0;
        7'b1111001: number = 4'h1;
        7'b0100100: number = 4'h2;
        7'b0110000: number = 4'h3;
        7'b0011001: number = 4'h4;
        7'b0010010: number = 4'h5;
        7'b0000010: number = 4'h6;
        7'b1111000: number = 4'h7;
        7'b0000000: number = 4'h8;
        7'b0010000: number = 4'h9;
        7'b0001000: number = 4'ha;
        7'b0000011: number = 4'hb;
        7'b1000110: number = 4'hc;
        7'b0100001: number = 4'hd;
        7'b0000110: number = 4'he;
        7'b0001110: number = 4'hf;
        default: number = 4'hx;
    endcase
    if (~AN[0])
        numbers[3:0] = number;
    if (~AN[1])
        numbers[7:4] = number;
    if (~AN[2])
        numbers[11:8] = number;
    if (~AN[3])
        numbers[15:12] = number;
    if (~AN[4])
        numbers[19:16] = number;
    if (~AN[5])
        numbers[23:20] = number;
    if (~AN[6])
        numbers[27:24] = number;
    if (~AN[7])
        numbers[31:28] = number;
end
always#5 clk=~clk;
up_level up(
    .clk(clk), 
    .btn_c(R_I), 
    .SW(in),
    .AN(AN), 
    .SEG(SEG), 
    .LED(LED)
);
endmodule
