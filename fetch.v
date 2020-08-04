`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:51 02/02/2020 
// Design Name: 
// Module Name:    fetch 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fetch(input [31:0]inst1,output reg[31:0]immi1,output reg branch1,output reg jump1,output reg ext_op1,output reg reg_dst1,
output reg alusrc1,output reg [3:0]aluctrl1,output reg memtoreg1,output reg regwrite1,output reg memwrite1,output reg [15:0]offset1,
output reg[4:0]rs1,output reg bi,output reg[4:0]rt1,output reg [4:0]shift1,output reg [4:0]rd1,output reg[25:0]instr_index1);
always@(inst1)
begin
shift1=inst1[10:6];
rd1 =inst1[15:11];
rt1 =inst1[20:16];
rs1 = inst1[25:21];
instr_index1=inst1[25:0];
memwrite1=0;
regwrite1=0;
branch1 = 0;
reg_dst1=0;
memtoreg1=0;
ext_op1=0;
jump1=0;
alusrc1=0;
aluctrl1=4'h1;
offset1=inst1[15:0];
if(inst1[15]==1 && inst1[31:26]!=6'b001001)
begin
 ext_op1=1;
 immi1={16'b1111111111111111,inst1[15:0]};
end
else 
begin
	ext_op1=0;
	immi1={16'b0000000000000000,inst1[15:0]};
end
if(inst1[31:26]==6'b001001)
begin
jump1=0;
memtoreg1=0;
branch1 = 0;
alusrc1=1;
memwrite1=0;
reg_dst1=0;
regwrite1=1;
aluctrl1=4'b0000;
end//addu
if(inst1[31:26]==6'b000101)
begin
reg_dst1=0;
memwrite1=0;
regwrite1=0;
memtoreg1=0;
branch1=1;
bi=1'b0;
jump1=0;
aluctrl1=4'b0001;
alusrc1=0;
end
if( inst1[31:26]==6'b000100)
begin
//offset1=inst1[15:0];
reg_dst1=0;
memwrite1=0;
regwrite1=0;
memtoreg1=0;
branch1=1;
jump1=0;
bi=1'b1;
aluctrl1=4'b0001;
alusrc1=0;
end//beq
//if(inst1[31:26]==6'b100011 or inst1[31:26]==6'b101011)
//begin
if(inst1[31:26]==6'b101011)begin
//offset1=inst1[15:0];
branch1=0;
aluctrl1=4'b0000;
alusrc1=1;
reg_dst1=0;
jump1=0;
memwrite1=1;
regwrite1=0;
memtoreg1=0;
end//sw
else if(inst1[31:26]==6'b100011)begin
//offset1=inst1[15:0];
branch1=0;
jump1=0;
reg_dst1=0;
memwrite1=0;
regwrite1=1;
aluctrl1=4'b0000;
alusrc1=1;
memtoreg1=1;
end//lw
//if(inst1[31:26]==6'b001000 or inst1[31:26]==6'b001100 or inst1[31:26]==6'b001101 or inst1[31:26]==6'b001010)
//begin



if(inst1[31:26]==6'b001100) begin
branch1=0;
alusrc1=1;
reg_dst1=0;
memwrite1=0;
regwrite1=1;
jump1=0;
aluctrl1=4'b0011;
memtoreg1=0;
end//andi

else if(inst1[31:26]==6'b001000)//addi
begin
branch1=0;
alusrc1=1;
reg_dst1=0;
memwrite1=0;
regwrite1=1;
jump1=0;
aluctrl1=4'b0000;
memtoreg1=0;
end
//
else if(inst1[31:26]==6'b001101)//ori
begin
jump1=0;
branch1=0;
alusrc1=1;
reg_dst1=0;
memwrite1=0;
regwrite1=1;
aluctrl1=4'b0010;
memtoreg1=0;
end

else if(inst1[31:26]==6'b001010)//slti
begin
jump1=0;
branch1=0;
alusrc1=1;
reg_dst1=1;
memwrite1=0;
regwrite1=1;
aluctrl1=4'b1000;
memtoreg1=0;
end

if(inst1[31:26]==6'b001110)//xori
begin
jump1=0;
branch1=0;
alusrc1=1;
reg_dst1=0;
memwrite1=0;
regwrite1=1;
aluctrl1=4'b0100;
memtoreg1=0;
end

if(inst1[31:26]==6'b000010)//jtype
begin
jump1=1;
instr_index1=inst1[25:0];
branch1=0;
jump1=1;
reg_dst1=0;
memwrite1=0;
aluctrl1=4'b0000;
alusrc1=0;
regwrite1=0;
memtoreg1=0;
end
if(inst1[31:26]==6'b000000)  //rtype 
begin
jump1=0;
memtoreg1=0;
branch1 = 0;
alusrc1=0;
memwrite1=0;
reg_dst1=1;
regwrite1=1;
if(inst1[5:0]==6'b000100)
begin
aluctrl1=4'b0110;
end
if(inst1[5:0]==6'b101010)
begin
aluctrl1=4'b1000;
end
if(inst1[5:0]==6'b100101)
begin
aluctrl1=4'b0010;
end
if(inst1[5:0]==6'b100000)
begin
aluctrl1=4'b0000;
end
if(inst1[5:0]==6'b100100)
begin
aluctrl1=4'b0011;
end
if(inst1[5:0]==6'b100010)
begin
aluctrl1=4'b0001;
end
if(inst1[5:0]==6'b100110)begin
aluctrl1=4'b0100;
end
if(inst1[5:0]==6'b100111)begin
aluctrl1=4'b1111;
end
end
end
endmodule
