`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2023 17:24:31
// Design Name: 
// Module Name: sequence_detect
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


module sequence_detect(input clk,rst,[7:0]ascii,output [3:0] prog1, output reg [7:0] op1,op2,op3,op4, output reg ready);
    parameter s0=5'd0,s1=5'd1,s2=5'd2,s3=5'd3,s4=5'd4,s5=5'd5,s6=5'd6,s7=5'd7,s8=5'd8,s9=5'd9,s10=5'd10,s11=5'd11,s12=5'd12,s13=5'd13,s14=5'd14,s15=5'd15,s16=5'd16,s17=5'd17,s18=5'd18,s19=5'd19,s20=5'd20,s21=5'd21,s22=5'd22,s23=5'd23,s24=5'd24;
    reg [4:0]ps;
    reg [3:0] prog =0;
    integer i;
    reg clk_d=0;
    always@(posedge clk)
    begin
        i=i+1;
        if(i==25000000)
            begin
                i=0;
                clk_d <= ~clk_d;
            end
    end
    always@(posedge clk)
    begin
    if(~rst)begin  ps<=s0 ;end
    else 
    $display("yes");
    case(ps)
    s0: case(ascii)
        8'h61: ps<=s1;                   //a
        8'h73: ps<=s6;                   //s
        8'h6d: ps<=s11;                  //m
        8'h67: ps<=s14;                  //g
        8'h66: ps<=s17;                  //f
        endcase
    s1:if(ascii==8'h64) ps<=s2;                           //d
        else if(ascii==8'h6e) ps<=s4;                     //n
        else if(ascii==8'h08) ps<=s0;                     //backspace
        else ps<=s1;
    s2:if(ascii==8'h64) ps<=s3;                            //d
        else if(ascii==8'h08) ps<=s1;                      //backspace
        else ps<=s2;               
    s3:begin if(ascii==8'h08) ps<=s2;                      //backspace
             else if(ascii==8'h20) ps<=s20;                //space
             else ps<=s3;
        end             //parameter for add=0
    s4:if(ascii==8'h64) ps<=s5;                             //d
        else if(ascii==8'h08) ps<=s1;                       //backspace
        else ps<=s4;
    s5:begin if(ascii==8'h08) ps<=s4;                       //backspace
             else if(ascii==8'h20) ps<=s20;                 //space
             else ps<=s5;
        end             //parameter for and=1
    s6:if(ascii==8'h75) ps<=s7;                             //u
        else if(ascii==8'h6c) ps<=s9;                       //l
        else if(ascii==8'h08) ps<=s0;                       //backspace
        else ps<=s6;
    s7:if(ascii==8'h62) ps<=s8;                             //b
        else if(ascii==8'h08) ps<=s6;                       //backspace
        else ps<=s7;
    s8:begin if(ascii==8'h08) ps<=s7;                        //backspace
             else if(ascii==8'h20) ps<=s20;                  //space
             else ps<=s8;
             
end//parameter for sub=2
    s9:if(ascii==8'h74) ps<=s10;                              //t
        else if(ascii==8'h08) ps<=s6;                         //backspace
        else ps<=s9;
    s10:begin if(ascii==8'h08) ps<=s9;                        //backspace
             else if(ascii==8'h20) ps<=s20;                   //space
             else ps<=s10;
        end              //parameter for slt=3
    s11:if(ascii==8'h75) ps<=s12;                             //u
        else if(ascii==8'h08) ps<=s0;                         //backspace
        else ps<=s11;
    s12:if(ascii==8'h6c) ps<=s13;                             //l
        else if(ascii==8'h08) ps<=s11;                        //backspace
        else ps<=s12;
    s13:begin if(ascii==8'h08) ps<=s12;                       //backspace
        else if(ascii==8'h20) ps<=s20;                        //space
        else ps<=s13;
        end
    s14:if(ascii==8'h63) ps<=s15;                             //c
        else if(ascii==8'h08) ps<=s0;                         //backspace
        else ps<=s14;
    s15:if(ascii==8'h64) ps<=s16;                             //d
        else if(ascii==8'h08) ps<=s14;                        //backspace
        else ps<=s15;
    s16:begin if(ascii==8'h08) ps<=s15;                       //backspace
        else if(ascii==8'h20) ps<=s20;                        //space
        else ps<=s16;
        end
    s17:if(ascii==8'h61) ps<=s18;                             //a
        else if(ascii==8'h08) ps<=s0;                         //backspace
        else ps<=s17;
    s18:if(ascii==8'h63) ps<=s19;                             //c
        else if(ascii==8'h08) ps<=s17;                        //backspace
        else ps<=s18;
    s19: begin if(ascii==8'h08) ps<=s18;                       //backspace
         else if(ascii==8'h20) ps<=s20;                        //space
         else ps<=s19;
         end
    s20: if(ascii==8'h2e) ps<=s21;                             //space
         else if(ascii==8'h08) ps<=s0;
         else if(ascii==8'h3b) ps<=s24;                        //;
         else begin op1<=ascii; ps<=s20; end
    s21: begin
         if(ascii==8'h2c) ps<=s22;                             //,
         else if(ascii==8'h08) ps<=s0;
         else if(ascii==8'h3b) ps<=s24;
         else begin op2<=ascii; ps<=s21; end
         end
    s22: if(ascii==8'h2e) ps<=s23;
         else if(ascii==8'h08) ps<=s0;
         else if(ascii==8'h3b) ps<=s24;
         else begin op3<=ascii; ps<=s22; end
    s23: if(ascii==8'h3b) ps<=s24;
         else if(ascii==8'h08) ps<=s0;
         //else if(ascii==8'h3b) ps<=s24;
         else begin op4<=ascii; ps<=s23; end
    s24: if(ascii==8'h0d) ps<=s0;
         else if(ascii==8'h08) ps<=s0;
         //else if(ascii==8'h3b) ps<=s24;
         else ps<=s24;
    endcase
    end
initial ready<=0;

/*ila_0 your_instance_name1 (
	.clk(clk), // input wire clk


	.probe0(op1), // input wire [7:0]  probe0  
	.probe1(op2), // input wire [7:0]  probe1 
	.probe2(prog1) // input wire [3:0]  probe2
);*/

//Output declaration
always @(posedge clk)
if(~rst) prog <=0;
else
case(ps)
s0: begin prog<=4'd0; ready<=0; end
//s1: prog<=4'd0;
//s2: prog<=4'd0;
s3: prog<=4'd1;
//s4: prog<=4'd0;
s5: prog<=4'd2;
//s6: prog<=4'd0;
//s7: prog<=4'd0;
s8: prog<=4'd3;
//s9: prog<=4'd0;
s10: prog<=4'd4;
//s11: prog<=4'd0;
//s12: prog<=4'd0;
s13: prog<=4'd5;
//s14: prog<=4'd0;
//s15: prog<=4'd0;
s16: prog<=4'd6;
//s17: prog<=4'd0;
//s18: prog<=4'd0;
s19: prog<=4'd7;
//s20: prog<=4'd0;
//s21: prog<=4'd0;
s24: ready<=1;
endcase


assign prog1=prog;
endmodule
