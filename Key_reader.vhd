LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Key_reader is 
	port (
		Kack  	: in std_logic;
		Liness 	: in std_logic_vector(3 downto 0);
		CLK		: in std_logic;
		Reset		: in std_logic;
		
		Colss  	: out std_logic_vector(3 downto 0);
		Kout  	: out std_logic_vector(3 downto 0);
		Kval  	: out std_logic 
	);
end Key_reader;

architecture structural of Key_reader is

	component key_decode is 
		port (
			Kack  	: in std_logic;
			Liness	: in std_logic_vector(3 downto 0);
			CLK		: in std_logic;
			Reset 	: in std_logic;
			
			Colss 	: out std_logic_vector(3 downto 0);
			Kout  	: out std_logic_vector(3 downto 0);
			Kval  	: out std_logic 
		);
	end component;
	
	-- Sinais internos
	signal sig_kpress : std_logic;
	signal sig_k3		: std_logic_vector(3 downto 0);
	signal sig_cols 	: std_logic_vector(3 downto 0);
	signal sig_kval 	: std_logic;
	
	begin
	
	keydecode: key_decode port map (
		Kack   => Kack,
		Liness => Liness,
		CLK    => CLK,
		Reset  => Reset,
		Colss  => sig_cols,
		Kout   => sig_k3,
		Kval   => sig_kval
	);
	
	Kval  <= sig_kval;
	Kout  <= sig_k3;
	Colss <= sig_cols;
	
end structural;
