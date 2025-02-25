LIBRARY ieee;
Use ieee.std_logic_1164.all;

Entity Registo_KeyScan is
port(
	CLK : in std_logic;
	CE : in std_logic;
	RST : in std_logic;
	D : in std_logic_vector(3 downto 0);
	Q : out std_logic_vector(3 downto 0)
	);
end Registo_KeyScan;	
ARCHITECTURE arch_Registo of Registo_KeyScan is 
component FFD is	
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

FF1 : FFD port map ( SET => '0', CLK => CLK, EN => CE, D => D(0), Q =>Q(0), RESET => RST);

FF2 : FFD port map ( SET => '0', CLK => CLK, EN => CE, D => D(1), Q =>Q(1), RESET => RST);

FF3 : FFD port map ( SET => '0', CLK => CLK, EN => CE, D => D(2), Q =>Q(2), RESET => RST);

FF4 : FFD port map ( SET => '0', CLK => CLK, EN => CE, D => D(3), Q =>Q(3), RESET => RST);

end arch_registo;