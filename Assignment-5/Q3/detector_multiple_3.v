module detector_multiple_3 (out, x, rst, clk);
    input x, rst, clk;
    output reg out;
    reg [1:0] PS, NS;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

    always @ (posedge clk or posedge rst) begin
        if (rst)
            PS <= S0;
        else 
            PS <= NS;
        
    end

    always @ (*) begin
        case (PS)
            S0: NS = (x) ? S1 : S0;
            S1: NS = (x) ? S0 : S2;
            S2: NS = (x) ? S2 : S1;
        endcase
    end

    always @ (*) begin
        case (PS)
            S0: out = (x) ? 0 : 1;
            S1: out = (x) ? 1 : 0;
            S2: out = 0;
        endcase
    end

endmodule