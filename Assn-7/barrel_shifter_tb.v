`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:00:15 11/07/2021
// Design Name:   barrel_shifter
// Module Name:   /home/vanshita/COA-Laboratory-CS39001/Assn-7/barrel_shifter_tb.v
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

// Testbench for the Bidirectional Barrel Shifter module
module barrel_shifter_tb;
    // Inputs 
    reg  dir, aorl;
    reg [31:0] shamt;
    reg [31:0] in;

    // Output
    wire [31:0] out;
    
    // Instantiate the unit under test
    barrel_shifter BS1(.in(in), .shamt(shamt), .dir(dir), .out(out), .aorl(aorl));
    
    initial begin

        // Monitor the changes
        $monitor("time = %0d, shamt = %b, dir = %b, in = %b, out = %b, aorl = %b", $time, shamt, dir, in, out, aorl);
        
        // specify input, direction and shift amount
        in = 4567; dir = 1'b1; shamt = 4; aorl = 0;

        // change the shifting direction
        #5 dir = 1'b0; aorl = 1'b0;

        #5 dir = 1'b0; aorl = 1'b1;

        #5 dir = 1'b1; aorl = 1'b0; in = -64;

        #5 dir = 1'b0; aorl = 1'b0;

        #5 dir = 1'b0; aorl = 1'b1;
        
        #5 $finish;

    end
endmodule


