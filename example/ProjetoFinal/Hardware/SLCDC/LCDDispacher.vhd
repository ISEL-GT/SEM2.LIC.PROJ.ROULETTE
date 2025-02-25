LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity LCDDispatcher is
	port(
		Dval : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		Din : in std_logic_vector(8 downto 0);
		WrL : out std_logic;
		Dout : out std_logic_vector(8 downto 0);
		done : out std_logic
);		
end LCDDispatcher;
architecture structural of LCDDispatcher is
	component LCDDispacherControl is
		port(
			clk : in std_logic;
			reset : in std_logic;
			Dval : in std_logic;
			Wrl : out std_logic;
			done : out std_logic
);
end component;
begin

LCD: LCDDispacherControl port map (Dval => Dval, clk => clk , Wrl => Wrl, done => done , reset => reset);
Dout <= Din;
end structural;