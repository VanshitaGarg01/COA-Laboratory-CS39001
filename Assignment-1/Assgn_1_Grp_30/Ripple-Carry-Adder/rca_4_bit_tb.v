`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:27:51 08/26/2021
// Design Name:   
// Module Name:   rca_4_bit_tb
// Project Name:  Ripple-Carry-Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_4_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// 
////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 1
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

// Testbench for the 4-bit ripple carry adder module
module rca_4_bit_tb;

    // Inputs
    reg [3:0] A = 4'b0000, B = 4'b0000;
    reg c_in = 1'b0;

    // Outputs
    wire [3:0] sum;
    wire c_out;

    // Instantiate the unit under test
    rca_4_bit RCA(.a(A), .b(B), .c_in(c_in), .sum(sum), .c_out(c_out));

    initial begin
        // Monitor the changes
        $monitor("A = %b, B = %b, c_in = %b, sum = %b, c_out = %b", A, B, c_in, sum, c_out);
        
        // Stimulus to verify the working of the 4-bit ripple carry adder
        #5 A = 4'b0100; B = 4'b1001;
        #5 A = 4'b1001; B = 4'b1010;
        #5 A = 4'b1100; B = 4'b1001;
        #5 A = 4'b1111; B = 4'b1111;
        #5 $finish;
    end
endmodule
