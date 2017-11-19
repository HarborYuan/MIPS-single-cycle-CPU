module IM(OpCode,ImAdress);
	input [31:0] ImAdress;
	output reg [31:0] OpCode;
	reg [31:0] IMem[1024:0];
	

	initial
	begin
		IMem[0]=32'h341d000c;
		IMem[1]=32'h34021234;
		IMem[2]=32'h34033456;
		IMem[3]=32'h00432021;
		IMem[4]=32'h00643023;
		IMem[5]=32'hac020000;
		IMem[6]=32'hac030004;
		IMem[7]=32'hafa40004;
		IMem[8]=32'h8c050000;
		IMem[9]=32'h10450001;
		IMem[10]=32'h8fa30004;
		IMem[11]=32'h8c050004;
		IMem[12]=32'h1065fffd;
		IMem[13]=32'h0c10000e;
		IMem[14]=32'h00c23023;
		IMem[15]=32'hafa6fffc;
		IMem[16]=32'h1064ffff;
	end
	always@(ImAdress)
	begin
		OpCode = IMem[(ImAdress-4194304)>>2];
	end
endmodule