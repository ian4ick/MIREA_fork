`timescale 1ns / 1ps
module test_division();

wire [3:0] Res_;
wire [3:0] Remains_;
wire R_O_;
wire [2:0] ERR_;
integer arc = 0;
reg R_I_ = 0;
reg reset_ = 0;
reg clk_ = 0;
reg [9:0] dataIn_;
integer test = 1;

always #1 clk_=~clk_;
    
always@(posedge clk_)
begin
    case(test)
    1:
        begin
            #1
            R_I_ = 1;
            dataIn_ = 10'b10000;
            #3
            dataIn_ = 10'b100;
            #3
            R_I_=0;
            while (R_O_ == 0 && ERR_ == 0)
                #1
            begin    
            end
            reset_ = 1;
            test = 2;
            #2;
            reset_ = 0;
        end
    2:
        begin
           #1
            R_I_ = 1;
            dataIn_ = 10'b10010;
            #3 
            dataIn_ = 10'b100;
            #3
            R_I_=0;
            while (R_O_ == 0 && ERR_ == 0)
                #1
            begin    
            end
            reset_ = 1;
            test = 3;
            #2;
            reset_ = 0;
        end
    3:
        begin
           #1
            R_I_ = 1;
            dataIn_ = 10'b111;
            #3 
            dataIn_ = 10'b1000;
            #3
            R_I_=0;
            while (R_O_ == 0 && ERR_ == 0)
                #1
            begin    
            end
            reset_ = 1;
            test = 4;
            #2;
            reset_ = 0;
        end
    4:
        begin
           #1
            R_I_ = 1;
            dataIn_ = 10'b111;
            #3 
            dataIn_ = 10'b0;
            #3
            R_I_=0;
            while (R_O_ == 0 && ERR_ == 0)
                #1
            begin    
            end
            reset_ = 1;
            test = 5;
            #2;
            reset_ = 0;
        end
    5:
        begin
           #1
            R_I_ = 1;
            dataIn_ = 10'b111111111;
            #3 
            dataIn_ = 10'b1111;
            #3
            R_I_=0;
            while (R_O_ == 0 && ERR_ == 0)
                #1
            begin    
            end
            reset_ = 1;
            test = 6;
            #2;
            reset_ = 0;
        end   
    6:
        begin
           #1
            R_I_ = 1;
            dataIn_ = 10'b111;
            #3 
            dataIn_ = 10'b11111;
            #3
            R_I_=0;
            while (R_O_ == 0 && ERR_ == 0)
                #1
            begin    
            end
            reset_ = 1;
            test = 7;
            #2;
            reset_ = 0;
        end
    7:
        begin
           #1
            R_I_ = 1;
            dataIn_ = 10'b111111;
            #3 
            dataIn_ = 10'b1;
            #3
            R_I_=0;
            while (R_O_ == 0 && ERR_ == 0)
                #1
            begin    
            end
            reset_ = 1;
            test = 0;
            #2;
            reset_ = 0;
            $finish;
        end
    endcase
end
Division del
(
    .dataIn(dataIn_),
    .R_I(R_I_),
    .reset(reset_),
    .clk(clk_),
    .Res(Res_),
    .Remains(Remains_),
    .R_O(R_O_),
    .ERR(ERR_)
);

endmodule