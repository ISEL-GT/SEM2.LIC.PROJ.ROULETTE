LIBRARY ieee; 
USE ieee.std_logic_1164.all;


-- This is the top-level entity responsible for running the actual program
entity roulette is

	port (
		Liness: 	in std_logic_vector(3 downto 0);
		CLK   :	in std_logic;
		Reset :	in std_logic;		
		
		LCD_RS	: 	out std_logic;
		LCD_EN	: 	out std_logic;			
		LCD_DATA	: 	out std_logic_vector(7 downto 4);
		
		Colss 	: 	out std_logic_vector(3 downto 0);
		Kout  	: 	out std_logic_vector(3 downto 0);
		Kval		: 	out std_logic 
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
	
	signal sig_k3_0	: std_logic_vector(3 downto 0);
	signal sig_kscan 	: std_logic_vector(1 downto 0);
	signal sig_cols 	: std_logic_vector(3 downto 0);
	signal sig_kval 	: std_logic;
	
	-- Valores não atribuidos correspondentes aos bits 5-7 do input do UsbPort
	-- Este sinal foi criado para não haver erros associados ao Usbport ao abrir o modelsim
	signal inputSignal : std_logic := '0';
	
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
		
		-- Valores não atribuidos
		inputPort(5)	=> inputSignal,
		inputPort(6)	=> inputSignal,
		inputPort(7)	=> inputSignal,
		
		outputPort(0) 	=> sig_kack_outusbport,
		outputPort(1) 	=> sig_d7_4(0), 
		outputPort(2) 	=> sig_d7_4(1), 
		outputPort(3) 	=> sig_d7_4(2), 
		outputPort(4) 	=> sig_d7_4(3), 
		
		-- Valores não atribuidos
		outputPort(5)  => inputSignal,
		
		outputPort(6) 	=> sig_rs, 
		outputPort(7) 	=> sig_enable
	);
	
	LCD_RS			 	<= sig_rs;
	LCD_EN				<= sig_enable;
	LCD_DATA				<= sig_d7_4;
	
	Kval	<= sig_kval;
	Kout 	<= sig_k3_0;
	Colss <= sig_cols;
	
end structural;