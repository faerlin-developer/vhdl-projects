library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 
-- Debounces the provided input signal
--
entity Debouncer is
	port (
		clk : in STD_LOGIC;
		sg_in : in STD_LOGIC;
		sg_out : out STD_LOGIC
	);
end Debouncer;

architecture Behavioral of Debouncer is

	signal d1, d2, d3 : STD_LOGIC := '0';

begin
	process (clk)
	begin
		if rising_edge(clk) then
			d1 <= sg_in;
			d2 <= d1;
			d3 <= d2;
		end if;
	end process;

	sg_out <= d1 and d2 and d3;
end Behavioral;