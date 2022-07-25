library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

--
-- Number_Generator:
-- Generate a number that updates at a frequency of exactly 1 Hz (increments per second). 
-- It counts from 0x0 to 0xF and then loops around. The output number is in a format 
-- expected by the 7 segment display unit.
--
entity Number_Generator is
	port (
		clock : in STD_LOGIC;                  -- input clock signal at 1 Hz
		number: out STD_LOGIC_VECTOR (0 to 6)  -- output number that increments at 1 Hz
	);	
end Number_Generator;

architecture Behavioral of Number_Generator is

	signal n : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin
	process(clock)
	begin

		if rising_edge(clock) then
			case n is
				when "0000" => number <= "0000001";
				when "0001" => number <= "1001111";
				when "0010" => number <= "0010010";
				when "0011" => number <= "0000110";
				when "0100" => number <= "1001100";
				when "0101" => number <= "0100100";
				when "0110" => number <= "0100000";
				when "0111" => number <= "0001111";
				when "1000" => number <= "0000000";
				when "1001" => number <= "0000100";
				when "1010" => number <= "0001000";
				when "1011" => number <= "1100000";
				when "1100" => number <= "0110001";
				when "1101" => number <= "1000010";
				when "1110" => number <= "0110000";
				when "1111" => number <= "0111000";
				when others => number <= "XXXXXXX";
			end case;

			n <= n + 1;
		end if;

	end process;
end Behavioral;