LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ParityCheck is
	port(
		data : in std_logic;
		Sclk : in std_logic;
		init : in std_logic;
		err : out std_logic
);
end ParityCheck;
architecture structural of ParityCheck is

component Counter is
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

signal SaidaB : std_logic_vector(3 downto 0);

begin

CounterUp : Counter port map (PL => '0', CE => data, CLK => Sclk, Data_in => "0000", Q => SaidaB, RESET => init);
err <= SaidaB(0);

end structural;