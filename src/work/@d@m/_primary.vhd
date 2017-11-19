library verilog;
use verilog.vl_types.all;
entity DM is
    port(
        dout            : out    vl_logic_vector(31 downto 0);
        addr            : in     vl_logic_vector(31 downto 0);
        din             : in     vl_logic_vector(31 downto 0);
        DMWr            : in     vl_logic;
        clk             : in     vl_logic
    );
end DM;
