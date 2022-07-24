----------------------------------------------------------------------------------
-- Author: Faerlin Pulido
-- Description: Assignment 5
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--
-- Represents a number with four-bits and a carry.
--
-- When load is high, store the input_number and input_carry to this register.
-- When clear is high, set the input_number and input_carry to zero.
-- Outputs the stored number and carry.
--
entity Four_Bit_Register_With_Carry is
	port (
		clk : in STD_LOGIC;
		load : in STD_LOGIC;
		clear : in STD_LOGIC;  
		input_number : in STD_LOGIC_VECTOR (3 downto 0);
		input_carry : in STD_LOGIC;
		output_number : out STD_LOGIC_VECTOR (3 downto 0);
		output_carry : out STD_LOGIC
	);
end Four_Bit_Register_With_Carry;

architecture Behavioral of Four_Bit_Register_With_Carry is

begin
	process(clk)
	begin
		if rising_edge(clk) then
			if clear = '1' then
				output_number <= "0000";
				output_carry <= '0';
			elsif load = '1' then
				output_number <= input_number;
				output_carry <= input_carry;
			end if;
		end if;
	end process;
end Behavioral;
