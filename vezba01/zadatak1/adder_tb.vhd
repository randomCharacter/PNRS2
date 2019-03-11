--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:52:38 03/01/2019
-- Design Name:   
-- Module Name:   D:/work/NASTAVA_2018-19/UVM/Vezbe_2019/Vezba1_vhdl_komb/adder_tb.vhd
-- Project Name:  Vezba1_vhdl_komb
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY adder_tb IS
END adder_tb;
 
ARCHITECTURE behavior OF adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder
    PORT(
         A_in : IN  std_logic_vector(7 downto 0);
         B_in : IN  std_logic_vector(7 downto 0);
         Sel_in : IN  std_logic;
         Rez_out : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A_in : std_logic_vector(7 downto 0) := (others => '0');
   signal B_in : std_logic_vector(7 downto 0) := (others => '0');
   signal Sel_in : std_logic := '0';

 	--Outputs
   signal Rez_out : std_logic_vector(8 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder PORT MAP (
          A_in => A_in,
          B_in => B_in,
          Sel_in => Sel_in,
          Rez_out => Rez_out
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
      Sel_in <= '0';
      A_in <= "00001111";
      B_in <= "10001111";

      wait for 100 ns;	
      -- insert stimulus here 
      Sel_in <= '1';
      A_in <= "00000000";
      B_in <= "00000011";
      

      wait;
   end process;

END;
