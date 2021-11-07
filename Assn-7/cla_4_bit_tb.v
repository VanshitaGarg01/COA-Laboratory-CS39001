`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:08:17 11/07/2021
// Design Name:   barrel_shifter
// Module Name:   /home/vanshita/COA-Laboratory-CS39001/Assn-7/cla_4_bit_tb.v
// Project Name:  Assn-7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: barrel_shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
// Testbench for 4-bit carry look-ahead adder module with augmentation to compute next level block generate and propagate
module cla_4_bit_tb;

    // Inputs
    reg [3:0] A = 4'b0000, B = 4'b0000;
    reg c_in = 1'b0;

    // Outputs
    wire [3:0] sum;
    wire c_out, P, G;

    // Instantiate the unit under test
    cla_4_bit CLA(.a(A), .b(B), .c_in(c_in), .sum(sum), .c_out(c_out), .P(P), .G(G));

    initial begin
        // Monitor the changes
        $monitor("A = %b, B = %b, c_in = %b, sum = %b, c_out = %b, block propagate = %b, block generate = %b", A, B, c_in, sum, c_out, P, G);
        
        // Stimulus to verify the working of the 4-bit carry look-ahead adder
        #5 A = 4'b0100; B = 4'b1001;
        #5 A = 4'b1001; B = 4'b1010;
        #5 A = 4'b1100; B = 4'b0011;
        #5 A = 4'b1111; B = 4'b1111;
        #5 $finish;
    end
endmodule
