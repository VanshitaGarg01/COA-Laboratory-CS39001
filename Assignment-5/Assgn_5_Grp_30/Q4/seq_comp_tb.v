module seq_comp_tb;
    parameter N = 32;
    reg clk, rst, op, load_A, load_B;
    reg [N-1:0] parallel_in_A, parallel_in_B;
    wire L, E, G;

    seq_comp SEQ_COMP_1 (.clk(clk), .rst(rst), .op(op), .load_A(load_A), .load_B(load_B), .parallel_in_A(parallel_in_A), .parallel_in_B(parallel_in_B), .L(L), .E(E), .G(G));

    initial begin
        clk = 0; rst = 1; op = 0;

        #2 rst = 0; load_A = 1; load_B = 1; parallel_in_A = 32'd456; parallel_in_B = 32'd123;
        #2 load_A = 0; load_B = 0;

        #315 op = 1;
        #1 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);


        #1 rst = 1; op = 0;
        #1 rst = 0; load_A = 1; load_B = 1; parallel_in_A = 32'd123; parallel_in_B = 32'd123;
        #2 load_A = 0; load_B = 0;

        #315 op = 1;
        #1 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);


        #1 rst = 1; op = 0;
        #1 rst = 0; load_A = 1; load_B = 1; parallel_in_A = 32'd12; parallel_in_B = 32'd123;
        #2 load_A = 0; load_B = 0;

        #315 op = 1;
        #1 $display("time = %0d, L = %b, E = %b, G = %b", $time, L, E, G);


        #1 $finish;
    end

    always begin
        #5 clk = ~clk;
    end

endmodule
