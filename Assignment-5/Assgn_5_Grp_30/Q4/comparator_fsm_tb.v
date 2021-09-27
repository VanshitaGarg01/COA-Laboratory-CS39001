module comparator_fsm_tb;
    reg clk, op, rst, a, b;
    wire L, E, G;

    comparator_fsm COMP (.clk(clk), .op(op), .rst(rst), .a(a), .b(b), .L(L), .E(E), .G(G));

    initial begin
        clk = 0; rst = 1; op = 0;
        #4 rst = 0; a = 0; b = 1;
        #10 op = 1; a = 0; b = 0;
        #2 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);

        #4 rst = 1; op = 0;
        #4 rst = 0; a = 1; b = 0;
        #10 op = 1; a = 0; b = 1;
        #2 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);

        #4 rst = 1; op = 0;
        #4 rst = 0; a = 0; b = 1;
        #10 op = 1; a = 1; b = 0;
        #2 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);

        #1 $finish;
    end

    always  begin
        #5 clk = ~clk;
    end
endmodule
