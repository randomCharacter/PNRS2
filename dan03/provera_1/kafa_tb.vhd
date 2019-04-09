
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY kafa_tb IS
END kafa_tb;

ARCHITECTURE behavior OF kafa_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT kafa
    PORT(
         clk                 : IN  std_logic;
         reset_n             : IN  std_logic;
         coin_avail          : IN  std_logic;
         water_avail         : IN  std_logic;
         coffee_powder_avail : IN  std_logic;
         plastic_glass_avail : IN  std_logic;
         plastic_glass       : OUT std_logic;
         coffee_powder       : OUT std_logic;
         hot_water           : OUT std_logic;
         unlock              : OUT std_logic;
         coin_return         : OUT std_logic
        );
    END COMPONENT;


   --Inputs
   signal clk                 : std_logic := '0';
   signal reset_n             : std_logic := '0';
   signal coin_avail          : std_logic := '0';
   signal water_avail         : std_logic := '0';
   signal coffee_powder_avail : std_logic := '0';
   signal plastic_glass_avail : std_logic := '0';

 	--Outputs
   signal plastic_glass       : std_logic;
   signal coffee_powder       : std_logic;
   signal hot_water           : std_logic;
   signal unlock              : std_logic;
   signal coin_return         : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: kafa PORT MAP (
         clk                 => clk,
         reset_n             => reset_n,
         coin_avail          => coin_avail,
         water_avail         => water_avail,
         coffee_powder_avail => coffee_powder_avail,
         plastic_glass_avail => plastic_glass_avail,
         plastic_glass       => plastic_glass,
         coffee_powder       => coffee_powder,
         hot_water           => hot_water,
         unlock              => unlock,
         coin_return         => coin_return
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for clk_period*10;

      -- insert stimulus here

      wait;
   end process;

END;
