module top(
    input CLK100MHZ,
    input PS2_CLK,RST,
    input PS2_DATA,
    output [7:0]SEG,
    output [7:0]AN,
    output UART_TXD
    );
    
reg CLK50MHZ=0;    
wire [31:0]keycode;

wire [7:0] ou;
always @(posedge(CLK100MHZ))begin
    CLK50MHZ<=~CLK50MHZ;
end


PS2Receiver keyboard (
.clk(CLK50MHZ),
.kclk(PS2_CLK),
.kdata(PS2_DATA),
.keycodeout(keycode[31:0])
);

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
 
 scan2ascii a(keycode[7:0],ou);
 seven s1(ou,CLK100MHZ,RST,SEG,AN);
endmodule