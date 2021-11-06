// The Bidirectional Barrel Shifter module
module barrel_shifter (
    input [31:0] in, 
    input [31:0] shamt, 
    input dir, 
    input aorl,
    output reg [31:0] out
);

    always @(*) begin
        if (aorl) begin
            if (!dir) begin
                out = in <<< shamt;
            end else begin
                out = in;
            end
        end else begin
            if (!dir) begin
                out = in << shamt;
            end else begin
                out = in >> shamt;
            end
        end
    end

endmodule