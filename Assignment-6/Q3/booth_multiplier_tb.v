module bit_serial_adder_tb;
    reg clk, rst, load;
    parameter N = 8;
    reg signed [N-1:0] A, B;

    wire [2*N-1:0] prod;

    booth_multiplier BM (.clk(clk), .rst(rst), .load(load), .A(A), .B(B), .prod(prod));

    initial begin
        clk = 1'b0; rst = 1'b1;
        $monitor("time = %0d, prod = %d, A = %d, B = %d", $time, prod, A, B);

        A = -75; B = -127; 
        #5 load = 1'b1; rst = 1'b0;
        #5 load = 1'b0;
        
        #100 load = 1'b1;
        A = -127; B = -127;
        #7 load = 1'b0;
        #110 $finish;
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
