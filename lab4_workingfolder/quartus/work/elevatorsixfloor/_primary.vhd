library verilog;
use verilog.vl_types.all;
entity elevatorsixfloor is
    generic(
        floorcount      : integer := 6;
        state_bits      : integer := 3;
        s_init          : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        s_idle          : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        s_up            : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        s_down          : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        s_stop          : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        s_door          : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1)
    );
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        carcall         : in     vl_logic_vector;
        hallcall_up     : in     vl_logic_vector;
        hallcall_down   : in     vl_logic_vector;
        floorsensor     : in     vl_logic_vector;
        carled          : out    vl_logic_vector;
        hallcall_upled  : out    vl_logic_vector;
        hallcall_downled: out    vl_logic_vector;
        floorindicatorled: out    vl_logic_vector;
        dooropen        : out    vl_logic;
        dir_up          : out    vl_logic;
        dir_down        : out    vl_logic;
        liftmoving      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of floorcount : constant is 1;
    attribute mti_svvh_generic_type of state_bits : constant is 1;
    attribute mti_svvh_generic_type of s_init : constant is 1;
    attribute mti_svvh_generic_type of s_idle : constant is 1;
    attribute mti_svvh_generic_type of s_up : constant is 1;
    attribute mti_svvh_generic_type of s_down : constant is 1;
    attribute mti_svvh_generic_type of s_stop : constant is 1;
    attribute mti_svvh_generic_type of s_door : constant is 1;
end elevatorsixfloor;
