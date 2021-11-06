`timescale 1ns / 1ps

// 2x1 mux module
module mux_32b_2_1 (
    input [31:0] a0, 
    input [31:0] a1, 
    input sel, 
    output [31:0] out
);
    /*
      Input and output ports :
      a0 - first input (selected when sel = 0)
      a1 - second input (selected when sel = 1)
      sel - the select line
      out - the output depending on the select line
    */ 
    
    assign out = (sel) ? a1 : a0;

endmodule
