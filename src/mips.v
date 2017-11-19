module mips(clk,PcReSet,PC,Instruction);
    wire [4:0]Read_Addr_1; 
    wire [4:0]Read_Addr_2; 
    wire [4:0]Write_Addr;
    wire [31:0]Write_Data;
    wire RFWr;
    input clk;
    wire [31:0]Read_Data_1;
    wire [31:0]Read_Data_2;
    RF RegisteFile(Read_Addr_1, Read_Addr_2, Write_Addr,Write_Data, RFWr, clk, Read_Data_1, Read_Data_2);
    
    wire [31:0]ALU_A;
    wire [31:0]ALU_B;
    wire Zero;
    wire [1:0]ALUOp;
    wire [31:0]ALU_C;
    alu AALLUU(ALU_C, Zero, ALU_A, ALU_B, ALUOp);
    
    output wire [31:0]Instruction;
    wire [31:0] Read_Address;
    IM InstructionMemory(Instruction, Read_Address);

    output wire [31:0]PC;
    input PcReSet; 
    wire [31:0]Adress;
    wire [1:0] NPCOp;
    PcUnit pppccc(PC, PcReSet,NPCOp, clk, Adress);

    wire [15:0]Imm16;
    wire [1:0]EXTOp; 
    wire [31:0]Imm32;
    EXT eexxtt(Imm16, EXTOp, Imm32);

    wire [31:0]dout;
    wire [31:0]addr;
    wire [31:0]din;
    wire DMWr;
    DM DataMemory(dout,addr,din,DMWr,clk);

    wire [31:0]adder;
    addpc addppcc(PC,Imm32,adder);

    wire Bsel;
    mux ALUsec(Bsel,ALU_B,Read_Data_2,Imm32);

    wire [1:0]WDSel;
    mux #(4,2,32) RFWsec(WDSel,Write_Data,ALU_C,dout,PC);
    
    wire [1:0]GPRSel;
    mux #(4,2,5) RFWAsec(GPRSel,Write_Addr,Instruction[15:11],Instruction[20:16],5'b11111);

    //wire [1:0]NPCOp;
    mux #(4,2,32) PCsssel(NPCOp,Adress,32'b0,adder,{6'b0,Instruction[25:0]});

    wire rst,IRWr,PCWr;
    ctrl Control(clk, rst, Instruction[31:26], Instruction[5:0], Zero, Bsel, WDSel, RFWr, DMWr, NPCOp, EXTOp, ALUOp,PCWr, IRWr, GPRSel);



    assign Read_Addr_1 = Instruction[25:21];
    assign Read_Addr_2 = Instruction[20:16];
    assign ALU_A = Read_Data_1;
    assign din = Read_Data_2;
    assign addr = ALU_C;
    assign Read_Address = PC;
    assign Imm16 = Instruction[15:0];
endmodule