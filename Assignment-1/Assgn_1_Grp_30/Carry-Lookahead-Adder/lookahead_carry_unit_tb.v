`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:29:13 08/25/2021
// Design Name:   
// Module Name:   lookahead_carry_unit_tb
// Project Name:  Carry-Lookahead-Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lookahead_carry_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// 
////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 1
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

// Testbench for Look-ahead carry unit module
module lookahead_carry_unit_tb;

    // Inputs
    reg [3:0] p = 4'b0000, g = 4'b0000;
    reg c_in = 1'b0;

    // Outputs
    wire [3:0] carry;
    wire c_out, P, G;

    // Instantiate the unit under test
    lookahead_carry_unit LCU(.p(p), .g(g), .c_in(c_in), .c(carry), .c_out(c_out), .P(P), .G(G));

    initial begin
        // Monitor the changes
        $monitor("input propagates = %b, input generates = %b, c_in = %b, carry(s) = %b, c_out = %b, LCU propagate = %b, LCU generate = %b", p, g, c_in, carry, c_out, P, G);
        
        // Stimulus to verify the working of the look-ahead carry unit
        #5 p = 4'b1111; g = 4'b0110;
        #5 p = 4'b1101; g = 4'b0010;
        #5 p = 4'b1100; g = 4'b1001;
        #5 $finish;
    end
endmodule`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:29:13 08/25/2021
// Design Name:   
// Module Name:   lookahead_carry_unit_tb
// Project Name:  Carry-Lookahead-Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lookahead_carry_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// 
////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 1
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

// Testbench for Look-ahead carry unit module
module lookahead_carry_unit_tb;

    // Inputs
    reg [3:0] p = 4'b0000, g = 4'b0000;
    reg c_in = 1'b0;

    // Outputs
    wire [3:0] carry;
    wire c_out, P, G;

    // Instantiate the unit under test
    lookahead_carry_unit LCU(.p(p), .g(g), .c_in(c_in), .c(carry), .c_out(c_out), .P(P), .G(G));

    initial begin
        // Monitor the changes
        $monitor("input propagates = %b, input generates = %b, c_in = %b, carry(s) = %b, c_out = %b, LCU propagate = %b, LCU generate = %b", p, g, c_in, carry, c_out, P, G);
        
        // Stimulus to verify the working of the look-ahead carry unit
        #5 p = 4'b1111; g = 4'b0110;
        #5 p = 4'b1101; g = 4'b0010;
        #5 p = 4'b1100; g = 4'b1001;
        #5 $finish;
    end
endmodule
