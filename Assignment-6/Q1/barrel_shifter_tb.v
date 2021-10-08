/*
   Assignment No. - 6
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Testbench for the Bidirectional Barrel Shifter module
module barrel_shifter_tb;
    // Inputs 
    reg  dir;
    reg [2:0] shamt;
    reg [7:0] in;

    // Output
    wire [7:0] out;
    
    // Instantiate the unit under test
    barrel_shifter BS1(.in(in), .shamt(shamt), .dir(dir), .out(out));
    
    initial begin

        // Monitor the changes
        $monitor("time = %0d, shamt = %b, dir = %b, in = %b, out = %b", $time, shamt, dir, in, out);
        
        // specify input, direction and shift amount
        in = 8'b01011101; dir = 1'b1; shamt = 3'b101;

        // change the shifting direction
        #5 dir = 1'b0;

        #5 $finish;

    end
endmodule