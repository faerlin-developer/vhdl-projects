----------------------------------------------------------------------------------
-- Author: Faerlin Pulido
-- Description: Assignment 3, Part B
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--
-- Clock_One_Hz:
-- Given a clock signal at 100 MHz, return a clock signal at 1 Hz. 
--
entity Clock_One_Hz is
	port (
		clock_in : in STD_LOGIC;   -- input clock signal at 100 MHz
		clock_out : out STD_LOGIC  -- output clock signal at 1 Hz
	);
end Clock_One_Hz;

architecture Behavioral of Clock_One_Hz is

	component Clock_Divider
		port (
			hw_clk : in STD_LOGIC;
			sw_clk : out STD_LOGIC
		);
	end component;

	component Counter
		port (
			clk : in STD_LOGIC;
			q_out : out STD_LOGIC
		);
	end component;

	signal clk_divided : STD_LOGIC;

begin

	CD : Clock_Divider
		port map (
			hw_clk => clock_in,
			sw_clk => clk_divided 
		);
	
	CT : Counter
		port map (
			clk => clk_divided,
			q_out => clock_out
		);
	
end Behavioral;
