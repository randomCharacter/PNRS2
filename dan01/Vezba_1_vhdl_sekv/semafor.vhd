----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity semafor is
    Port ( clk : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           Sel_in : in  STD_LOGIC_VECTOR (1 downto 0);
           RGB_A : out  STD_LOGIC_VECTOR (2 downto 0);
           RGB_B : out  STD_LOGIC_VECTOR (2 downto 0));
end semafor;

architecture Behavioral of semafor is

begin


end Behavioral;

