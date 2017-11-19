module addpc(A,B,C);
    input [31:0]A;
    input [31:0]B;
    output reg [31:0]C;
    always@(A or B)
    begin
        C=A+4+(B<<2);
    end
endmodule