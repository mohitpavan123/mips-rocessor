`timescale 1ns / 1ps
module alu(input [31:0]a,input [31:0]b,input [4:0]shift,input [3:0]op_code,output reg [31:0]out,output reg zero);
always@(*)
	begin
	if(op_code==4'b0000)
	out=a+b;
	else if(op_code==4'b0001)begin
	out=a-b;
	if(out==32'b0)
	zero=1'b1;
	else
	zero=1'b0;
	end
	else if(op_code==4'b1001)
	out=a*b;
	else if(op_code==4'b0010)
	out=a|b;
	else if(op_code==4'b0011)
	out=a&b;
	else if(op_code==4'b0100)
	out=a^b;
	else if(op_code==4'b0101)
	out=b>>a;
	else if(op_code==4'b0110)
	out=b<<a;
	else if(op_code==4'b0111)
	out=(a>b);
	else if(op_code==4'b1000)
	out=(a<b);
	else if(op_code==4'b1111)
	out=~(a|b);
	end
endmodule
