library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- 
-- Counter:
-- Given a clock signal at 781250 Hz (1.28e-6 s), return a clock signal at exactly 1 Hz. 
--
-- With a period of 1.28e-6 s, it takes exactly 390625 complete cycles for 0.5 s to elapse. 
-- Hence, if we alternate the output clock signal after every 390625 complete cycles, the 
-- resulting period of the output signal is 1 s. This is equivalent to a frequency of 1 Hz.
--
entity Counter is
	port (
		clk : in STD_LOGIC;    -- input signal at 781250 Hz
		q_out : out STD_LOGIC  -- output signal at 1 Hz
	);
end Counter;

architecture Behavioral of Counter is

	constant zero : STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
	constant maximum : STD_LOGIC_VECTOR(18 downto 0) := "1011111010111100001"; -- 390625
	signal count : STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
	signal q : STD_LOGIC := '0';

begin

	process (clk)
	begin
		if rising_edge(clk) then
			count <= count + 1;
			if count = maximum then
				count <= zero;
				q <= not q;
			end if;
		end if;
	end process;

	q_out <= q;

end Behavioral;