`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Thomas Kappenman
// 
// Create Date: 03/03/2015 09:06:31 PM
// Design Name: 
// Module Name: top
// Project Name: Nexys4DDR Keyboard Demo
// Target Devices: Nexys4DDR
// Tool Versions: 
// Description: This project takes keyboard input from the PS2 port,
//  and outputs the keyboard scan code to the 7 segment display on the board.
//  The scan code is shifted left 2 characters each time a new code is
//  read.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module keyboard_seq(
    input CLK100MHZ,
    input PS2_CLK,RST,
    input PS2_DATA,
    output [7:0]SEG,
    output [7:0]AN,
    output [3:0] out,
    output ready,
    output [7:0] print,
    output [7:0] hex1,hex2
    //output UART_TXD
    );
    
reg CLK50MHZ=0;    
wire [31:0]keycode;
wire [3:0] char_op1,char_op2,char_op3,char_op4;

wire [7:0] op1,op2;
bin2hex b1(op1,hex1);
bin2hex b2(op2,hex2);
//wire [7:0] print;
always @(posedge(CLK100MHZ))begin
    CLK50MHZ<=~CLK50MHZ;
end

/*ila_0 your_instance_name (
	.clk(CLK100MHZ), // input wire clk


	.probe0(print), // input wire [7:0]  probe0  
	.probe1(out) // input wire [3:0]  probe1
);*/
/*ila_0 your_instance_name1 (
	.clk(CLK100MHZ), // input wire clk


	.probe0(op1), // input wire [7:0]  probe0  
	.probe1(op2), // input wire [7:0]  probe1 
	.probe2(out) // input wire [3:0]  probe2
);*/

wire [7:0] ascii_op1,ascii_op2,ascii_op3,ascii_op4;
//reg [7:0] char_op1,char_op2;

/*ila_0 your_instance_name (
	.clk(CLK100MHZ), // input wire clk


	.probe0(char_op1), // input wire [7:0]  probe0  
	.probe1(char_op2) // input wire [7:0]  probe1
);*/


PS2Receiver keyboard (
.clk(CLK50MHZ),
.kclk(PS2_CLK),
.kdata(PS2_DATA),
.keycodeout(keycode[31:0])
);



//sequence detector
sequence_detect ss(CLK100MHZ,RST,print,out,ascii_op1,ascii_op2,ascii_op3,ascii_op4,ready);
//operand conversion from ascii to character
ascii2char a2c1(ascii_op1,char_op1);
ascii2char a2c2(ascii_op2,char_op2);
ascii2char a2c3(ascii_op3,char_op3);
ascii2char a2c4(ascii_op4,char_op4);
/*seg7decimal sevenSeg (
.x(keycode[31:0]),
.clk(CLK100MHZ),
.seg(SEG[6:0]),
.an(AN[7:0]),
.dp(DP) 
); */
 //wire [11:0] sw;
 //assign sw={ou[7:6],1'b1,ou[5:4],1'b1,ou[3:2],1'b1,ou[1:0],1'b1};
 /*reg [11:0] sw;
 initial
 sw={ou[7:6],1'b1,ou[5:4],1'b1,ou[3:2],1'b1,ou[1:0],1'b1}; */
 //vga_test v1(CLK100MHZ,RST,sw,hsync,vsync,rgb);

 
 
 
 
 assign op1=char_op1 * 4'ha+char_op2;
 assign op2=char_op3 * 4'ha+char_op4;
 scan2ascii a(keycode[7:0],print);
 seven s1(print,CLK100MHZ,RST,SEG,AN);
// assign asci =print;
endmodule
