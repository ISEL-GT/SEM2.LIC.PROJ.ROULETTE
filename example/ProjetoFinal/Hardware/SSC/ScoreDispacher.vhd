LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity ScoreDispacher is
	port(
		Dval : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		Din : in std_logic_vector(6 downto 0);
		WrD : out std_logic;
		Dout : out std_logic_vector(6 downto 0);
		done : out std_logic
);
end ScoreDispacher;
architecture structural of ScoreDispacher is
	component ScoreDispacherControl is
		port(
			clk : in std_logic;
			reset : in std_logic;
			Dval : in std_logic;
			WrD : out std_logic;
			done : out std_logic
);
end component;
begin
SD: ScoreDispacherControl port map (Dval => Dval, done => done, WrD => WrD, reset => reset, clk => clk);
Dout <= Din; 
end structural;
		