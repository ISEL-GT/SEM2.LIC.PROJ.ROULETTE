LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity SLCDC is
	port(
		SS : in std_logic;
		Reset : in std_logic;
		SCLK : in std_logic;
		Clk : in std_logic;
		SDX : in std_logic;
		WrL : out std_logic;
		DoutSLCDC: out std_logic_vector(8 downto 0)
		);
end SLCDC;
architecture structural of SLCDC is
component SerialReceiver is
	port(
		Reset : in std_logic;
		SDX : in std_logic;
		Clk : in std_logic;
		SCLK : in std_logic;
		SS : in std_logic;
		accept : in std_logic;
		D : out std_logic_vector(8 downto 0);
		DXval : out std_logic
);		
end component;
component LCDDispatcher is
	port(
		Dval : in std_logic;
		Din : in std_logic_vector(8 downto 0);
		WrL : out std_logic;
		Dout : out std_logic_vector(8 downto 0);
		clk : in std_logic;
		reset : in std_logic;
		done : out std_logic
);		
end component;
signal done_exit : std_logic;
signal D_exit : std_logic_vector(8 downto 0);
signal DXval_exit : std_logic;

begin

LCD: LCDDispatcher port map (Dval => DXval_exit, Din => D_exit, Wrl => Wrl, Dout => DoutSLCDC, done => done_exit,clk => Clk, reset => Reset );
SR : SerialReceiver port map (Reset => Reset, SDX => SDX, Clk => Clk, SCLK => SCLK, SS => SS, accept => done_exit, D => D_exit, DXval => DXval_exit);

end structural; 		
		