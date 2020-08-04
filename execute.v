`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:32 02/05/2020 
// Design Name: 
// Module Name:    execute 
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
module execute(input clk,output branch,output jump,output reg [31:0]o_p,output reg [31:0]P_C,output [31:0]inst1,output zero);
  wire [3:0] aluctrl;
 wire  [25:0] instr_index;
 wire [4:0] rs,rt,rd,shift;
 reg [4:0]Rd;
 wire ext_op;
wire [31:0] reg_B,immi,A,o_p_alu,o_p_mem;
reg [31:0] B;
reg [31:0] data[0:31];
reg [31:0] ram[0:255];
wire [15:0] offset;
  wire alusrc,reg_dst,memwrite,regwrite,memtoreg;
reg  [7:0]instr_mem[0:47];
reg [31:0]instr;
reg [29:0]P_C_ADD;
initial begin

instr_mem[4] = 8'b00100010;
instr_mem[5] = 8'b00100000;
instr_mem[6] = 8'b01000011;
instr_mem[7] = 8'b00000000;
instr_mem[8] = 8'b00100101;
instr_mem[9] = 8'b00100000;
instr_mem[10] = 8'b01000011;
instr_mem[11] = 8'b00000000;
instr_mem[12] = 8'b00111110;
instr_mem[13] = 8'b00000000;
instr_mem[14] = 8'b01000011;
instr_mem[15] = 8'b00100000;
instr_mem[16] = 8'b00111110;
instr_mem[17] = 8'b00000000;
instr_mem[18] = 8'b01000011;
instr_mem[19] = 8'b00101000;
instr_mem[20] = 8'b00000001;
instr_mem[21] = 8'b00000000;
instr_mem[22] = 8'b01000011;
instr_mem[23] = 8'b10101100;
instr_mem[24] = 8'b00000001;
instr_mem[25] = 8'b00000000;
instr_mem[26] = 8'b01000011;
instr_mem[27] = 8'b10001100;
instr_mem[28] = 8'b00000100;
instr_mem[29] = 8'b00000000;
instr_mem[30] = 8'b00100001;
instr_mem[31] = 8'b00010100;
instr_mem[31] = 8'b00111110;
instr_mem[33] = 8'b00000000;
instr_mem[34] = 8'b01000011;
instr_mem[35] = 8'b00101000;
instr_mem[36] = 8'b00111110;
instr_mem[37] = 8'b00000000;
instr_mem[38] = 8'b01000011;
instr_mem[39] = 8'b00001000;
data[0] = 0;
ram[0] = 0;
data[7]=10;
ram[1]=1;
data[1] =1;
ram[5]=5;
data[2] =2;
ram[2]=2;
data[3] =3;
ram[3]=3;
P_C=0;
P_C_ADD=0;
end
always@(posedge clk)
begin
if(branch==1'b1)begin
if(zero==1)begin
if(bi==1)begin
P_C_ADD=P_C[31:2]+1;
P_C_ADD=P_C_ADD+{{14{offset[15]}},offset[15:0]};
P_C={P_C_ADD,2'b00};
end
else
P_C=P_C+4;
end
else begin
if(bi==0)begin
P_C_ADD=P_C[31:2]+1;
P_C_ADD=P_C_ADD+{{14{offset[15]}},offset[15:0]};
P_C={P_C_ADD,2'b00};
end
else
P_C=P_C+4;
end
end
else if(jump==1'b1)begin
P_C={P_C[31:28],instr_index[25:0],P_C[1:0]};
end
else begin
P_C=P_C+4;
end
instr={instr_mem[P_C+3],instr_mem[P_C+2],instr_mem[P_C+1],instr_mem[P_C]};
end
assign inst1=instr;
fetch dec(inst1,immi,branch,jump,ext_op,reg_dst,alusrc,aluctrl,memtoreg,regwrite,memwrite,offset,rs,bi,rt,shift,rd,instr_index);
assign A=data[rs];
assign reg_B = data[rt];
always@(inst1 or rs or rt or rd or alusrc or immi or reg_dst or reg_B)
begin
B=(alusrc==0)?(reg_B):(immi);
Rd=(reg_dst==0)?(rt):(rd);
end
alu g1(A,B,shift,aluctrl,o_p_alu,zero);
assign o_p_mem=ram[o_p_alu];
always@(posedge clk)
begin
if(memwrite==1)
begin
ram[o_p_alu]=data[rt];
o_p =data[rt];
end
if(regwrite==1)
begin
data[Rd]=(memtoreg==0)?(o_p_alu):(o_p_mem);
o_p=data[Rd];
end
end
endmodule
