library ieee;
use ieee.std_logic_1164.all;

-- This entity defines the key scanner circuit
entity key_scanner is

    port (
		KScan   : in std_logic_vector(1 downto 0);
		lines   : in std_logic_vector(3 downto 0);
		CLK 	  : in std_logic;
		Reset   : in std_logic;
		
		columns : out std_logic_vector(3 downto 0);
		KPress  : out std_logic; 
		K 		  : out std_logic_vector(3 downto 0)
    );

end key_scanner;


architecture structural of key_scanner is

	component counter is
		port (
			CE 					  : in std_logic;
			CLK 					  : in std_logic;
			reset 				  : in std_logic;
			parallel_load_flag  : in std_logic;
			parallel_load_value : in std_logic_vector(1 downto 0);
		  
			count : out std_logic_vector(1 downto 0)
		);
	end component;
		
	component decoder_2x4 is
		port (
			S : in std_logic_vector (1 downto 0);
			Y : out std_logic_vector (3 downto 0)
		);
	end component;
	
	component priority_encoder is 
		port (
			A 	: in std_logic_vector(3 downto 0);
		 
			Y 	: out std_logic_vector(1 downto 0);
			GS	: out std_logic
		);
	end component;
	
	component register_2bits is
		port (
			CLK   : in std_logic;
			RESET : in std_logic;
			SET   : in std_logic;
			D     : in std_logic_vector(1 downto 0);
			EN    : in std_logic;
			Q     : out std_logic_vector(1 downto 0)
		);
	end component;
	
	
	signal counter_to_decoder: std_logic_vector(1 downto 0);
	signal penc_to_reg		 : std_logic_vector(1 downto 0);
	signal cols					 : std_logic_vector(3 downto 0);
	signal penc_to_kpress	 : std_logic;
	signal K_low             :	std_logic_vector(1 downto 0);
	signal lines_signal      : std_logic_vector(3 downto 0);
	
	
	begin
	
	
	Contador: counter port map (
		CE => KScan(0),
		CLK => CLK,
		reset => Reset,
		parallel_load_flag => '0',
		parallel_load_value => "01",
		count => counter_to_decoder
	);
	
	Decoder: decoder_2x4 port map (
		S => counter_to_decoder,
		Y(0) => cols(0),
		Y(1) => cols(1),
		Y(2) => cols(2),
		Y(3) => cols(3)
	);
	
	lines_signal <= not lines;
	
	Penc: priority_encoder port map (
		A(0)	=> lines_signal(0),
		A(1)	=> lines_signal(1),
		A(2)	=> lines_signal(2),
		A(3)	=> lines_signal(3),
		Y => penc_to_reg,
		GS => penc_to_kpress
	);
	
	Reg: register_2bits port map (
		CLK 	=> KScan(1),
		RESET => Reset,
		SET	=>	'0',
		D 		=> penc_to_reg,
		EN		=> '1',
		Q		=> K_low
	);
	
	K(3)		<= counter_to_decoder(1); 
	K(2) 		<= counter_to_decoder(0);
	K(1) 		<= K_low(1);
	K(0) 		<= K_low(0);
	columns 	<= not cols;
	KPress 	<= penc_to_kpress;
	
end structural;
