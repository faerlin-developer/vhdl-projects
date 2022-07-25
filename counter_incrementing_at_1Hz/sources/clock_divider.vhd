library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

--
-- Clock_Divider:
-- Given an incoming clock signal at 100 MHz, return a clock signal at exactly 781250 Hz. 
-- This is achieved by dividing a 100 MHz by half seven times. 
-- That is, 100 MHz / 2^{7} = 781250 Hz. 
-- 
entity Clock_Divider is
	port (
		hw_clk : in STD_LOGIC;
		sw_clk : out STD_LOGIC
	);
end Clock_Divider;

architecture Behavioral of Clock_Divider is

	signal q : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');

begin

	process (hw_clk)
	begin
		if rising_edge(hw_clk) then
			q <= q + 1;
		end if;
	end process;

	sw_clk <= q(6);

end Behavioral;