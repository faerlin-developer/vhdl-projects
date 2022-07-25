library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--
-- Reads two 4-bit numbers into memory and displays the sum. 
-- 
-- The user begins by setting the first number using the SW0-SW3 switches and
-- then pressing the BTNL button. After BTNL is pressed, the number is stored
-- in memory and displayed on the 7-segment display. The user repeats the same 
-- step to enter the second number by pressing the BTNR button. The user can then
-- press the BTNC button to display the sum on the 7-segment display. Pressing
-- the BTND will clear all numbers (set to zero) and allow the user to begin again.
--
entity Top is
	port (
		clock : STD_LOGIC;                         -- clock signal (100 MHz)
		switch : in STD_LOGIC_VECTOR (3 downto 0); -- used to enter four bit number
		btnL, btnR, btnC, btnD : in STD_LOGIC; 	   -- four buttons		  
		seg : out STD_LOGIC_VECTOR (0 to 6);       -- 7-segment display output
		dp : out STD_LOGIC;                        -- decimal point for 7-segment display 
		an : out STD_LOGIC_VECTOR (0 to 3)         -- digit position for 7-segment display 
	);
end Top;

architecture Behavioral of Top is

	-- Debounces the buttons btnL, btnR, btnC and btnD
	component Debouncer
		port (
			clk : in STD_LOGIC;
			sg_in : in STD_LOGIC;
			sg_out : out STD_LOGIC
		);
	end component;

	-- Three instances of this component represents two operands and their sum
	component Four_Bit_Register_With_Carry
		port (
			clk : in STD_LOGIC;
			load : in STD_LOGIC;  
			clear : in STD_LOGIC;
			input_number : in STD_LOGIC_VECTOR (3 downto 0);
			input_carry : in STD_LOGIC;
			output_number : out STD_LOGIC_VECTOR (3 downto 0);
			output_carry : out STD_LOGIC
		);
	end component;

	-- Adds two four-bit numbers
	component Four_Bit_Adder
		port (
			a : in STD_LOGIC_VECTOR (3 downto 0);     
			b : in STD_LOGIC_VECTOR (3 downto 0);     
			sum : out STD_LOGIC_VECTOR (3 downto 0);  
			carry : out STD_LOGIC                    
		);
	end component;

	-- Decodes a number to a format suitable for the 7-segment display
	component Display_Decoder
		port (
			clk : in STD_LOGIC;
			number : in STD_LOGIC_VECTOR (3 downto 0);
			decoded : out STD_LOGIC_VECTOR (0 to 6)
		);	
	end component;

	-- Outputs the most recent pressed button
	component Last_Button_Pressed
		port (
			clk : in STD_LOGIC;
			btnL : in STD_LOGIC;
			btnR : in STD_LOGIC;
			btnC : in STD_LOGIC;
			btnD : in STD_LOGIC;
			last_button_state : out STD_LOGIC_VECTOR (2 downto 0)
		);
	end component;

	-- Outputs one of the three input vectors base on the provided state
	component Register_Selector
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
	end component;

	-- Debounced buttons
	signal debounced_btnL : STD_LOGIC;
	signal debounced_btnR : STD_LOGIC;
	signal debounced_btnC : STD_LOGIC;
	signal debounced_btnD : STD_LOGIC;

	-- Two operands entered by pressing btnL and btnR
	signal left_number : STD_LOGIC_VECTOR (3 downto 0);
	signal right_number : STD_LOGIC_VECTOR (3 downto 0);

	-- Sum of two operands
	signal sum_number : STD_LOGIC_VECTOR (3 downto 0);
	signal sum_carry : STD_LOGIC;

	-- intermediate signals for the sum and carry
	signal computed_sum : STD_LOGIC_VECTOR (3 downto 0);
	signal computed_carry : STD_LOGIC;

	-- State representing the most recent pressed button
	signal last_button_state : STD_LOGIC_VECTOR (2 downto 0);

	-- One of the two operands or the sum base on the most recent pressed button
	signal selected_number : STD_LOGIC_VECTOR (3 downto 0);
	signal selected_carry : STD_LOGIC;

begin

	DEBOUNCE_LEFT_BTN : Debouncer
		port map(clk => clock, sg_in => btnL, sg_out => debounced_btnL);

	DEBOUNCE_RIGHT_BTN : Debouncer
		port map(clk => clock, sg_in => btnR, sg_out => debounced_btnR);

	DEBOUNCE_CENTRE_BTN : Debouncer
		port map(clk => clock, sg_in => btnC, sg_out => debounced_btnC);
	
	DEBOUNCE_DOWN_BTN : Debouncer
		port map(clk => clock, sg_in => btnD, sg_out => debounced_btnD);

	-- Store the switch vector to this register by pressing btnL
	-- or set this register to the zero vector by pressing btnD
	LEFT_REG : Four_Bit_Register_With_Carry
		port map (
			clk => clock,
			load => debounced_btnL,
			clear => debounced_btnD,
			input_number => switch,
			input_carry => '0',
			output_number => left_number
		);

	-- Store the switch vector to this register by pressing btnR
	-- or set this register to the zero vector by pressing btnD
	RIGHT_REG : Four_Bit_Register_With_Carry
		port map (
			clk => clock,
			load => debounced_btnR,
			clear => debounced_btnD,
			input_number => switch,
			input_carry => '0',
			output_number => right_number
		);

	-- Adds the two operands
	ADDER : Four_Bit_Adder
		port map (
			a => left_number,
			b => right_number,
			sum => computed_sum,
			carry => computed_carry
		);

	-- Store the computed sum to this register
	SUM_REG : Four_Bit_Register_With_Carry
		port map (
			clk => clock,
			load => '1',
			clear => '0',
			input_number => computed_sum,
			input_carry => computed_carry,
			output_number => sum_number,
			output_carry => sum_carry
		);

	-- Remembers the state of the last button pressed
	LAST_BUTTON : Last_Button_Pressed
		port map (
			clk => clock,
			btnL => debounced_btnL,
			btnR => debounced_btnR,
			btnC => debounced_btnC,
			btnD => debounced_btnD,
			last_button_state => last_button_state
		);

	-- Outputs one of the three registers base on the provided state
	REG_SELECTOR : Register_Selector
		port map (
			clk => clock,
			state => last_button_state,
			left_register => left_number,
			right_register => right_number,
			sum_register => sum_number,
			sum_carry => sum_carry,
			selected_register => selected_number,
			selected_carry => selected_carry 
		);

	-- Decodes the input vector to a format suitable for the 7-segment display
	DECODER : Display_Decoder
		port map (clk => clock, number => selected_number, decoded => seg);
	
	an <= "0111";     		   -- only assert the rightmost digit
	dp <= not selected_carry;  -- invert selected_carry to display decimal point

end Behavioral;
