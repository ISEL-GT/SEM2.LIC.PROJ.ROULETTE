LIBRARY ieee; 
USE ieee.std_logic_1164.all;

entity SLCDC is

	port (
		Liness	: 	in std_logic_vector(3 downto 0);
		CLK   	:	in std_logic;
		Reset 	:	in std_logic;		
		
		LCD_RS	: 	out std_logic;
		LCD_EN	: 	out std_logic;			
		LCD_DATA	: 	out std_logic_vector(7 downto 4);
		
		Colss 	: 	out std_logic_vector(3 downto 0);
		Kout  	: 	out std_logic_vector(3 downto 0);
		Kval		: 	out std_logic 
	);
end SLCDC;