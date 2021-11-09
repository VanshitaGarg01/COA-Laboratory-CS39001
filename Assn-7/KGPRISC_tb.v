`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:22:52 11/08/2021
// Design Name:   KGPRISC
// Module Name:   /home/vanshita/COA-Laboratory-CS39001/Assn-7/KGPRISC_tb.v
// Project Name:  Assn-7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGPRISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module KGPRISC_tb;

	// Inputs
	reg clk;
	reg rst;
    wire [31:0] ins, add, result, nextPC, dataMemReadData;
    wire [4:0] ALUop;
    wire carry, zero,sign, validJump, lastCarry;

	// Instantiate the Unit Under Test (UUT)
	KGPRISC uut (
		.clk(clk), 
		.rst(rst),
        .instruction(ins),
        .instrAddr(add),
        .result(result),
        .nextPC(nextPC),
        .ALUop(ALUop),
        .carry(carry), 
        .zero(zero), 
        .sign(sign), 
        .validJump(validJump),
        .dataMemReadData(dataMemReadData),
        .lastCarry(lastCarry)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
        #5 rst = 0;

		// Wait 100 ns for global reset to finish
		#1270 $finish;
        
		// Add stimulus here

	end
    
    always begin
        #10 clk = ~clk;
    end
      
endmodule

