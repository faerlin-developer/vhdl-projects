----------------------------------------------------------------------------------
-- Author: Faerlin Pulido
-- Description: Assignment 5
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--
-- Decodes the input vector to a format suitable to the 7-segment display.
--
entity Display_Decoder is
	port (
		clk : in STD_LOGIC;
		number : in STD_LOGIC_VECTOR (3 downto 0);
		decoded : out STD_LOGIC_VECTOR (0 to 6)
	);	
end Display_Decoder;

architecture Behavioral of Display_Decoder is

begin
	process(clk)
	begin
		if rising_edge(clk) then
			case number is
				when "0000" => decoded <= "0000001";
				when "0001" => decoded <= "1001111";
				when "0010" => decoded <= "0010010";
				when "0011" => decoded <= "0000110";
				when "0100" => decoded <= "1001100";
				when "0101" => decoded <= "0100100";
				when "0110" => decoded <= "0100000";
				when "0111" => decoded <= "0001111";
				when "1000" => decoded <= "0000000";
				when "1001" => decoded <= "0000100";
				when "1010" => decoded <= "0001000";
				when "1011" => decoded <= "1100000";
				when "1100" => decoded <= "0110001";
				when "1101" => decoded <= "1000010";
				when "1110" => decoded <= "0110000";
				when "1111" => decoded <= "0111000";
				when others => decoded <= "XXXXXXX";
			end case;
		end if;
	end process;
end Behavioral;
