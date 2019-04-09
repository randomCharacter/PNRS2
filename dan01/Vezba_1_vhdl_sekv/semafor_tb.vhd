
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY semafor_tb IS
END semafor_tb;

ARCHITECTURE behavior OF semafor_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT semafor
    PORT(
         clk : IN  std_logic;
         reset_n : IN  std_logic;
         Sel_in : IN  std_logic_vector(1 downto 0);
         RGB_A : OUT  std_logic_vector(2 downto 0);
         RGB_B : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal reset_n : std_logic := '0';
   signal Sel_in : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal RGB_A : std_logic_vector(2 downto 0);
   signal RGB_B : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: semafor PORT MAP (
          clk => clk,
          reset_n => reset_n,
          Sel_in => Sel_in,
          RGB_A => RGB_A,
          RGB_B => RGB_B
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
      reset_n <= '0';
      wait for 100 ns;
      reset_n <= '1';

      wait for clk_period*10;

      -- insert stimulus here

      wait;
   end process;

END;
