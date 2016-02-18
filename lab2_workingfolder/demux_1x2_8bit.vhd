---library 
Library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity demux_1x2_nbit is
generic (nbits:integer:=8);     -- 8 bit 
port( 
  demux_in : in bit_vector(nbits-1 downto 0);
  demux_sel: in bit; 
	demux_D0, demux_D1 : out bit_vector(nbits-1 downto 0)
);
end demux_1x2_nbit;

architecture arch of demux_1x2_nbit is
  
component myand 
   port( in1, in2 : in bit;
            out1 : out bit);
end component; 

component mynot is					
   port( in1 : in bit;
        out1 : out bit);
end component;

   signal out_notgate : bit;
   
begin
  notgate1: mynot  port map(demux_sel, out_notgate);
  grp_gen: for i in 0 to 7 generate
   andgate1: myand  port map(demux_in(i), out_notgate, demux_D0(i)); -- D0
   andgate2: myand  port map(demux_in(i), demux_sel,demux_D1(i));      -- D1
	end generate grp_gen;    

  
end arch;
