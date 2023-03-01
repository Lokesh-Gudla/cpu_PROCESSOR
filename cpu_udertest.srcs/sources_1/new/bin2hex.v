module bin2hex
	(
		//input wire letter_case,
		input wire [7:0] ascii,
		output [7:0] char
	);
	reg [3:0] hexm;
	reg [3:0] hexl;
always @*
		case(ascii[7:4])
			4'b0000: hexm<= 4'h0;   // 0
			4'b0001: hexm<= 4'h1;   // 1
			4'b0010: hexm<= 4'h2;   // 2
			4'b0011: hexm<= 4'h3;   // 3
			4'b0100: hexm<= 4'h4;   // 4
			4'b0101: hexm<= 4'h5;   // 5
			4'b0110: hexm<= 4'h6;   // 6
			4'b0111: hexm<= 4'h7;   // 7
			4'b1000: hexm<= 4'h8;   // 8
			4'b1001: hexm<= 4'h9;   // 9
			4'b1010: hexm<= 4'ha;   // 10
			4'b1011: hexm<= 4'hb;   // 11
			4'b1100: hexm<= 4'hc;   // 12
			4'b1101: hexm<= 4'hd;   // 13
			4'b1110: hexm<= 4'he;   // 14
			4'b1111: hexm<= 4'hf;   // 15
			
			endcase
        
  always@*
    case(ascii[3:0])
			4'b0000: hexl<= 4'h0;   // 0
			4'b0001: hexl<= 4'h1;   // 1
			4'b0010: hexl<= 4'h2;   // 2
			4'b0011: hexl<= 4'h3;   // 3
			4'b0100: hexl<= 4'h4;   // 4
			4'b0101: hexl<= 4'h5;   // 5
			4'b0110: hexl<= 4'h6;   // 6
			4'b0111: hexl<= 4'h7;   // 7
			4'b1000: hexl<= 4'h8;   // 8
			4'b1001: hexl<= 4'h9;   // 9
			4'b1010: hexl<= 4'ha;   // 10
			4'b1011: hexl<= 4'hb;   // 11
			4'b1100: hexl<= 4'hc;   // 12
			4'b1101: hexl<= 4'hd;   // 13
			4'b1110: hexl<= 4'he;   // 14
			4'b1111: hexl<= 4'hf;   // 15
			
			endcase
assign char={hexm,hexl};
endmodule
