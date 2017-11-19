library verilog;
use verilog.vl_types.all;
entity ctrl is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        OP              : in     vl_logic_vector(5 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        Zero            : in     vl_logic;
        Bsel            : out    vl_logic;
        WDSel           : out    vl_logic_vector(1 downto 0);
        RFWr            : out    vl_logic;
        DMWr            : out    vl_logic;
        NPCOp           : out    vl_logic_vector(1 downto 0);
        EXTOp           : out    vl_logic_vector(1 downto 0);
        ALUOp           : out    vl_logic_vector(1 downto 0);
        PCWr            : out    vl_logic;
        IRWr            : out    vl_logic;
        GPRSel          : out    vl_logic_vector(1 downto 0)
    );
end ctrl;
