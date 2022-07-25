library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--
-- Outputs one of the input vectors and carry base on the provided state.
--
-- The input vector propagated as the output is dependent on the following state:
-- "001": outputs left_register and a carry of 0
-- "010": outputs right_register and a carry of 0
-- "100": outputs sum_register and sum_carry
-- 
entity Register_Selector is
	port (
		clk : in STD_LOGIC;
		state : in STD_LOGIC_VECTOR(2 downto 0);
		left_register : in STD_LOGIC_VECTOR (3 downto 0);
		right_register : in STD_LOGIC_VECTOR (3 downto 0);
		sum_register : in STD_LOGIC_VECTOR (3 downto 0);
		sum_carry : in STD_LOGIC;
		selected_register : out STD_LOGIC_VECTOR (3 downto 0);
		selected_carry : out STD_LOGIC
	);
end Register_Selector;

architecture Behavioral of Register_Selector is

begin
	process(clk)
	begin
		if rising_edge(clk) then
			if state = "001" then
				selected_register <= left_register;
				selected_carry <= '0';
			end if;

			if state = "010" then
				selected_register <= right_register;
				selected_carry <= '0';
			end if;

			if state = "100" then
				selected_register <= sum_register;
				selected_carry <= sum_carry;
			end if;
		end if;
	end process;

end Behavioral;
