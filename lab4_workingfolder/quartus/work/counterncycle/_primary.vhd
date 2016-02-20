library verilog;
use verilog.vl_types.all;
entity counterncycle is
    generic(
        nbit            : integer := 5;
        maxcount        : integer := 30
    );
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        counterout      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of nbit : constant is 1;
    attribute mti_svvh_generic_type of maxcount : constant is 1;
end counterncycle;
