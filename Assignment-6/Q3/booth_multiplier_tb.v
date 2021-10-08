/*
   Assignment No. - 6
   Problem No. - 3
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Testbench for Sequential Signed Binary Multiplier (Booth Multiplier)
module bit_serial_adder_tb #(parameter N = 8);
    // Inputs
    reg clk, rst, load;

    // Input Intergers
    reg signed [N-1:0] A, B;

    // Output
    wire [2*N-1:0] prod;

    // Instantiate the unit under test
    booth_multiplier BM (.clk(clk), .rst(rst), .load(load), .A(A), .B(B), .prod(prod));

    initial begin

        // Initialize Clk to 0 and rst to 1
        clk = 1'b0; rst = 1'b1;

        // Initialize A and B
        A = -75; B = -127; 

        // Change load to 1 and rst to 0
        #5 load = 1'b1; rst = 1'b0;

        // change load to 0
        #5 load = 1'b0;
        
        // Wait for 8 positive edges to display the outputs
        #80 $display("time = %0d, prod = %d, A = %d, B = %d", $time, prod, A, B);

        // Change load to 1
        #100 load = 1'b1;

        // Load new values of A and B
        A = -42; B = -107;

        //Change load to 0
        #7 load = 1'b0;

        // Wait for 8 positive edges to display the outputs
        #80 $display("time = %0d, prod = %d, A = %d, B = %d", $time, prod, A, B);

        // Finish when done printing
        $finish;
    end

    always begin
        #5 clk = ~clk;
    end

endmodule
