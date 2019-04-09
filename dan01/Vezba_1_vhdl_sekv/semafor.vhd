----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity semafor is
    Port ( clk : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           Sel_in : in  STD_LOGIC_VECTOR (1 downto 0);
           RGB_A : out  STD_LOGIC_VECTOR (2 downto 0);
           RGB_B : out  STD_LOGIC_VECTOR (2 downto 0));
end semafor;

architecture Behavioral of semafor is
signal count_s : STD_LOGIC_VECTOR(15 downto 0);
type states_t is (IDLE, GREEN, YELLOW1, RED, YELLOW2);
signal state, state_next : states_t;
begin

    process (clk, reset_n) begin
        if reset_n = '0' then
            count_s <= (others => '0');
        elsif rising_edge(clk) then
            if Sel_in = "00" then
                case state is
                    when IDLE =>
                        state_next <= GREEN;
                    when GREEN =>
                        if (count_s >= 30) then
                            state_next <= YELLOW1;
                            count_s <= (others => '0');
                        else
                            state_next <= GREEN;
                            count_s <= count_s + 1;
                        end if;
                    when YELLOW1 =>
                        if (count_s >= 7) then
                            state_next <= RED;
                            count_s <= (others => '0');
                        else
                            state_next <= YELLOW1;
                            count_s <= count_s + 1;
                        end if;
                    when RED =>
                        if (count_s >= 30) then
                            state_next <= YELLOW2;
                            count_s <= (others => '0');
                        else
                            state_next <= RED;
                            count_s <= count_s + 1;
                        end if;
                    when others =>
                        if (count_s >= 7) then
                            state_next <= GREEN;
                            count_s <= (others => '0');
                        else
                            state_next <= YELLOW2;
                            count_s <= count_s + 1;
                        end if;
                end case;
            elsif Sel_in = "01" then
                case state is
                    when IDLE =>
                        state_next <= GREEN;
                    when GREEN =>
                        if (count_s >= 40) then
                            state_next <= YELLOW1;
                            count_s <= (others => '0');
                        else
                            state_next <= GREEN;
                            count_s <= count_s + 1;
                        end if;
                    when YELLOW1 =>
                        if (count_s >= 7) then
                            state_next <= RED;
                            count_s <= (others => '0');
                        else
                            state_next <= YELLOW1;
                            count_s <= count_s + 1;
                        end if;
                    when RED =>
                        if (count_s >= 20) then
                            state_next <= YELLOW2;
                            count_s <= (others => '0');
                        else
                            state_next <= RED;
                            count_s <= count_s + 1;
                        end if;
                    when others =>
                        if (count_s >= 7) then
                            state_next <= GREEN;
                            count_s <= (others => '0');
                        else
                            state_next <= YELLOW2;
                            count_s <= count_s + 1;
                        end if;
                end case;
            else
                case state is
                    when IDLE =>
                        state_next <= GREEN;
                    when GREEN =>
                        if (count_s >= 20) then
                            state_next <= YELLOW1;
                            count_s <= (others => '0');
                        else
                            state_next <= GREEN;
                            count_s <= count_s + 1;
                        end if;
                    when YELLOW1 =>
                        if (count_s >= 7) then
                            state_next <= RED;
                            count_s <= (others => '0');
                        else
                            state_next <= YELLOW1;
                            count_s <= count_s + 1;
                        end if;
                    when RED =>
                        if (count_s >= 40) then
                            state_next <= YELLOW2;
                            count_s <= (others => '0');
                        else
                            state_next <= RED;
                            count_s <= count_s + 1;
                        end if;
                    when others =>
                        if (count_s >= 7) then
                            state_next <= GREEN;
                            count_s <= (others => '0');
                        else
                            state_next <= YELLOW2;
                            count_s <= count_s + 1;
                        end if;
                end case;
            end if;
        end if;
    end process;

    state <= state_next;

    RGB_A <= "001" when state = GREEN else
             "010" when state = YELLOW1 or state = YELLOW2 else
             "100";
    RGB_B <= "100" when state = GREEN else
             "010" when state = YELLOW1 or state = YELLOW2 else
             "001";

end Behavioral;
