library verilog;
use verilog.vl_types.all;
entity mux is
    generic(
        num             : integer := 2;
        sigwid          : integer := 1;
        width           : integer := 32
    );
    port(
        s               : in     vl_logic_vector;
        y               : out    vl_logic_vector;
        d0              : in     vl_logic_vector;
        d1              : in     vl_logic_vector;
        d2              : in     vl_logic_vector;
        d3              : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of num : constant is 1;
    attribute mti_svvh_generic_type of sigwid : constant is 1;
    attribute mti_svvh_generic_type of width : constant is 1;
end mux;
