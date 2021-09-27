module two_complement_tb;
    reg clk, rst, x;
    wire out;
    reg [10:0] inp = 11'b01010011100;
    integer i;

    two_complement TC1 (.out(out), .x(x), .rst(rst), .clk(clk));
    
    initial begin
        clk = 0;
        rst = 1; 
        x = 0;
        #2 rst = 0; 

        for (i = 0; i <= 10 ; i++) begin
            #10 x = inp[i]; 
        end

        #10 $finish;   
    end

    always begin
        #5 clk = ~clk;
        $display($time, " %b", out);
    end
        


endmodule