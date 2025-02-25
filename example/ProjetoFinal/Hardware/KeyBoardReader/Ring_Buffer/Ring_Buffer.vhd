LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity Ring_Buffer is
	port(
		Mclk: in std_logic;
		reset : in std_logic;
		D: in std_logic_vector(3 downto 0);
		DAV : in std_logic;
		CTS: in std_logic;
		Wreg: out std_logic;
		DAC: out std_logic;
		Q : out std_logic_vector(3 downto 0)
);		
end Ring_Buffer;
architecture structural of Ring_Buffer is
	component Ring_Buffer_control is
		port(
			DAV:in std_logic;
			CTS:in std_logic;
			full:in std_logic;
			Mclk:in std_logic;
			reset:in std_logic;
			empty:in std_logic;
			Wreg:out std_logic;
			wr:out std_logic;
			incPut:out std_logic;
			incGet:out std_logic;
			selPG:out std_logic;
			DAC:out std_logic
);
end component;
	component MAC is
		port(
			putget: in std_logic;
			incPut: in std_logic;
			clk: in std_logic;
			reset: in std_logic;
			incGet: in std_logic; 
			A : out std_logic_vector (2 downto 0);
			full: out std_logic;
			empty: out std_logic
);
end component;
	component RAM is
		port (
			WR: in STD_LOGIC;
			ADDRESS : in STD_LOGIC_VECTOR(2 downto 0);
			din : in STD_LOGIC_VECTOR(3 downto 0);
			dout : out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

signal Wr_exit : std_logic;
signal SelPG_exit : std_logic;
signal IncPut_entry : std_logic;
signal Incget_entry : std_logic;
signal full_exit : std_logic;
signal empty_exit : std_logic;
signal A_entry : std_logic_vector(2 downto 0);

begin

RBC : Ring_Buffer_control port map (DAV => DAV, CTS => CTS, full => full_exit ,Mclk => Mclk,reset => reset , empty => empty_exit, Wreg => Wreg, wr => Wr_exit, incPut => IncPut_entry , incGet => Incget_entry, selPG => SelPG_exit, DAC => DAC );
MemoryAC : MAC port map (putget => SelPG_exit, incPut => IncPut_entry,clk => Mclk,reset => reset, incGet => Incget_entry, A => A_entry, full => full_exit, empty => empty_exit );
RandomAC : RAM port map (WR => Wr_exit,ADDRESS => A_entry,din => D,dout => Q);
 
end structural;