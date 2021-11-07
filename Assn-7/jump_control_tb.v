`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:16:19 11/07/2021
// Design Name:   ALU
// Module Name:   /home/vanshita/COA-Laboratory-CS39001/Assn-7/jump_control_tb.v
// Project Name:  Assn-7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module jump_control_tb;
    // Inputs
    reg sign, carry, zero;
    reg [5:0] opcode;
    
    // Outputs
    wire validJump;

    jump_control JC (
        .opcode(opcode),
        .sign(sign),
        .carry(carry),
        .zero(zero),
        .validJump(validJump)
    );

    initial begin
        $monitor("opcode = %b, zero = %b, sign = %b, carry = %b, validJump = %b", opcode, zero, sign, carry, validJump);

        opcode = 6'b000111; zero = 1'b0; sign = 1'b1; carry = 1'b0;
        #5 opcode = 6'b000111; zero = 1'b0; sign = 1'b0; carry = 1'b0;
        #5 opcode = 6'b001000; zero = 1'b1; sign = 1'b0; carry = 1'b0;
        #5 opcode = 6'b001010;
        #5 opcode = 6'b001101; zero = 1'b0; sign = 1'b0; carry = 1'b1;
        #5 opcode = 6'b001101; zero = 1'b0; sign = 1'b0; carry = 1'b1;
        #5 opcode = 6'b001110; zero = 1'b0; sign = 1'b0; carry = 1'b1;

        #5 $finish;
    end
endmodule