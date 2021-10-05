/*
   Assignment No. - 6
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// Testbench for the serial-in parallel-out shift register module
module sipo_tb;
    // Inputs
    reg clk, rst, serial_in, new_load;
    parameter N = 8;

    // Outputs
    wire [N-1:0] out;

    // Instantiate the unit under test
    sipo SIPO_1 (.clk(clk), .rst(rst), .serial_in(serial_in), .new_load(new_load), .out(out));

    initial begin
        clk = 1'b0; rst = 1'b1; new_load = 1'b0;
        $monitor("time = %0d, serial_in = %b, out = %b", $time, serial_in, out);

        #10 rst = 1'b0;

        #5 serial_in = 1'b1;
        #10 serial_in = 1'b0;
        #10 serial_in = 1'b0;
        #10 serial_in = 1'b1;
        #10 serial_in = 1'b0;
        #10 serial_in = 1'b1;
        #10 serial_in = 1'b0;
        #10 serial_in = 1'b1;

        #5 $finish;
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
