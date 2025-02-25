LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity SSC is
	port(
		SS : in std_logic;
		Reset : in std_logic;
		SCLK : in std_logic;
		Clk : in std_logic;
		SDX : in std_logic;
		WrD : out std_logic;
		DoutSSC: out std_logic_vector(6 downto 0)
		);
end SSC;
architecture strucutural of SSC is
component SerialReceiverSSC is
	port(
		Reset : in std_logic;
		SDX : in std_logic;
		Clk : in std_logic;
		SCLK : in std_logic;
		SS : in std_logic;
		accept : in std_logic;
		D : out std_logic_vector(6 downto 0);
		DXval : out std_logic
);		
end component;
component ScoreDispacher is
	port(
		Dval : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		Din : in std_logic_vector(6 downto 0);
		WrD : out std_logic;
		Dout : out std_logic_vector(6 downto 0);
		done : out std_logic
);		
end component;

signal DXVal_exit : std_logic;
signal D_exit : std_logic_vector(6 downto 0);
signal done_exit : std_logic;

begin

SD: ScoreDispacher port map (Dval => DXVal_exit, Din => D_exit , done => done_exit, WrD => WrD, Dout => DoutSSC, reset => Reset, clk => Clk);

SR : SerialReceiverSSC port map (Reset => Reset, SDX => SDX, Clk => Clk, SCLK => SCLK, SS => SS, accept => done_exit, D => D_exit, DXval => DXVal_exit);

end strucutural;