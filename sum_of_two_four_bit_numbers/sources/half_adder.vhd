library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
	port (
		i1 : in STD_LOGIC;    -- single bit operand
		i2 : in STD_LOGIC;    -- single bit operand
		sum : out STD_LOGIC;  -- sum bit of i1 + i2
		carry : out STD_LOGIC -- carry bit of i1 + i2
	);
end Half_Adder;

architecture Behavioral of Half_Adder is
begin
	sum <= i1 xor i2;
	carry <= i1 and i2;
end Behavioral;