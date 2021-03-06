module flopr(clk, rst, d, q);
    parameter width=32;
    input clk;
    input rst;
    input [width-1:0] d;
    output reg [width-1:0] q;

    always @(negedge clk)
        if (~rst)
            q <= d;
        else
            q <= 0;
endmodule