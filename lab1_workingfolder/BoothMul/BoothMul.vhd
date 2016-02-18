-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: Booth Multiplier implementation
-------------------------

-- ****** Booth Multiplier *******
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity boothmul is
PORT 
(
  sysclk: In bit;       -- clock
  reset: In bit;
  done: out bit;
  data_in1: in  bit_vector(7 downto 0);  -- 8 bit input - for Multiplier
  data_in2: in  bit_vector(7 downto 0);  -- 8 bit input - for Multiplicand 
  data_out: out bit_vector(15 downto 0)  --  16 bit output
);
end boothmul;

-- architecture
architecture arch of boothmul is

--component addition

 --- Add Datapath component
component bmdatapath
port 
( 
	sysclk: In bit;		-- input to data block
  reset: In bit;

  -- data signals to/from environment
  data_in1        : in  bit_vector(7 downto 0);  -- in data for Multiplier
  data_in2        : in  bit_vector(7 downto 0);  -- in data for Multiplicand 
  data_out       : out bit_vector(15 downto 0);  -- out data
    
	---- Signal to controller	
	countstatus: out std_logic_vector(3 downto 0);     -- checks status of counter. leave in std_logic
			
	---- Signal from controller
  enable_multiplier_reg: in bit;
	reset_multiplier_reg: in bit;

	enable_multiplicand_reg: in bit;
	reset_multiplicand_reg: in bit;

	enable_out_reg: in bit;
	reset_out_reg: in bit;
	
	enable_buffadder_reg:in bit;
	reset_buffadder_reg: in bit;
	
	enable_shiftreg: in bit;
	reset_shiftreg: in bit;
	
	enable_buffshifter_reg: in bit;
	reset_buffshifter_reg: in bit;
	
	loadmuxsel: in bit;
	
	counter_reset: in bit;
	counter_enable: in bit
);
end component;

 --- Add Controller component
 
component bmcontroller
port 
  (    
	   sysclk:	in bit;	-- system clock
	   reset: in bit;	
	   done:out bit;	-- output

	
	---- Signal from datapath	
	   countstatus: in std_logic_vector(3 downto 0);     -- checks status of counter. leave in std_logic
	
	---- Signal to datapath
     enable_multiplier_reg: out bit;
	   reset_multiplier_reg: out bit;

    	enable_multiplicand_reg: out bit;
    	reset_multiplicand_reg: out bit;

	   enable_out_reg: out bit;
    	reset_out_reg: out bit;
	
    	enable_buffadder_reg:out bit;
    	reset_buffadder_reg: out bit;
	
    	enable_buffshifter_reg: out bit;
    	reset_buffshifter_reg: out bit;

    	enable_shiftreg: out bit;
    	reset_shiftreg: out bit;
	
    	counter_reset: out bit;
    	counter_enable: out bit;
	
    	loadmuxsel: out bit
);
end component;

-- signals needed to connect ports

signal enable_multiplier_reg, enable_multiplicand_reg, enable_out_reg, enable_buffadder_reg, enable_shiftreg, enable_buffshifter_reg, counter_enable : bit;
signal reset_multiplier_reg, reset_multiplicand_reg, reset_out_reg, reset_buffadder_reg, reset_shiftreg, reset_buffshifter_reg, counter_reset : bit;
signal loadmuxsel : bit;
signal countstatus : std_logic_vector(3 downto 0);

-- begin arch
begin
  
--- Instance of Datapath module 
datapath1 : bmdatapath port map 
(
 	sysclk => sysclk,
  reset => reset,
   
   -- data signals to/from environment
  data_in1 => data_in1,
  data_in2 => data_in2,
  data_out => data_out,
    
	---- Signal to controller	
	countstatus => countstatus,
			
	---- Signal from controller
  enable_multiplier_reg => enable_multiplier_reg,
	reset_multiplier_reg => reset_multiplier_reg,
	
	enable_multiplicand_reg => enable_multiplicand_reg,
	reset_multiplicand_reg => reset_multiplicand_reg,

	enable_out_reg=> enable_out_reg,
	reset_out_reg=>reset_out_reg,
	
	enable_buffadder_reg => enable_buffadder_reg,
	reset_buffadder_reg => reset_buffadder_reg,
	
	enable_shiftreg => enable_shiftreg,
	reset_shiftreg => reset_shiftreg,
	
	enable_buffshifter_reg => enable_buffshifter_reg,
	reset_buffshifter_reg => reset_buffshifter_reg,
	
	loadmuxsel => loadmuxsel,
	
	counter_reset => counter_reset,
	counter_enable => counter_enable 
);

--- Instance of Controller module
controller1 : bmcontroller port map 
(
    
	sysclk => sysclk, 
	reset => reset,	
	done => done,

	
	---- Signal from datapath	
	countstatus => countstatus,
	
	---- Signal to datapath
	
  enable_multiplier_reg => enable_multiplier_reg,
	reset_multiplier_reg => reset_multiplier_reg,

	enable_multiplicand_reg => enable_multiplicand_reg,
	reset_multiplicand_reg => reset_multiplicand_reg, 

	enable_out_reg => enable_out_reg, 
	reset_out_reg => reset_out_reg,
	
	enable_buffadder_reg=> enable_buffadder_reg,
	reset_buffadder_reg => reset_buffadder_reg,
	
	enable_buffshifter_reg=> enable_buffshifter_reg,
	reset_buffshifter_reg => reset_buffshifter_reg,

	enable_shiftreg => enable_shiftreg,
	reset_shiftreg => reset_shiftreg,
	
	counter_reset => counter_reset,
	counter_enable => counter_enable,
	
	loadmuxsel => loadmuxsel
);

end arch;
