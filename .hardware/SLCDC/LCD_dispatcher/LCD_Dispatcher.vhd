LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity LCD_Dispatcher is
	port (
		Dval : in std_logic;
		Din  : in std_logic_vector(4 downto 0);
		
		Wrl  : out std_logic;
		Dout : out std_logic_vector(4 downto 0);
		done : out std_logic
	);
end LCD_Dispatcher;

architecture behavioral of LCD_Dispatcher is
begin
	Dout <= Din;
	
	Wrl  <= '1' when Dval = '1' else '0';
	done <= '1' when Dval = '1' else '0';
end behavioral;
