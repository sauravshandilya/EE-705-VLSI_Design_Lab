library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fullAdder_8bit_tb is
end fullAdder_8bit_tb;

architecture arch of fullAdder_8bit_tb is

   component fullAdder_8bit is
      port( 	A, B : in std_logic_vector(7 downto 0); 
		sum: out std_logic_vector(7 downto 0); 
		Cout : out std_logic);
   end component;

   signal A, B: std_logic_vector(7 downto 0):="00000000"; 
   signal Cout: std_logic:='0';
   signal sum : std_logic_vector(7 downto 0):="00000000"; 

begin
   mapping: fullAdder_8bit port map(A, B, sum, Cout);

   process
   variable errCnt : integer := 0;
   variable count: integer range 0 to 255;
   begin

   grp_gen: for i in 0 to 255 loop
	A <= std_logic_vector(to_unsigned(i, A'length));
	B <= "00000001";
	wait for 10 ns;
	end loop grp_gen;
      
     

     ---- SUMMARY ----
     if(errCnt = 0) then
        assert false report "Success!" severity note;
     else
        assert false report "Faillure!" severity note;
     end if;
     wait;	
   end process;
end arch;
-------------------------------------------------------------
configuration cfg_tb of fullAdder_8bit_tb is
   for arch
   end for;
end cfg_tb;
