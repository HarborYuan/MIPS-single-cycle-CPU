module PcUnit(PC,PcReSet,NPCOp,clk,Adress);

	input   PcReSet;
	input   clk;
	input   [31:0] Adress;
	input   [1:0]NPCOp;
	
	output reg[31:0] PC;
	
	integer i;
	reg [31:0] temp;
	always @(posedge PcReSet)
	begin
		PC = 32'h0040_0000;
	end

	always@(negedge clk)
	begin
		if (NPCOp == 2'b00)	
			PC = PC+4;
	  	if(NPCOp== 2'b10)
			PC = {PC[31:28],Adress[25:0],2'b00};
		if (NPCOp==2'b01)
			PC=Adress;
	end
endmodule