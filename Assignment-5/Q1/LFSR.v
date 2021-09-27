module lfsr (seed, sel, clk, rst, w);
    input [3:0] seed;
    input sel, clk, rst;
    output [3:0] w;
    wire [3:0] wint;
    wire xor_output;
    
    mux M0 (.a0(seed[3]), .a1(xor_output), .sel(sel), .out(wint[0]));
    mux M1 (.a0(seed[2]), .a1(w[0]), .sel(sel), .out(wint[1]));
    mux M2 (.a0(seed[1]), .a1(w[1]), .sel(sel), .out(wint[2]));
    mux M3 (.a0(seed[0]), .a1(w[2]), .sel(sel), .out(wint[3]));

    dff d3 (.d(wint[0]), .q(w[0]), .rst(rst), .clk(clk));
    dff d2 (.d(wint[1]), .q(w[1]), .rst(rst), .clk(clk));
    dff d1 (.d(wint[2]), .q(w[2]), .rst(rst), .clk(clk));
    dff d0 (.d(wint[3]), .q(w[3]), .rst(rst), .clk(clk));

    xor x1 (xor_output, w[3], w[2]);

endmodule