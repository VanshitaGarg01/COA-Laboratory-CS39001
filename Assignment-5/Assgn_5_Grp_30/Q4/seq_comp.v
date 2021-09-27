module seq_comp #(parameter N = 32) (clk, rst, op, load_A, load_B, parallel_in_A, parallel_in_B, L, E, G);
    input clk, rst, op, load_A, load_B;
    input [N-1:0] parallel_in_A, parallel_in_B;
    output wire L, E, G;
    wire out_a, out_b;

    shift_register S_REG_A (.clk(clk), .rst(rst), .load(load_A), .parallel_in(parallel_in_A), .out(out_a));
    shift_register S_REG_B (.clk(clk), .rst(rst), .load(load_B), .parallel_in(parallel_in_B), .out(out_b));

    comparator_fsm COMP (.clk(clk), .op(op), .rst(rst), .a(out_a), .b(out_b), .L(L), .E(E), .G(G));

endmodule
