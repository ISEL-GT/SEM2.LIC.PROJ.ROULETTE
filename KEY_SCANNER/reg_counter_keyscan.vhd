LIBRARY ieee;
Use ieee.std_logic_1164.all;

Entity reg_counter_keyscan is
port(
	CLK : in std_logic;
	CE : in std_logic;
	RST : in std_logic;
	D : in std_logic_vector(3 downto 0);
	Q : out std_logic_vector(3 downto 0)
	);
end reg_counter_keyscan;	

ARCHITECTURE structural of reg_counter_keyscan is 

component ffd is	
port(
	CLK : in std_logic;
	RESET : in std_logic;
	SET : in std_logic;
	EN : in std_logic;
	D : in std_logic;
	Q : out std_logic
	);
end component;

begin

FF1 : ffd port map ( SET => '0', CLK => CLK, EN => CE, D => D(0), Q =>Q(0), RESET => RST);

FF2 : ffd port map ( SET => '0', CLK => CLK, EN => CE, D => D(1), Q =>Q(1), RESET => RST);

FF3 : ffd port map ( SET => '0', CLK => CLK, EN => CE, D => D(2), Q =>Q(2), RESET => RST);

FF4 : ffd port map ( SET => '0', CLK => CLK, EN => CE, D => D(3), Q =>Q(3), RESET => RST);

end structural;