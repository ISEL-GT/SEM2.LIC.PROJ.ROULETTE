LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity Counter is
	port(
	PL:in std_logic;
	CE:in std_logic;
	CLK:in std_logic;
	Data_in: in std_logic_vector(3 downto 0);
	RESET: in std_logic;
	TC: out std_logic;
	Q:out std_logic_vector(3 downto 0)
	);
end Counter;
architecture structural of Counter is
component Mux2_1 is
port
( 
A: in std_logic_vector(3 downto 0);
B: in std_logic_vector(3 downto 0);
PL:in std_logic;
D: out std_logic_vector(3 downto 0)
);
end component;
component Registo_KeyScan is
port
(
D:in std_logic_vector(3 downto 0);
CE: in std_logic;
CLK:in std_logic;
RST:in std_logic;
Q:out std_logic_vector(3 downto 0)
);
end component;
component ADDER is
port
(
A : in std_logic_vector(3 downto 0);
B : in std_logic_vector(3 downto 0);
Ci : in std_logic;
S : out std_logic_vector(3 downto 0);
Co : out std_logic
);
end component;

signal saidaMux: std_logic_vector(3 downto 0);
signal saidaReg: std_logic_vector(3 downto 0);
signal saidaSomador :std_logic_vector(3 downto 0);

begin
U1: Mux2_1 port map (A=>saidaSomador,B=>Data_in,PL=>PL,D=>saidaMux);
U2: Registo_KeyScan port map (CE=>CE, CLK=>CLK, D=>saidaMux, Q=>saidaReg,RST=>RESET);
U3: ADDER port map(A=>saidaReg, B(0)=>'1',B(1)=>'0',B(2)=>'0',B(3)=>'0', 
S=>saidaSomador,Ci=>'0');
TC<=not Data_in(0) and not Data_in(1) and not Data_in(2) and not Data_in(3);
Q<=saidaReg;
end structural;