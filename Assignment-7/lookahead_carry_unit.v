// Look-ahead carry unit module
module lookahead_carry_unit(p, g, c_in, c, c_out, P, G);
    /*
      Input and output ports :
      p - block propagate from the previous level
      g - block generate from the previous level
      c_in - the carry-in bit
      c - the carry bits
      c_out - the output bit to store the carry-out
      P - block propagate for the next level
      G - block generate for the next level
    */ 
    input [3:0] p, g;
    input c_in;
    output [3:0] c;
    output c_out, P, G;

    // compute the carry bits
    assign c[0] = c_in;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign c_out = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);

    // compute block propagate and generate for the next level
    assign P = p[3] & p[2] & p[1] & p[0];
    assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
endmodule
