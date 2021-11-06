/*
   Assignment No. - 6
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

`timescale 1ns / 1ps

// Testbench for the Bidirectional Barrel Shifter module
module barrel_shifter_tb;
    // Inputs 
    reg  dir, aorl;
    reg [2:0] shamt;
    reg [7:0] in;

    // Output
    wire [7:0] out;
    
    // Instantiate the unit under test
    barrel_shifter BS1(.in(in), .shamt(shamt), .dir(dir), .out(out), .aorl(aorl));
    
    initial begin

        // Monitor the changes
        $monitor("time = %0d, shamt = %b, dir = %b, in = %b, out = %b, aorl = %b", $time, shamt, dir, in, out, aorl);
        
        // specify input, direction and shift amount
        in = 8'b01011101; dir = 1'b1; shamt = 3'b101; aorl = 0;

        // change the shifting direction
        #5 dir = 1'b0; aorl = 1'b0;

        #5 dir = 1'b0; aorl = 1'b1;

        #5 dir = 1'b1; aorl = 1'b0; in = 8'b11011101;

        #5 dir = 1'b0; aorl = 1'b0;

        #5 dir = 1'b0; aorl = 1'b1;
        
        #5 $finish;

    end
endmodule
