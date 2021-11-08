`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:46 11/08/2021 
// Design Name: 
// Module Name:    PC_increment 
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
module PC_increment (
    input [31:0] instrAddr,
    output [31:0] nextPC
);

    assign nextPC = instrAddr + 32'b00000000000000000000000000000100;
    
endmodule