-- To include Library
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;


entity complement
(
  data_in : in bit_vector(3 downto 0);
  data_out : out bit_vector(3 downto 0);
  
);
end complement;