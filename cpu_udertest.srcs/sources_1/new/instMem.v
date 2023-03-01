module instMem (
    input  wire  [31:0] pc, input clk,
    input [7:0] char_op1,char_op2,
    input done,
    output wire  [31:0] instr,
    input [3:0] sel
    //output [3:0] check
);
reg [31:0] rom [0:99];




/*ila_0 your_instance_name (
	.clk(clk), // input wire clk


	.probe0(char_op1), // input wire [7:0]  probe0  
	.probe1(char_op2), // input wire [7:0]  probe1 
	.probe2(sel) // input wire [3:0]  probe2
);*/
/*initial 
    begin
        // READING THE TEST MACHINE CODE (" Should be given")
        $readmemh("C:/Users/VLSI/Documents/mehar/my verilog/cpu_udertest/Test-Cases/m1.txt",rom); 
    end*/
assign instr = rom [pc>>2] ; // SHIFT RIGHT By 2
//assign check =sel;
integer i;
always@(sel,done)

begin
    for(i=0;i<21;i=i+1)
        begin
            rom[i] <=32'b0;
        end
     $monitor(char_op1,char_op2);   
     
if(done)
 
      
    case(sel)
        4'd1: begin
            $display("test value 1");
            rom[0]<=32'h00008020;
            rom[1]<={24'h201000,char_op1};
            rom[2]<=32'h00008820;
            rom[3]<={24'h201100,char_op2};
            rom[4]<=32'h00009020;
            rom[5]<=32'h02119020;
            rom[6]<=32'hAC120000;
            end
        4'd2: begin
            rom[0]<=32'h00008020;
            rom[1]<={24'h201000,char_op1};
            rom[2]<=32'h00008820;
            rom[3]<={24'h201100,char_op2};
            rom[4]<=32'h00009020;
            rom[5]<=32'h02119024;
            rom[6]<=32'hAC120000;
            end
        4'd3: begin
            rom[0]<=32'h00008020;
            rom[1]<={24'h201000,char_op1};
            rom[2]<=32'h00008820;
            rom[3]<={24'h201100,char_op2};
            rom[4]<=32'h00009020;
            rom[5]<=32'h02119022;
            rom[6]<=32'hAC120000;
            end
         4'd4: begin
            rom[0]<=32'h00008020;
            rom[1]<={24'h201000,char_op1};
            rom[2]<=32'h00008820;
            rom[3]<={24'h201100,char_op2};
            rom[4]<=32'h00009020;
            rom[5]<=32'h0211902a;
            rom[6]<=32'hAC120000;
            end
         4'd5: begin
            rom[0]<=32'h00008020;
            rom[1]<={24'h201000,char_op1};
            rom[2]<=32'h00008820;
            rom[3]<={24'h201100,char_op2};
            rom[4]<=32'h00009020;
            rom[5]<=32'h0211901c;
            rom[6]<=32'hAC120000;
            end
        4'd6: begin    
            rom[0]<=32'h00008020;
            rom[1]<={24'h201000,char_op1};
            rom[2]<=32'h00008820;
            rom[3]<={24'h201100,char_op2};
            rom[4]<=32'h00009020;
            rom[5]<=32'h12110006;
            rom[6]<=32'h0211482A;
            rom[7]<=32'h11200002;
            rom[8]<=32'h02308822;
            rom[9]<=32'h08000005;           
            rom[10]<=32'h02118022;
            rom[11]<=32'h08000005;
            rom[12]<=32'h00109020;
            rom[13]<=32'hAC120000;
            end
        4'd7: begin
            rom[0]<=32'h00008020;
            rom[1]<={24'h201000,char_op1}; // input if we want another number change the 2 LSB 
            rom[2]<=32'h00008820;
            rom[3]<=32'h20110001;
            rom[4]<=32'h12000003;
            rom[5]<=32'h0230881c;
            rom[6]<=32'h2210ffff;
            rom[7]<=32'h08000004;
            rom[8]<=32'hAc110000; 
            end        
       
       /*rom[0]<=32'h00008020;
        rom[1]<=32'h20100078;
        rom[2]<=32'h00008820;
        rom[3]<=32'h201100B4;
        rom[4]<=32'h00009020;
        rom[5]<=32'h0211901c;
        rom[6]<=32'hAC120000;*/ 
       endcase
       $display("test value 2");
end

endmodule