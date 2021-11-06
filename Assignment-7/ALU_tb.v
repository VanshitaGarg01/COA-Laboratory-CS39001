module ALU_tb;
    
    // Inputs
    input reg [31:0] a;
    input reg [31:0] b; 
    input reg ALUsel;
    input reg [4:0] ALUop; 

    // Outputs
    output carry;
    output zero;
    output sign; 
    output [31:0] result;

    // Instantiate the unit under test
    ALU ALU1 (.a(a), .b(b), .ALUsel(ALUsel), .ALUop(ALUop), .carry(carry), .zero(zero), .sign(sign), .result(result));
    
    initial begin
        // Monitor the changes
        $monitor("time = %0d, a0 = %b, a1 = %b, sel = %b, out = %b", $time, a0, a1, sel, out);
        
        // Stimulus to verify the working of the multiplexer
        a0 = 1'b1; a1 = 1'b0; sel = 1'b1;
        #5 sel = 1'b0;
        #5 a0 = 1'b1; a1 = 1'b1; sel = 1'b1;
        #5 sel = 1'b0;
        #5 a0 = 1'b0; a1 = 1'b0; sel = 1'b1;
        #5 sel = 1'b0;
        #5 a0 = 1'b0; a1 = 1'b1; sel = 1'b1;
        #5 sel = 1'b0;
        #5 $finish;
    end
endmodule