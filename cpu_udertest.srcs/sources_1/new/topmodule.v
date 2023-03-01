module topmodule (      
    input  wire  clock , reset ,
    output wire [15:0] test_value,
    input PS2_CLK,
    input PS2_DATA,
    output [7:0]SEG,
    output [7:0]AN, output  done,
    output hsync,vsync,
    output [11:0]rgb
    //output [3:0] outp,
    //output ready
    //output [3:0] check
);
wire we;
wire [3:0]outp;
wire [7:0] print;
wire [31:0] addr, in , out; 
wire [31:0] pc  , instr ;
wire [7:0] ou;
wire [7:0] char_op1,char_op2;

ila_1 your_instance_name (
	.clk(clock), // input wire clk


	.probe0(char_op1), // input wire [7:0]  probe0  
	.probe1(char_op2), // input wire [7:0]  probe1 
	.probe2(test_value) // input wire [15:0]  probe2
);

//reg [3:0] sel2;
//initial sel2<=sel;
wire [3:0] sel;


keyboard_seq t1(clock,PS2_CLK,reset,PS2_DATA,SEG,AN,sel,done,print,char_op1,char_op2);
Mips M1 (
    .clock(clock),
    .reset(reset),
    .Instr(instr),
    .PC(pc),
    .ReadData(out),
    .ALUOut(addr),
    .WriteData(in),
    .MemWrite(we)
);

top t21(clock,reset,print,hsync,vsync,rgb);

instMem i1(
    .pc(pc),.clk(clock),
    .char_op1(char_op1),
    .char_op2(char_op2),
    .done(done),
    .instr(instr),
    .sel(sel)
    //.check(check)
);

dataMem dm1(
    .clk(clock),
    .rst(reset),
    .testValue(test_value),
    .in(in),
    .out(out),
    .addr(addr),
    .we(we)
);


endmodule