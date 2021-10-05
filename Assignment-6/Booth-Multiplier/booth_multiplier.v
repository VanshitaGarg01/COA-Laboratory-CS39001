module booth_multiplier #(parameter N = 8) (clk, rst, load, A, B, prod);
    input clk, rst, load;
    input signed [N-1:0] A, B;
    output reg [2*N-1:0] prod;

    reg right_bit = 1'b0;
    reg signed [2*N-1:0] pos_B, neg_B, prod_sofar;
    reg signed  [N-1:0] a, b;

    integer counter = 0;

    always @(posedge clk) begin
        if (rst) begin
            right_bit <= 1'b0;
            a <= 8'b0;
            b <= 8'b0;
            pos_B <= 16'b0;
            neg_B <= 16'b0;
            prod_sofar <= 16'b0;
            counter <= 0;
        end
        else if (load) begin
            right_bit <= 1'b0;
            a <= A;
            b <= B;
            pos_B <= {B, 8'b0};
            neg_B <= (~B + 1'b1) << 8;
            prod_sofar <= {8'b0, A};
            counter <= 0;
            // $display("time = %0d, A = %d, B = %d", $time, A, B);
        end
        else begin
            if (prod_sofar[0] == right_bit) begin
                prod_sofar <= prod_sofar >>> 1;
            end 
            else if (right_bit == 1'b0) begin
                prod_sofar <= (prod_sofar + neg_B) >>> 1;
            end 
            else begin
                prod_sofar <= (prod_sofar + pos_B) >>> 1;
            end
            right_bit <= prod_sofar[0];
            counter <= counter + 1;
        end
        // $monitor("time = %0d, prod_fir = %b, prod_last = %b, prod_sofar = %d, a = %d, b = %d, counter = %d", $time, prod_sofar[15:8], prod_sofar[7:0], prod_sofar, a, b, counter);
    end

    always @(*) begin
        if (counter <= 8)
            prod <= prod_sofar;
    end

    // initial begin
    //     #25 $display("pos_B = %b, neg_B = %b", pos_B, neg_B);
    // end

endmodule