LIBRARY ieee; 
USE ieee.std_logic_1164.all;


-- This is the top-level entity responsible for running the actual program
entity roulette is

	port (
		Liness: 	in std_logic_vector(3 downto 0);
		CLK   :	in std_logic;
		Reset :	in std_logic;
		
		
		RegisterSelector 	: 	out std_logic;
		Enable				: 	out std_logic;			
		D						: 	out std_logic_vector(3 downto 0);
		Colss 				: 	out std_logic_vector(3 downto 0);
		Kout  				: 	out std_logic_vector(3 downto 0);
		Kval					: 	out std_logic 
	);
end roulette;

architecture structural of roulette is

	component Key_decode is 
	    port (
			Kack 	: 	in std_logic;
			Liness: 	in std_logic_vector(3 downto 0);
			CLK	:	in std_logic;
			Reset	:	in std_logic;
			
			Colss : 	out std_logic_vector(3 downto 0);
			Kout 	: 	out std_logic_vector(3 downto 0);
			Kval	: 	out std_logic 
		);
	end component;
	
	component UsbPort is 
	    port (
			inputPort	:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			outputPort 	:  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component;
	
	component Lcd is 
	    port (		
			RegisterSelector 	: 	out std_logic;
			Enable				: 	out std_logic;
			D 						: 	out std_logic_vector(3 downto 0) 
		);
	end component;
	
	
	signal sig_k3_0	: std_logic_vector(3 downto 0);
	signal sig_kscan 	: std_logic_vector(1 downto 0);
	signal sig_cols 	: std_logic_vector(3 downto 0);
	signal sig_kval 	: std_logic;
	
	signal sig_d7_4	: std_logic_vector(3 downto 0);
	signal sig_enable	: std_logic;
	signal sig_rs		: std_logic;
	
	signal sig_kack_outusbport : std_logic;
	
	
	begin
	
	keydecode: 	Key_decode port map (
		Kack	 	=> sig_kack_outusbport,
		Liness 	=> Liness,
		CLK 		=>	CLK,
		Reset 	=>	Reset,
		Colss 	=> sig_cols,
		Kout		=> sig_k3_0,
		Kval 		=> sig_kval
	);
	
	usbPortVHD: 		UsbPort port map (
		inputPort(0) 	=> sig_kval,
		inputPort(1)	=> sig_k3_0(0),
		inputPort(2)	=> sig_k3_0(1),
		inputPort(3)	=> sig_k3_0(2),
		inputPort(4)	=> sig_k3_0(3),
		
		outputPort(0) 	=> sig_kack_outusbport,
		outputPort(1) 	=> sig_d7_4(0), 
		outputPort(2) 	=> sig_d7_4(1), 
		outputPort(3) 	=> sig_d7_4(2), 
		outputPort(4) 	=> sig_d7_4(3), 
		
		outputPort(6) 	=> sig_rs, 
		outputPort(7) 	=> sig_enable
	);
	
	inst_lcd: Lcd port map(
		RegisterSelector 	=> sig_rs,
		Enable				=> sig_enable,
		D 						=> sig_d7_4
	);
	
	RegisterSelector 	<= sig_rs;
	Enable				<= sig_enable;
	D 						<= sig_d7_4;
	
	Kval	<= sig_kval;
	Kout 	<= sig_k3_0;
	Colss <= sig_cols;
	
end structural;