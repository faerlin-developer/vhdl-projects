----------------------------------------------------------------------------------
-- Author: Faerlin Pulido
-- Description: Assignment 5
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--
-- Stores the state of the last button pressed.
--
-- The states stored have the following semantics:
-- "001": btnL or btnD was the last button pressed
-- "010": btnR was the last button pressed
-- "100": btnC was the last button pressed
-- 
entity Last_Button_Pressed is
	port (
		clk : in STD_LOGIC;
		btnL : in STD_LOGIC;
		btnR : in STD_LOGIC;
		btnC : in STD_LOGIC;
		btnD : in STD_LOGIC;
		last_button_state : out STD_LOGIC_VECTOR (2 downto 0)
	);
end Last_Button_Pressed;

architecture Behavioral of Last_Button_Pressed is

begin
	process(clk)
	begin
		if rising_edge(clk) then

			if btnL = '1' or btnD = '1' then
				last_button_state <= "001";
			end if;

			if btnR = '1' then
				last_button_state <= "010";
			end if;

			if btnC = '1' then
				last_button_state <= "100";
			end if;

		end if;
	end process;

end Behavioral;
