----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity kafa is
    Port ( clk                 : in  STD_LOGIC;
           reset_n             : in  STD_LOGIC;
           coin_avail          : in  STD_LOGIC;
           water_avail         : in  STD_LOGIC;
           coffee_powder_avail : in  STD_LOGIC;
           plastic_glass_avail : in  STD_LOGIC;
           plastic_glass       : out STD_LOGIC;
           coffee_powder       : out STD_LOGIC;
           hot_water           : out STD_LOGIC;
           unlock              : out STD_LOGIC;
           coin_return         : out STD_LOGIC
         );
end kafa;

architecture Behavioral of kafa is

begin


end Behavioral;

