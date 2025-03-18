LIBRARY ieee; 
USE ieee.std_logic_1164.all;

entity Key_decode is 
	port (
		Kack : 	in std_logic;
		Liness: 	in std_logic_vector(3 downto 0);
		CLK:		in std_logic;
		Reset:	in std_logic;
		
		Colss : 	out std_logic_vector(3 downto 0);
		Kout : 	out std_logic_vector(3 downto 0);
		Kval : 	out std_logic 
	);
end Key_decode;

architecture structural of Key_decode is

	component key_scanner is 
	    port (
			KScan : in std_logic_vector(1 downto 0);
			lines : in std_logic_vector(3 downto 0);
			CLK 	: in std_logic;
			Reset : in std_logic;
		
			columns : out std_logic_vector(3 downto 0);
			KPress  : out std_logic; 
			K 		  : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component KeyControl is
		port (
		   reset		: in std_logic;
			clk		: in std_logic;
			Kpress	: in std_logic;
			Kack		: in std_logic;
			
			KScan		: out std_logic_vector(1 downto 0);
			Kval		: out std_logic
		);
	end component;
	
	
	signal sig_kpress : std_logic;
	signal sig_k3		: std_logic_vector(3 downto 0);
	signal sig_kscan 	: std_logic_vector(1 downto 0);
	signal sig_cols 	: std_logic_vector(3 downto 0);
	signal sig_kval 	: std_logic;
	
	
	
	begin
	
	keyscan: key_scanner port map (
		KScan 	=> sig_kscan,
		lines 	=> Liness,
		CLK 		=>	CLK,
		Reset 	=>	Reset,
		columns 	=> sig_cols,
		KPress 	=> sig_kpress,
		K 			=> sig_k3
	);
	
	keycontrols: KeyControl port map (
		reset 	=> Reset,
		clk 		=> CLK,
		Kpress 	=> sig_kpress,
		Kack 		=> Kack,
		KScan 	=> sig_kscan,
		Kval 		=> sig_kval
	);
	
	
	Kval 	<= sig_kval;
	Kout 	<= sig_k3;
	Colss <= sig_cols;
	
end structural;
	
	
	
	
	
	
	
	
	
	
	
	
	