module DM(dout,addr,din,DMWr,clk);
	input [31:0] addr;
	input [31:0] din;
	input 		 DMWr;
	input 		 clk;
	
	output[31:0] dout;
	
	reg [31:0]  data[1023:0];
	integer i;

	initial
	begin
		for (i=0;i<2014;i=i+1)
			data[i]<=0;
	end
	
	always@(negedge clk)
	begin
		if(DMWr)
			data[addr>>2] <= din;
	end
	assign dout = data[addr>>2];
endmodule
