LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity OutputRegister is
	port(
		D : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		reset : in std_logic;
		Q : out std_logic_vector(3 downto 0)
);		
end OutputRegister;
architecture structural of OutputRegister is
component Registo_KeyScan
	port(
		CLK : in std_logic;
		CE : in std_logic;
		RST : in std_logic;
		D : in std_logic_vector(3 downto 0);
		Q : out std_logic_vector(3 downto 0)
);
end component;	

begin

Registo: Registo_KeyScan port map(D=>D, CE=> '1', CLK=>clk, RST=>reset, Q=>Q);

end structural;