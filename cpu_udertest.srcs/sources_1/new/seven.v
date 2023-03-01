`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2023 16:29:44
// Design Name: 
// Module Name: seven
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven(
    input [7:0] in,input clk,reset,output reg [7:0] seg, anode
    );
    
    
    parameter ZERO  = 8'b00000011;  // 0
    parameter ONE   = 8'b10011111;  // 1
    parameter TWO   = 8'b00100101;  // 2 
    parameter THREE = 8'b00001101;  // 3
    parameter FOUR  = 8'b10011001;  // 4
    parameter FIVE  = 8'b01001001;  // 5
    parameter SIX   = 8'b01000001;  // 6
    parameter SEVEN = 8'b00011111;  // 7
    parameter EIGHT = 8'b00000001;  // 8
    parameter NINE  = 8'b00001001;  // 9
    parameter A = 8'b00010001; 
    parameter B = 8'b11000001; 
    parameter C = 8'b01100011;
    parameter D = 8'b10000101;
    parameter E = 8'b01100001;
    parameter F = 8'b01110001;    


    // To select each digit in turn
    reg  digit_select;     // 2 bit counter for selecting each of 4 digits
    reg [16:0] digit_timer;     // counter for digit refresh
    
    // Logic for controlling digit select and digit timer
    always @(posedge clk or posedge reset) begin
        if(~reset) begin
            digit_select <= 0;
            digit_timer <= 0; 
        end
        else                                        // 1ms x 4 displays = 4ms refresh period
            if(digit_timer == 99999) begin         // The period of 100MHz clock is 10ns (1/100,000,000 seconds)
                digit_timer <= 0;                   // 10ns x 100,000 = 1ms
                digit_select <=  digit_select + 1;
            end
            else
                digit_timer <=  digit_timer + 1;
    end
    
    // Logic for driving the 4 bit anode output based on digit select
    always @(digit_select) begin
        case(digit_select) 
            1'b0 : anode = 8'b11111110;   // Turn on ones digit
                    1'b1 : anode = 8'b11111101;   // Turn on tens digit
                    
        endcase
    end
    
    // Logic for driving segments based on which digit is selected and the value of each digit
    always @*
        case(digit_select)
            1'b0 : begin       // ONES DIGIT
                        case(in[3:0])
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            'hA : seg = A;
                            'hB : seg = B;
                            'hC : seg = C;
                            'hD : seg = D;
                            'hE : seg = E;
                            'hF : seg = F;
                        endcase
                    end
                    
            1'b1 : begin       // TENS DIGIT
                        case(in[7:4])
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            'hA : seg = A;
                            'hB : seg = B;
                            'hC : seg = C;
                            'hD : seg = D;
                            'hE : seg = E;
                            'hF : seg = F;
                        endcase
                    end
                    
          
        endcase
endmodule
