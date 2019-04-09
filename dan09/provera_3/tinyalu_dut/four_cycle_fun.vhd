--   Copyright 2013 Ray Salemi
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
-- VHDL Architecture tinyalu_lib.four_cycle.mult
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY four_cycle IS
   PORT(
      A           : IN     unsigned ( 7 DOWNTO 0 );
      B           : IN     unsigned ( 7 DOWNTO 0 );
      clk         : IN     std_logic;
      reset_n     : IN     std_logic;
      start       : IN     std_logic;
      done_fun   : OUT    std_logic;
      result_fun : OUT    unsigned (15 DOWNTO 0)
   );

-- Declarations

END four_cycle ;

--
architecture fun of four_cycle is
  signal a_int,b_int : unsigned (7 downto 0);  -- start pipeline
  signal mult1,mult2,mult3 : unsigned (15 downto 0);  -- pipeline registers
  signal done4,done3,done2,done1,done_fun_int : std_logic;       -- pipeline the done signal
begin
  -- purpose: Three stage pipelined funp
  -- type   : sequential
  -- inputs : clk, reset_n, a,b
  -- outputs: result_fun
  funp: process (clk, reset_n)
  begin  -- process funp
    if reset_n = '0' then               -- asynchronous reset (active low)
      done_fun_int <= '0';
	  done4 <= '0';
      done3 <= '0';
      done2 <= '0';
      done1 <= '0';
	  
	  a_int <= "00000000";
	  b_int <= "00000000";
      mult1 <= "0000000000000000";
      mult2 <= "0000000000000000";
      mult3 <= "0000000000000000";
      result_fun <= "0000000000000000";
    elsif clk'event and clk = '1' then  -- rising clock edge
      a_int <= a;
      b_int <= b;
      mult1 <= conv_unsigned(0, 8) & a_int;
      mult2 <= conv_unsigned(4, 8) * b_int;
	    mult3 <= mult1 + mult2;
      result_fun <= conv_unsigned(0, 8) & a + conv_unsigned(4, 8) * b;
	    done4 <= start and (not done_fun_int);
      done3 <= done4 and (not done_fun_int);
      done2 <= done3 and (not done_fun_int);
      done1 <= done2 and (not done_fun_int);
      done_fun_int <= done1 and (not done_fun_int);
    end if;
  end process funp;
  done_fun <= done_fun_int;
end architecture fun;


