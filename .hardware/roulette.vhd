LIBRARY ieee; 
USE ieee.std_logic_1164.all;


-- This is the top-level entity responsible for running the actual program
entity roulette is

	port (
		lines: 	in std_logic_vector(3 downto 0);
		CLK   :	in std_logic;
		Reset :	in std_logic;		

		LCD_RS	: 	out std_logic;
		LCD_EN	: 	out std_logic;			
		LCD_DATA	: 	out std_logic_vector(7 downto 4);
		
		columns 	: 	out std_logic_vector(3 downto 0);
		Kout  	: 	out std_logic_vector(3 downto 0);
		Kval    : out std_logic
	);
end roulette;

-- This architecture connects the UsbPORT, key reader, coin acceptor, SLCDC and SRC components
architecture structural of roulette is

	
	component UsbPort is 
	    port (
			inputPort	:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			outputPort 	:  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component;

	component keyboard_reader is
		port (
			lines         : in std_logic_vector(3 downto 0);
			CLK            : in std_logic;
			Reset          : in std_logic;
			ack_control    : in std_logic;

			columns : out std_logic_vector(3 downto 0);
			output : out std_logic_vector(3 downto 0);
			Dval   : out std_logic
		);
	end component;

	component SLCDC is
		port (
			LCDSel : in std_logic;
			SCLK   : in std_logic;
			SDX    : in std_logic;
			MClk   : in std_logic;
			Reset  : in std_logic;

			Wrl    : out std_logic;
			Dout   : out std_logic_vector(4 downto 0)
		);
	end component;

	component SRC is
		port (
			ack_control : in std_logic;
			CLK         : in std_logic;
			Reset       : in std_logic;

			lines      : in std_logic_vector(3 downto 0);
			Kout        : out std_logic_vector(3 downto 0);
			Kval        : out std_logic
		);
	end component;

	component clock_divisor is
		generic (div: natural := 50000);
		port (
			clk_in  : in  std_logic;
			clk_out : out std_logic
		);
	end component;

	signal clk_div : std_logic;

	-- Sinais de entrada do USB Port
	signal sig_k3_0	: std_logic_vector(3 downto 0);
	signal sig_kscan 	: std_logic_vector(1 downto 0);
	signal sig_cols 	: std_logic_vector(3 downto 0);
	signal sig_kval 	: std_logic;
	signal sig_d7_4	: std_logic_vector(3 downto 0);
	signal sig_enable	: std_logic;
	signal sig_rs		: std_logic;
	signal sig_kack_outusbport : std_logic;

	-- Valores não atribuidos correspondentes aos bits 5-7 do input do UsbPort
	-- Este sinal foi criado para não haver erros associados ao Usbport ao abrir o modelsim
	signal inputSignal : std_logic := '0';

begin

	divider: clock_divisor
		generic map (
			div => 50000  -- Divisor para gerar o clock de 1 MHz
		)
		port map (
			clk_in  => CLK,
			clk_out => clk_div
		);

	usbPortVHD: UsbPort
		port map (
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

	instance_key_reader: keyboard_reader
		port map (
			lines         => lines,
			CLK            => clk_div,
			Reset          => Reset,
			ack_control    => sig_kack_outusbport,

			columns          => sig_cols,
			output         => sig_k3_0,
			Dval           => sig_kval
		);

	instance_slcd: SLCDC
		port map (
			LCDSel => inputSignal,
			SCLK   => clk_div,
			SDX    => sig_d7_4(1),
			MClk   => CLK,
			Reset  => Reset,

			Wrl    => sig_enable,
			Dout   => sig_d7_4
		);

	instance_src: SRC
		port map (
			ack_control => sig_kack_outusbport,
			CLK         => clk_div,
			Reset       => Reset,

			lines      => lines,
			Kout        => sig_k3_0,
			Kval        => sig_kval
		);


	LCD_RS	 <= sig_rs;
	LCD_EN	 <= sig_enable;
	LCD_DATA <= sig_d7_4;

	Kval	<= sig_kval;
	Kout 	<= sig_k3_0;
	columns <= sig_cols;

end structural;