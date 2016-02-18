library ieee;
use ieee.std_logic_1164.all;

entity Demux_1to2 is
   port( 
        demux_in: in bit ; -- the signal source
           demux_sel : in bit; -- the selector switches
   demux_D0, demux_D1 : out bit);-- the output data lines
end Demux_1to2;
--
architecture arch of Demux_1to2 is

component myand 
   port( in1, in2 : in bit;
            out1 : out bit);
end component; 

component mynot is					
   port( in1 : in bit;
        out1 : out bit);
end component;

   signal notout0 : bit;

begin
   GI1: mynot  port map(demux_sel, notout0);

   GA1: myand  port map(demux_in, notout0, demux_D0); -- D0
   GA2: myand  port map(demux_in, demux_sel,demux_D1);      -- D1
     
end arch;