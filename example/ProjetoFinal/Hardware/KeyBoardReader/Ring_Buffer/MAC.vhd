LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity MAC is
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
end MAC;
architecture structural of MAC is
component Mux2_1 is
	port(
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		PL:in std_logic;
		D: out std_logic_vector(3 downto 0)
);
end component;
component Counter is
	port(
		PL:in std_logic;
		CE:in std_logic;
		CLK	:in std_logic;
		Data_in: in std_logic_vector(3 downto 0);
		RESET: in std_logic;
		TC: out std_logic;
		Q:out std_logic_vector(3 downto 0)
);
end component;
component counter_Inc_Dec is
	port(
		PL:in std_logic;
		CE:in std_logic;
		CLK:in std_logic;
		Data_in: in std_logic_vector(3 downto 0);
		RESET: in std_logic;
		TC: out std_logic;
		Q:out std_logic_vector(3 downto 0)
);
end component;
signal CounterPUT_exit : std_logic_vector(3 downto 0);
signal CounterGET_exit : std_logic_vector(3 downto 0);
signal PutGet_signal : std_logic;
signal Q_ContadorINC_DEC_exit : std_logic_vector(3 downto 0);
signal CE_ContadorINC_DEC : std_logic;
signal nothing : std_logic;

begin

ContadorPUT : Counter port map (PL => '0' ,CE => incPut ,CLK => clk ,RESET => reset ,Data_in => "0000",Q => CounterPUT_exit);
ContadorGET : Counter port map (PL => '0' ,CE => incGet ,CLK => clk ,RESET => reset ,Data_in => "0000",Q => CounterGET_exit);
ContadorINC_DEC : counter_Inc_Dec port map (PL => incPut ,CE => CE_ContadorINC_DEC ,CLK => clk ,RESET => reset ,Data_in => "0000",Q => Q_ContadorINC_DEC_exit);
Mux : Mux2_1 port map (B => CounterPUT_exit, A => CounterGET_exit, PL => PutGet_signal, D(0) => A(0),D(1) => A(1), D(2) => A(2), D(3) => nothing);
PutGet_signal <= putget;
CE_ContadorINC_DEC <= incPut or incGet;
full <= Q_ContadorINC_DEC_exit(3) ;
empty <= (not Q_ContadorINC_DEC_exit(0) and not Q_ContadorINC_DEC_exit(1) and not Q_ContadorINC_DEC_exit(2) and not Q_ContadorINC_DEC_exit(3));

end structural;

