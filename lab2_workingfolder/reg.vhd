-------------------------
-- Author: Saurav Shandilya (Adapted from templated provided by Prof. Madhav Desai) 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: n-bit register 
-------------------------

-- author: Madhav Desai

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity reg is
  generic (
    nbits : integer:=2);                    -- no. of bits

  port (
    data_in  : in  bit_vector(nbits-1 downto 0);
    data_out : out bit_vector(nbits-1 downto 0);
    clk     : in  bit;
    enable   : in  bit;
    reset    : in  bit);
end reg;

architecture behave of reg is

begin  -- behave
process(clk,reset,enable)
begin 
  if(clk'event and clk = '1') then
    if(reset = '1') then
      data_out <= (others => '0');
    elsif enable = '1' then
      data_out <= data_in;
    end if;
  end if;
end process;
end behave;

