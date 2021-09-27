module two_complement_tb;
    reg clk, rst, x;
    wire out;
    parameter N = 11;
    reg [N-1:0] inp = 11'b01010011100;
    integer i, j;

    two_complement TC1 (.out(out), .x(x), .rst(rst), .clk(clk));
    
    initial begin
        clk = 0;
        rst = 1; 
        x = 0;

        #2 rst = 0; 

        for (i = 0; i < N; i++) begin
            #10 x = inp[i];
        end
        
        #10 $finish;   
    end

    initial begin
        #5
        for (j = 0; j < N; j++) begin
            #10
            $display("time = %0d, out = %b", $time, out);
        end
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
