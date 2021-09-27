module lfsr_tb;
    reg sel, clk, rst;
    reg [3:0] seed;
    wire [3:0] w;
    lfsr lfsr1(.seed(seed), .sel(sel), .rst(rst), .clk(clk), .w(w));
    initial begin
        clk = 1'b0;
        $monitor("time = %0d, output = %b%b%b%b", $time, w[0], w[1], w[2], w[3]);
        sel = 0;
        seed = 4'b1111;
        #6 sel = 1;
        #155 $finish;
    end
    always 
        #5 clk = ~clk;
endmodule
