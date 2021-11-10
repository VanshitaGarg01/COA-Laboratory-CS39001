`timescale 1ns / 1ps

module dff (
    input clk, 
    input rst, 
    input d, 
    output reg q
);
    /*
      Input and output ports :
      clk - the clock signal
      rst - the reset signal
      d - input value
      q - value stored by the flip-flop (output)
    */
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
    
endmodule
