library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--
-- Display_Number_Top:
-- Display a counter on the 7-segment display that counts from 0x0 to 0xF
-- then loops around. The counter should update at a frequency of exactly 1 Hz.
-- The display increments once per second.
--
entity Display_Number_Top is
	port (
		clock_top : in STD_LOGIC;            -- input clock signal at 100 MHz
		seg : out STD_LOGIC_VECTOR(0 to 6);  -- 7 segment output
		an : out STD_LOGIC_VECTOR (0 to 3)   -- digit position for display
	);
end Display_Number_Top;

architecture Behavioral of Display_Number_Top is

	component Clock_One_Hz
		port (
			clock_in : in STD_LOGIC;
			clock_out : out STD_LOGIC		
		);
	end component;

	component Number_Generator
		port (
			clock : in STD_LOGIC;
			number: out STD_LOGIC_VECTOR (0 to 6)   
		);	
	end component;	

	signal clock_one : STD_LOGIC;

begin

	CO : Clock_One_Hz
		port map (
			clock_in => clock_top,
			clock_out => clock_one
		);

	NG : Number_Generator
		port map (
			clock => clock_one,
			number => seg
		);

	an <= "0111"; -- only assert the rightmost first digit

end Behavioral;
