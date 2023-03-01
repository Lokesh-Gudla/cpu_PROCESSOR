`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2023 16:19:12
// Design Name: 
// Module Name: scan2ascii
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


module ascii2char
	(
		//input wire letter_case,
		input wire [7:0] ascii,
		output reg [7:0] char
	);
	
always @*
		case(ascii)
			8'h30: char = 8'h0;   // 0
			8'h31: char = 8'h1;   // 1
			8'h32: char = 8'h2;   // 2
			8'h33: char = 8'h3;   // 3
			8'h34: char = 8'h4;   // 4
			8'h35: char = 8'h5;   // 5
			8'h36: char = 8'h6;   // 6
			8'h37: char = 8'h7;   // 7
			8'h38: char = 8'h8;   // 8
			8'h39: char = 8'h9;   // 9
			default: char = 8'h0;  //default
			endcase

		endmodule
