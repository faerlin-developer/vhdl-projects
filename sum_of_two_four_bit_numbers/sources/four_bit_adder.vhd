library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--
-- Outputs the sum and carry of operands a and b
--
entity Four_Bit_Adder is
	port (
		a : in STD_LOGIC_VECTOR (3 downto 0);     -- 4 bit operand
		b : in STD_LOGIC_VECTOR (3 downto 0);     -- 4 bit operand
		sum : out STD_LOGIC_VECTOR (3 downto 0);  -- 4 bit sum of a+b
		carry : out STD_LOGIC                     -- carry bit of a+b
	);
end Four_Bit_Adder;

architecture Behavioral of Four_Bit_Adder is

	component Full_Adder 
		port (
			carry_in : in STD_LOGIC;
			x_in : in STD_LOGIC;
			y_in : in STD_LOGIC;
			sum_out : out STD_LOGIC;
			carry_out : out STD_LOGIC
		);
	end component; 

	signal carry1 : STD_LOGIC;
	signal carry2 : STD_LOGIC;
	signal carry3 : STD_LOGIC;

begin

	FA1 : Full_Adder
	port map (
		carry_in => '0',
		x_in => a(0),
		y_in => b(0),
		sum_out => sum(0),
		carry_out => carry1
	);

	FA2 : Full_Adder
	port map (
		carry_in => carry1,
		x_in => a(1),
		y_in => b(1),
		sum_out => sum(1),
		carry_out => carry2
	);

	FA3 : Full_Adder
	port map (
		carry_in => carry2,
		x_in => a(2),
		y_in => b(2),
		sum_out => sum(2),
		carry_out => carry3
	);

	FA4 : Full_Adder
	port map (
		carry_in => carry3,
		x_in => a(3),
		y_in => b(3),
		sum_out => sum(3),
		carry_out => carry
	);

end Behavioral;