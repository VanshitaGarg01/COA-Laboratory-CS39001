module ALU_tb;
    
    // Inputs
    reg [31:0] a;
    reg [31:0] b; 
    reg ALUsel;
    reg [4:0] ALUop; 

    // Outputs
    wire carry;
    wire zero;
    wire sign; 
    wire [31:0] result;

    // Instantiate the unit under test
    ALU ALU1 (
        .a(a), 
        .b(b), 
        .ALUsel(ALUsel), 
        .ALUop(ALUop), 
        .carry(carry), 
        .zero(zero), 
        .sign(sign), 
        .result(result)
    );
    
    initial begin
        // Monitor the changes
        $monitor("time = %0d, a = %d, b = %d, ALUsel = %b, ALUop = %b, carry = %b, zero = %b, sign = %b, result = %d", $time, a, b, ALUsel, ALUop, carry, zero, sign, result);
        
        // Stimulus to verify the working of the multiplexer
        a = 32'd75;
        b = 32'b11111111111111000001111111111111;
        ALUsel = 1'b0;
        ALUop = 5'b00000;
        #5 ALUop = 5'b00001;
        #5 ALUop = 5'b00101;
        #5 ALUop = 5'b10101;
        #5 ALUop = 5'b00010;
        #5 ALUop = 5'b00011;
        #5 ALUop = 5'b01010;
        #5 ALUop = 5'b01000;
        #5 ALUop = 5'b01010;
        #5 ALUop = 5'b01000;
        #5 ALUop = 5'b01001;
        #5 ALUop = 5'b01001;

        #5 ALUsel = 1'b1; ALUop = 5'b00001;
        #5 ALUop = 5'b00101;
        #5 ALUop = 5'b10101;
        #5 ALUop = 5'b00010;
        #5 ALUop = 5'b00011;
        #5 ALUop = 5'b01010;
        #5 ALUop = 5'b01000;
        #5 ALUop = 5'b01010;
        #5 ALUop = 5'b01000;
        #5 ALUop = 5'b01001;
        #5 ALUop = 5'b01001;
        #5 $finish;
    end
endmodule

