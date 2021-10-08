/*
   Assignment No. - 6
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// mux_array module
module mux_array (input [7:0] a0, input [7:0] a1, input sel, output [7:0] out);
    /*
      Input and output ports :
      a0 - first input array (selected when sel = 0)
      a1 - second input array (selected when sel = 1)
      sel - the select line
      out - the output array depending on the select line
    */ 

    // Instantiate the required mux modules
    mux M1 (.a0(a0[0]), .a1(a1[0]), .sel(sel), .out(out[0]));
    mux M2 (.a0(a0[1]), .a1(a1[1]), .sel(sel), .out(out[1]));
    mux M3 (.a0(a0[2]), .a1(a1[2]), .sel(sel), .out(out[2]));
    mux M4 (.a0(a0[3]), .a1(a1[3]), .sel(sel), .out(out[3]));
    mux M5 (.a0(a0[4]), .a1(a1[4]), .sel(sel), .out(out[4]));
    mux M6 (.a0(a0[5]), .a1(a1[5]), .sel(sel), .out(out[5]));
    mux M7 (.a0(a0[6]), .a1(a1[6]), .sel(sel), .out(out[6]));
    mux M8 (.a0(a0[7]), .a1(a1[7]), .sel(sel), .out(out[7]));

endmodule