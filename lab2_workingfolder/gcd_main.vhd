-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: GCD Implementation (Lab-2)
    
-------------------------

-- library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- entity 
entity GCDmain is
    port ( 
          reset,clk,start:	in bit;
          done: out bit;
          X, Y:	in	bit_vector (7 downto 0);
          Z:	out	bit_vector (7 downto 0)
        );
end	GCDmain;

-- architecture
architecture arch of GCDmain is

--component addition

 --- Add Datapath component
component gcd_datapath 
port 
( 
	sysclk: In bit;		-- input to data block
  reset: In bit;
  
  -- data signals to/from environment
  data_in1        : in  bit_vector(7 downto 0);  -- in data-1
  data_in2        : in  bit_vector(7 downto 0);  -- in data-2
  data_out       : out bit_vector(7 downto 0);  -- gcd
    
	---- Signal going from datapath to controller	
	eql : out bit;   -- comparator equal output
	lss : out bit;   -- comparator less then output 
			
	---- Signal from controller coming into datapath
    enable_data1_reg: in bit;
	reset_data1_reg: in bit;

	enable_data2_reg: in bit;
	reset_data2_reg: in bit;

	enable_out_reg: in bit;
	reset_out_reg: in bit;
	
	enable_topositive: in bit;
	reset_topositive: in bit;
	
	data1muxsel: in bit;
	data2muxsel: in bit	
);
end component;

 --- Add Controller component
 component gcd_controller is
port 
( 
	sysclk: In bit;		-- input to data block
    reset: In bit;
    start: In bit;
    done: out bit;
    
	---- Signal from datapath to controller	
	eql : in bit;   -- comparator equal output
	lss : in bit;   -- comparator less then output 
			
	---- Signal going from controller into datapath
    enable_data1_reg: out bit;
	reset_data1_reg: out bit;

	enable_data2_reg: out bit;
	reset_data2_reg: out bit;

	enable_out_reg: out bit;
	reset_out_reg: out bit;
	
	enable_topositive: out bit;
	reset_topositive: out bit;
	
	data1muxsel: out bit;
	data2muxsel: out bit	
);
end component;

-- signals needed to connect ports

signal enable_data1_reg, enable_data2_reg, enable_out_reg, enable_topositive, data1muxsel : bit;
signal reset_data1_reg, reset_data2_reg, reset_out_reg, reset_topositive, data2muxsel : bit;
signal eql,lss : bit;

-- begin arch
begin
  
--- Instance of Datapath module 
datapath1 : gcd_datapath port map 
(
	  sysclk => clk,		-- input to data block
    reset => reset,
    --done => done,
  
  -- data signals to/from environment
  data_in1 => X,
  data_in2 => Y,
  data_out => Z,
    
	---- Signal going from datapath to controller	
	eql => eql,
	lss => lss,
			
	---- Signal from controller coming into datapath
  enable_data1_reg => enable_data1_reg,
	reset_data1_reg => reset_data1_reg,

	enable_data2_reg => enable_data2_reg,
	reset_data2_reg =>reset_data2_reg,

	enable_out_reg => enable_out_reg,
	reset_out_reg => reset_out_reg,
	
	enable_topositive => enable_topositive,
	reset_topositive => reset_topositive,
	
	data1muxsel => data1muxsel,
	data2muxsel => data2muxsel
);

--- Instance of Controller module
controller1 : gcd_controller 
port map( 
    sysclk => clk,		-- input to data block
    reset => reset,
    start => start,
    
	---- Signal from datapath to controller	
---- Signal going from datapath to controller	
	eql => eql,
	lss => lss,
			
	---- Signal from controller coming into datapath
    enable_data1_reg => enable_data1_reg,
	reset_data1_reg => reset_data1_reg,

	enable_data2_reg => enable_data2_reg,
	reset_data2_reg =>reset_data2_reg,

	enable_out_reg => enable_out_reg,
	reset_out_reg => reset_out_reg,
	
	enable_topositive => enable_topositive,
	reset_topositive => reset_topositive,
	
	data1muxsel => data1muxsel,
	data2muxsel => data2muxsel
);

end arch;

