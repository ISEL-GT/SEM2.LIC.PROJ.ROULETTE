LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity key_scanner is
	port(
		Kscan : in std_logic;
		Kpress : out std_logic;
		K : out std_logic_vector(3 downto 0);
		Lines : in std_logic_vector(3 downto 0);
		Cols : out std_logic_vector(3 downto 0);
		Osc : in std_logic;  
		Reset : in std_logic		
);
end key_scanner;

architecture structural of key_scanner is
component Counter is
	port
	(
	PL:in std_logic;
	CE:in std_logic;
	CLK:in std_logic;
	Data_in: in std_logic_vector(3 downto 0);
	RESET: in std_logic;
	TC: out std_logic;
	Q:out std_logic_vector(3 downto 0)
	);
end component;

component decoder_2x4 is
	port(
		Y : out std_logic_vector(3 downto 0);
		S0, S1 : in std_logic
);
end component;

component mux4x1 is
	port(
		A : in std_logic_vector(3 downto 0);
		S0, S1 : in std_logic;
		Y : out std_logic	
);
end component;

signal interm_Q : std_logic_vector(3 downto 0);
signal Col : std_logic_vector(2 downto 0);
signal Yn : std_logic;

begin
Somador : Counter port map (Data_in(0) => '0', Data_in(1) => '0', Data_in(2) => '0',Data_in(3) => '0',PL=>'0',Clk => Osc , CE => Kscan, Reset => Reset, Q(0) => interm_Q(0) , Q(1) => interm_Q(1) , Q(2) => interm_Q(2) , Q(3) => interm_Q(3));
Decoder : Decoder2x3 port map (Y(0) => Col(0), Y(1) =>  Col(1), Y(2) =>  Col(2),S0 => interm_Q(2), S1 => interm_Q(3) );
Mux : mux4x1 port map (A=> Lines, S0 => interm_Q(0), S1 => interm_Q(1), Y => Yn);
K(0) <= interm_Q(0);
K(1) <= interm_Q(1);
K(2) <= interm_Q(2);
K(3) <= interm_Q(3);
Cols <= not Col(2 downto 0);
Kpress <= not Yn;

end structural;