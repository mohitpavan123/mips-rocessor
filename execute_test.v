`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:33:58 02/05/2020
// Design Name:   execute
// Module Name:   /home/mohit/Desktop/sem 2-2/proc_test/execute_test.v
// Project Name:  proc_test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: execute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module execute_test;

	// Inputs
	reg clk;

	// Outputs
	wire branch;
	wire jump;
	wire [31:0] o_p;
	wire [31:0]P_C;
	wire [31:0]inst1;
	wire zero;
	// Instantiate the Unit Under Test (UUT)
	execute uut ( 
		.clk(clk), 
		.branch(branch),  
		.jump(jump), 
		.o_p(o_p),
		.P_C(P_C),
		.inst1(inst1),
		.zero(zero)
	);

always#1 clk = ~clk;
	initial begin
	clk=1;
	//#10
		//inst1 = 32'b00100100001001111111111111111110;
	//#10;
		//inst1 = 32'b00000000111000101111100000100010;
		//#10;
		// Initialize Inputs
		//inst1 = 32'b00100000010000010000000000000001;
		//#10;
		//inst1 = 32'b00000000111000101111100000100010;
		//#10;
		//inst1 = 32'b10101100001000101111100000101010;
		//#10;
		//#10;
		//inst1 = 32'b00000000111000101111100000100010;
		//#10;
		//inst1 = 32'b10101100001000100000000000000000;
		//#10;
		//inst1 = 32'b10001100001111110000000000000000;
		#10;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

