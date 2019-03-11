
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

signal C_s : STD_LOGIC_VECTOR (7 downto 0);

begin

C_s <= B_in when B_in(7) = '0' else
        "1" & (-B_in(6 downto 0));

Rez_out <= (A_in(7) & A_in) + (C_s (7) & C_s) when Sel_in = '0' else
           (A_in(7) & A_in) + (C_s (7) & C_s);

end Behavioral;

