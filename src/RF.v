module RF(A1, A2, A3, WD, RFWr, clk, RD1, RD2);
  input [4:0]A1;
  input [4:0]A2;
  input [4:0]A3;
  input [31:0]WD;
  input RFWr;
  input clk;
  output reg [31:0]RD1;
  output reg [31:0]RD2;
  
  reg[5:0] i;
  
  reg [31:0] data[31:0];
  initial
  begin
    for (i=0;i<32;i=i+1)
      data[i]=32'b0;
  end 
  
  always @(A1 or A2 or data[RD1] or data[RD2])
  begin
    RD1<=data[A1];
    RD2<=data[A2];
  end
  
  always @(negedge clk)
  begin
  if ((RFWr) && (A3!=5'b11111))
    data[A3]<=WD;
  if ((RFWr) && (A3==5'b11111))
    data[A3]<=WD+4;

  //For test
  for (i=0;i<32;i=i+1)
    begin
      $display("RegNum : %d",i);
      $display("%h",data[i]);
    end
  $display("---Run---");
  end
  //For test
endmodule
