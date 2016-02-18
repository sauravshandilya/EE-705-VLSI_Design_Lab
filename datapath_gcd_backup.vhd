-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: GCD datapath implementation
-------------------------


-- ****** Datapath *******
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity gcd_datapath is
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
	
	enable_sub1buffout_reg: in bit;
	reset_sub1buffout_reg: in bit;
	
	enable_sub2buffout_reg: in bit;
	reset_sub2buffout_reg: in bit;
	
	data1muxsel: in bit;
	data2muxsel: in bit	
);
end gcd_datapath;

-- Architecture 
architecture arch of gcd_datapath is

-- components

component reg
  generic ( nbits : integer);                    -- no. of bits

  port (
    data_in : in bit_vector(nbits-1 downto 0);
    data_out : out bit_vector(nbits-1 downto 0);
    clk : in bit;
    enable : in  bit;
    reset : in  bit
    );
  end component;


component toPositive        -- convert signed number to unsigned
port 
(
    input : in bit_vector(7 downto 0);
    isnegative : out bit;
    output : out bit_vector(7 downto 0);
    clk : in bit;
    reset : in bit;   
    enable : in bit  
);
end component;

component comparator_8bit is
port
(
  comp_in1 : in bit_vector(7 downto 0) ;
  comp_in2 : in bit_vector(7 downto 0) ;  
  eql,grt,lss : out bit 
);
end component;

component fulladdsub is		--- import adder
	PORT (A,B:IN bit_vector(7 DOWNTO 0); addsub:IN bit; sum:OUT bit_vector(7 DOWNTO 0);Cout:OUT bit);
end component;

component Mux2x1_8bit is
	PORT ( Mux_in_1:IN bit_vector(7 DOWNTO 0);
			Mux_in_2:IN bit_vector(7 DOWNTO 0);
			sel:IN bit; 
			mux_out:OUT bit_vector(7 DOWNTO 0)
			);
end component;

-- signals
signal sig_positive_data1, sig_positive_data2 : bit_vector (7 downto 0);
signal sig_mux1out,sig_mux2out : bit_vector (7 downto 0);
signal sig_sub1out,sig_sub2out : bit_vector (7 downto 0);
signal sig_reg1out,sig_reg2out : bit_vector (7 downto 0);
signal sig_isnegative1,sig_isnegative2 : bit;
signal sig_data_sub1buffout,sig_data_sub2buffout : bit_vector(7 downto 0);

begin
-- step-1 check if number is signed or unsigned .. if signed convert it to unsigned.
posdata1 : toPositive 
    port map(
        input => data_in1,
        isnegative => sig_isnegative1,
        output => sig_positive_data1,
        clk => sysclk,
        reset => reset_topositive,
        enable => enable_topositive);
        
posdata2 : toPositive 
    port map(
        input => data_in2,
        isnegative => sig_isnegative2,
        output => sig_positive_data2,
        clk => sysclk,
        reset => reset_topositive,
        enable => enable_topositive);

-- step-2 Select between datain and updated data
muxdata1 : Mux2x1_8bit 
    port map ( 
        Mux_in_1 => sig_positive_data1,
        Mux_in_2 => sig_data_sub1buffout,
        sel => data1muxsel,
		mux_out => sig_mux1out);

muxdata2 : Mux2x1_8bit 
    port map ( 
        Mux_in_1 => sig_positive_data2,
        Mux_in_2 => sig_data_sub2buffout,
        sel => data2muxsel,
		mux_out => sig_mux2out);

-- step-3 Store Mux output in register
reg1data1 : reg
    generic map ( nbits => 8 )
    port map (
      data_in  => sig_mux1out,    
      data_out => sig_reg1out,
      clk    => sysclk,
      reset  => reset_data1_reg,
      enable => enable_data1_reg);

reg2data2 : reg
    generic map ( nbits => 8 )
    port map (
      data_in  => sig_mux2out,
      data_out => sig_reg2out,
      clk    => sysclk,
      reset  => reset_data2_reg,
      enable => enable_data2_reg);  
       
-- step-4 compare value 
comp : comparator_8bit
    port map(
        comp_in1 => sig_reg1out,
        comp_in2 => sig_reg2out, 
        eql => eql,
        grt => open,
        lss => lss );        

-- step-5 perform subtraction
sub1 : fulladdsub
	port map(
        A => sig_reg1out,  
        B => sig_reg2out,
        addsub => '1', 
        sum => sig_sub1out, 
        Cout => open );
        
sub2 : fulladdsub
	port map(
        A => sig_reg2out,  
        B => sig_reg1out,
        addsub => '1', 
        sum => sig_sub2out, 
        Cout => open );

sub1buff : reg
    generic map ( nbits => 8 )
    port map (
      data_in  => sig_sub1out,    -- output data
      data_out => sig_data_sub1buffout,
      clk    => sysclk,
      reset  => reset_sub1buffout_reg,
      enable => enable_sub1buffout_reg); 
      
sub2buff : reg
    generic map ( nbits => 8 )
    port map (
      data_in  => sig_sub2out,    -- output data
      data_out => sig_data_sub2buffout,
      clk    => sysclk,
      reset  => reset_sub2buffout_reg,
      enable => enable_sub2buffout_reg);      


-- step-6 Output data        
reg3out : reg
    generic map ( nbits => 8 )
    port map (
      data_in  => sig_reg1out,    -- output data
      data_out => data_out,
      clk    => sysclk,
      reset  => reset_out_reg,
      enable => enable_out_reg); 
       
  
end arch;  