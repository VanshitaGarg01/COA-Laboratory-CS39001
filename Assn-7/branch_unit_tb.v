`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:14:00 11/07/2021
// Design Name:   ALU
// Module Name:   /home/vanshita/COA-Laboratory-CS39001/Assn-7/branch_unit_tb.v
// Project Name:  Assn-7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module branch_unit_tb;

    // Inputs
    reg [31:0] nextPC;
    reg [25:0] label0;
    reg [15:0] label1;
    reg [31:0] rsAddr;
    reg lblSel;
    reg jumpAddr;
    reg branch;
    reg validJump;

    // Outputs
    wire [31:0] nextAddr;

    branch_unit BU (
        .nextPC(nextPC),
        .label0(label0),
        .label1(label1),
        .rsAddr(rsAddr),
        .lblSel(lblSel),
        .jumpAddr(jumpAddr),
        .branch(branch),
        .validJump(validJump),
        .nextAddr(nextAddr)
    );

    initial begin
        $monitor("nextAddr = %d", nextAddr);

        nextPC = 32'd200; label0 = 26'd100; label1 = 16'd50; rsAddr = 32'd400; 
        lblSel = 1'b0; jumpAddr = 1'b0; branch = 1'b1; validJump = 1'b1;

        #5 lblSel = 1'b1;
        #5 jumpAddr = 1'b1;
        #5 branch = 1'b0;

        #5 $finish;
    end

endmodule