module control_unit (
    input [5:0] opcode,
    input [4:0] func,
    output reg [1:0] RegDst,
    output reg RegWrite,
    output reg JumpAddr,
    output reg Branch,
    output reg Dir,
    output reg Type,
    output reg ALUsel,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] MemToReg,
    output reg ALUsrc,
    output reg [3:0] ALUop,
    output reg LblSel
);

    // parameter O0 = 6'b000000, O1 = 6'b000001, O2 = 6'b000010, O3 = 6'b000011, O4 = 6'b000100;
    // parameter O5 = ;
    
    always @(opcode or func) begin
        case (opcode)
            6'b000000 : begin
                case (func)
                    5'b00000 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        // Dir = 
                        // Type = 
                        ALUsel = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0001;
                        // LblSel = 
                    end 
                    5'b00001 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        // Dir = 
                        // Type = 
                        ALUsel = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0001;
                        // LblSel = 
                    end
                endcase
            end
            6'b000001 : begin
                case (func)
                    5'b00000 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        // Dir = 
                        // Type = 
                        ALUsel = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0010;
                        // LblSel = 
                    end 
                    5'b00001 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        // Dir = 
                        // Type = 
                        ALUsel = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0011;
                        // LblSel = 
                    end
                endcase
            end
            6'b000010 : begin
                case (func)
                    5'b00000 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        Dir = 1'b1;
                        Type = 1'b0;
                        ALUsel = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0100;
                        // LblSel = 
                    end 
                    5'b00001 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        Dir = 1'b0;
                        Type = 1'b0; 
                        ALUsel = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0100;
                        // LblSel = 
                    end
                    5'b00010 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        Dir = 1'b1;
                        Type = 1'b0;
                        ALUsel = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0100;
                        // LblSel = 
                    end 
                    5'b00011 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        Dir = 1'b0;
                        Type = 1'b0;
                        ALUsel = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0100;
                        // LblSel = 
                    end
                    5'b00100 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        Dir = 1'b0;
                        Type = 1'b1;
                        ALUsel = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b1;
                        ALUop = 4'b0100;
                        // LblSel = 
                    end 
                    5'b00101 : begin
                        RegDst = 2'b00;
                        RegWrite = 1'b1;
                        // JumpAddr = 
                        Branch = 1'b0;
                        Dir = 1'b0;
                        Type = 1'b1;
                        ALUsel = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        MemToReg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUop = 4'b0100;
                        // LblSel = 
                    end
                endcase
            end
            6'b000011 : begin
                RegDst = 2'b00;
                RegWrite = 1'b1;
                // JumpAddr = 
                Branch = 1'b0;
                // Dir = 
                // Type = 
                ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 2'b10;
                ALUsrc = 1'b1;
                ALUop = 4'b0001;
                // LblSel = 
            end
            6'b000100 : begin
                RegDst = 2'b00;
                RegWrite = 1'b1;
                // JumpAddr = 
                Branch = 1'b0;
                // Dir = 
                // Type = 
                ALUsel = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 2'b10;
                ALUsrc = 1'b1;
                ALUop = 4'b0001;
                // LblSel = 
            end
            6'b000101 : begin
                RegDst = 2'b01;
                RegWrite = 1'b1;
                // JumpAddr = 
                Branch = 1'b0;
                // Dir = 
                // Type = 
                ALUsel = 1'b0;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                MemToReg = 2'b01;
                ALUsrc = 1'b1;
                ALUop = 4'b0001;
                // LblSel = 
            end
            6'b000110 : begin
                // RegDst = 2'b01;
                RegWrite = 1'b0;
                // JumpAddr = 
                Branch = 1'b0;
                // Dir = 
                // Type = 
                ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                // MemToReg = 2'b01;
                ALUsrc = 1'b1;
                ALUop = 4'b0001;
                // LblSel = 
            end
            6'b000111 : begin
                // RegDst = 2'b01;
                RegWrite = 1'b0;
                JumpAddr = 1'b0;
                Branch = 1'b1;
                // Dir = 
                // Type = 
                // ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                // MemToReg = 2'b01;
                // ALUsrc = 1'b1;
                ALUop = 4'b0000;
                LblSel = 1'b1;
            end
            6'b001000 : begin
                // RegDst = 2'b01;
                RegWrite = 1'b0;
                JumpAddr = 1'b0;
                Branch = 1'b1;
                // Dir = 
                // Type = 
                // ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                // MemToReg = 2'b01;
                // ALUsrc = 1'b1;
                ALUop = 4'b0000;
                LblSel = 1'b1;
            end
            6'b001001 : begin
                // RegDst = 2'b01;
                RegWrite = 1'b0;
                JumpAddr = 1'b0;
                Branch = 1'b1;
                // Dir = 
                // Type = 
                // ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                // MemToReg = 2'b01;
                // ALUsrc = 1'b1;
                ALUop = 4'b0000;
                LblSel = 1'b1;
            end
            6'b001010 : begin
                // RegDst = 2'b01;
                RegWrite = 1'b0;
                JumpAddr = 1'b1;
                Branch = 1'b1;
                // Dir = 
                // Type = 
                // ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                // MemToReg = 2'b01;
                // ALUsrc = 1'b1;
                ALUop = 4'b0000;
                // LblSel = 1'b1;
            end
            6'b001011 : begin
                // RegDst = 2'b01;
                RegWrite = 1'b0;
                JumpAddr = 1'b0;
                Branch = 1'b1;
                // Dir = 
                // Type = 
                // ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                // MemToReg = 2'b01;
                // ALUsrc = 1'b1;
                ALUop = 4'b0000;
                LblSel = 1'b0;
            end
            6'b001100 : begin
                RegDst = 2'b10;
                RegWrite = 1'b1;
                JumpAddr = 1'b0;
                Branch = 1'b1;
                // Dir = 
                // Type = 
                // ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 2'b00;
                // ALUsrc = 1'b1;
                ALUop = 4'b0000;
                LblSel = 1'b0;
            end
            6'b001101 : begin
                // RegDst = 2'b01;
                RegWrite = 1'b0;
                JumpAddr = 1'b0;
                Branch = 1'b1;
                // Dir = 
                // Type = 
                // ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                // MemToReg = 2'b01;
                // ALUsrc = 1'b1;
                ALUop = 4'b0000;
                LblSel = 1'b0;
            end
            6'b001110 : begin
                // RegDst = 2'b01;
                RegWrite = 1'b0;
                JumpAddr = 1'b0;
                Branch = 1'b1;
                // Dir = 
                // Type = 
                // ALUsel = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                // MemToReg = 2'b01;
                // ALUsrc = 1'b1;
                ALUop = 4'b0000;
                LblSel = 1'b0;
            end
        endcase
    end
endmodule