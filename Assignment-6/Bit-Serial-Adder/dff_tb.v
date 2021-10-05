/*
   Assignment No. - 6
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Testbench for D Flip-Flop module
module dff_tb;
    // Inputs
    reg clk, rst, d;
    
    //Outputs
    wire q;
    
    // Instantiate the unit under test
    dff D1(.clk(clk), .rst(rst), .d(d), .q(q));
    
    initial begin
        // Monitor the changes
        $monitor("time = %0d, d = %b, q = %b, rst = %b, clk = %b", $time, d, q, rst, clk);
        
        // Stimulus to verify the working of the multiplexer
        clk = 1'b0;
        #2 d = 1'b1; rst = 1'b1;
        #1 rst = 1'b0;
        #5 d = 1'b0;
        #5 d = 1'b1;
        #5 d = 1'b1;
        #5 d = 1'b0;
        #5 d = 1'b1;
        #5 $finish;
    end
    
    // Change the clock signal after every 5 time units
    always begin
        #5 clk = ~clk;
    end
endmodule
