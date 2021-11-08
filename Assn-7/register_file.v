`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:33:56 11/08/2021 
// Design Name: 
// Module Name:    register_file 
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
module register_file (
    input [4:0] rs,
    input [4:0] rt,
    input regWrite,
    input [4:0] writeReg,
    input [31:0] writeData,
    input clk,
    input rst,
    output reg [31:0] readData1,
    output reg [31:0] readData2
);

    reg [31:0] registerBank [31:0];
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                registerBank[i] <= 32'b00000000000000000000000000000000;
        end else if (regWrite) begin
            registerBank[writeReg] <= writeData;
        end 
        
        //sfds
        $display ($time, ", writeReg = %d, wrteData = %d, regWrite = %b", writeReg, writeData, regWrite);
    end

    always @(*) begin
        readData1 = registerBank[rs];
        readData2 = registerBank[rt];
    end

endmodule
