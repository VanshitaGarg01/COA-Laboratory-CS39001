`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:46:39 09/27/2021 
// Design Name: 
// Module Name:    mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 6
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Vanshita Garg (19CS10064) & Ashutosh Kumar Singh (19CS30008)
*/

// 2x1 mux module
module mux (input a0, input a1, input sel, output out);
    /*
      Input and output ports :
      a0 - first input (selected when sel = 0)
      a1 - second input (selected when sel = 1)
      sel - the select line
      out - the output depending on the select line
    */ 
    
    assign out = (sel) ? a1 : a0;

endmodule