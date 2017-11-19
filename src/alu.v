module alu(C,Zero,A,B,ALUOp);

	input  [31:0] 		A;		//运算数据1
	input  [31:0]		B;		//运算数据2
	input  [1:0]		ALUOp;		//运算器控制信号
	
	output reg[31:0]		C;		//运算器输出结果
	output 					Zero;			//结果是否为零
	
	initial								//初始化数据
	begin
		C = 0;
	end	
	assign Zero = (C==0) ? 1 : 0;
	
	always@(A or B or ALUOp)
	begin
		case (ALUOp)
			0: C=A+B;
			1: C=A-B;
			2: C=A|B;
		endcase
	end

endmodule
