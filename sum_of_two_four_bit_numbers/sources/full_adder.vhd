library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
	port (
		carry_in : in STD_LOGIC;    -- carry bit input
		x_in : in STD_LOGIC;        -- single bit operand 
		y_in : in STD_LOGIC;        -- single bit operand
		sum_out : out STD_LOGIC;    -- sum bit of x_in + y_in + carry_in
		carry_out : out STD_LOGIC   -- carry bit of x_in + y_in + carry_in
	);
end Full_Adder;

architecture Behavioral of Full_Adder is

	component Half_Adder 
		port (
			i1 : in STD_LOGIC;
			i2 : in STD_LOGIC;
			sum : out STD_LOGIC;
			carry : out STD_LOGIC
		);
	end component; 

	signal sum1 : STD_LOGIC;    -- sum bit from first half adder
	signal carry1 : STD_LOGIC;  -- carry bit from first half adder 
	signal sum2 : STD_LOGIC;    -- sum bit from second half adder
	signal carry2 : STD_LOGIC;  -- carry bit from second half adder

begin

	HA1 : Half_Adder
		port map (
			i1 => x_in,
			i2 => y_in,
			sum => sum1,
			carry => carry1
		);
	
	HA2 : Half_Adder
		port map (
			i1 => sum1,
			i2 => carry_in,
			sum => sum2,
			carry => carry2
		);
	
	sum_out <= sum2;
	carry_out <= carry1 or carry2;

end Behavioral;
