module shift_register #(parameter N = 32) (clk, rst, load, parallel_in, out);
    input clk, rst, load;
    input [N-1:0] parallel_in;
    output reg out;
    
    reg [N-1:0] val;

    always @(posedge clk or posedge rst or posedge load) begin
        if (rst)
            val <= 32'b0;
        else if (load)
            val <= parallel_in;
        else
            val <= {val[N-2:0], 1'b0};
        out <= val[N-1];
    end
endmodule
