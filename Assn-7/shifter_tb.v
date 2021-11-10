`timescale 1ns / 1ps

module shifter_tb;

	// Inputs 
    reg  dir, aorl;
    reg [31:0] shamt;
    reg [31:0] in;

    // Output
    wire [31:0] out;
    
    // Instantiate the unit under test
    shifter S1(.in(in), .shamt(shamt), .dir(dir), .out(out), .aorl(aorl));
    
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

