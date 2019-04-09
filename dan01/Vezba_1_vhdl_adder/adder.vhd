
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;


entity adder is
    Port ( A_in : in  STD_LOGIC_VECTOR (7 downto 0);
           B_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel_in : in  STD_LOGIC;
           Rez_out : out  STD_LOGIC_VECTOR (8 downto 0));
end adder;

architecture Behavioral of adder is

begin

Rez_out <= (A_in(7) & A_in) + (B_in(7) & B_in);


end Behavioral;

