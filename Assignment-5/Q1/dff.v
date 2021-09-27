module dff (d, q, rst, clk);
    input d, rst, clk;
    output reg q;
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule