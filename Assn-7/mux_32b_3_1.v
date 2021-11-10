`timescale 1ns / 1ps

module mux_32b_3_1 (
    input [31:0] a0, 
    input [31:0] a1, 
    input [31:0] a2, 
    input [1:0] sel, 
    output reg [31:0] out
);
    /*
      Input and output ports :
      a0 - first input (selected when sel = 0)
      a1 - second input (selected when sel = 1)
      sel - the select line
      out - the output depending on the select line
    */ 

    always @(*) begin
        case (sel)
            2'b00 : out = a0;
            2'b01 : out = a1;
            2'b10 : out = a2;
            default : out = a2;
        endcase
    end
    
endmodule
