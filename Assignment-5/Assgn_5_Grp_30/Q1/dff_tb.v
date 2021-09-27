module mux_tb;
    reg d, rst, clk;
    wire q;
    dff D1(.d(d), .q(q), .rst(rst), .clk(clk));
    initial begin
        clk = 1'b0;
        $monitor("time = %0d, d = %b, q = %b, rst = %b, clk = %b", $time, d, q, rst, clk);
        #2 d = 1; rst = 1;
        #5 rst = 0;
        #5 d = 0;
        #5 d = 1;
        #5 d = 1;
        #5 d = 0;
        #5 d = 1;
        #5 $finish;
    end
    always 
        #5 clk = ~clk;
endmodule
