/*
   Assignment No. - 6
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Testbench for the shift register module
module shift_register_tb;
    // Inputs
    reg clk, rst, load;
    parameter N = 8;
    reg [N-1:0] parallel_in;
    
    // Outputs
    wire out;
    
    integer i;
    
    // Instantiate the unit under test
    shift_register S_REG (.clk(clk), .rst(rst), .load(load), .parallel_in(parallel_in), .out(out));

    initial begin
        clk = 1'b0; rst = 1'b1;

        #5 rst = 1'b0; load = 1'b1; parallel_in = 8'b10101011;

        #5 load = 1'b0;
        
        // Wait for 8 clock cycles to finish
        #80 $finish;
    end

    initial begin
        // Display the output bits
        #10
        for (i = 0; i < N; i = i + 1) begin
            #10 $display("time = %0d, out = %b", $time, out);
        end
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
