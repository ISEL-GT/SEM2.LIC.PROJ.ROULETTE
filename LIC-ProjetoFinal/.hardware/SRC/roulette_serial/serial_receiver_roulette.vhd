LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity serial_receiver_roulette is
	port (
		SS      : in std_logic;
		SCLK    : in std_logic;
		SDX     : in std_logic;
		MClk    : in std_logic;
		Reset   : in std_logic;	
		accept  : in std_logic;

		DXval   : out std_logic;
		Data    : out std_logic_vector(7 downto 0)
	);
end serial_receiver_roulette;

architecture structural of serial_receiver_roulette is

	component counter_4bits is
		port (
			CE     : in std_logic;
			CLK    : in std_logic;
			reset  : in std_logic;
			count  : out std_logic_vector(3 downto 0)
		);
	end component;

	component parity_checker_roulette is
		port (
			data   : in std_logic;
			init   : in std_logic;
			CLK    : in std_logic;
		
			error  : out std_logic
		);
	end component;

	component roulette_shiftRegister is
		port (
			reset : in std_logic;
			data  : in std_logic;
			SCLK  : in std_logic;
			E     : in std_logic;
			D     : out std_logic_vector(7 downto 0)
		);
	end component;

	component receiver_controler_roulette is 
		port (
			not_enRx : in std_logic;
			accept   : in std_logic;
			pFlag    : in std_logic;
			dFlag    : in std_logic;
			RXerror  : in std_logic;
			CLK      : in std_logic;
			Reset    : in std_logic;
			wr       : out std_logic;
			init     : out std_logic;
			DXval    : out std_logic
		);
	end component;

	signal wr_sig        : std_logic;
	signal init_sig      : std_logic;
	signal dFlag_sig     : std_logic;
	signal pFlag_sig     : std_logic;
	signal RXerror_sig   : std_logic;
	signal eq8           : std_logic;
	signal eq9           : std_logic;
	signal counter_val   : std_logic_vector(3 downto 0);
	signal data_shift    : std_logic_vector(7 downto 0);

begin

	-- Shift Register
	ShiftReg: roulette_shiftRegister
		port map (
			reset  => Reset,
			data   => SDX,
			SCLK   => SCLK,
			E      => wr_sig,
			D      => data_shift
		);

	-- Parity Checker
	ParityCheck: parity_checker_roulette
		port map (
			data   => SDX,
			init   => init_sig,
			CLK    => SCLK,
		
			error  => RXerror_sig
		);

	-- Counter
	Counter4bit: counter_4bits
		port map (
			CE     => '1',
			CLK    => SCLK,
			reset  => init_sig,
			count  => counter_val
		);

	-- Comparadores
	eq8 <= not counter_val(0) and not counter_val(1) and not counter_val(2) and counter_val(3);
	eq9 <= 	  counter_val(0) and not counter_val(1) and not counter_val(2) and counter_val(3);

	-- Flags
	pFlag_sig <= eq9;
	dFlag_sig <= eq8;

	-- Controle
	Controller: receiver_controler_roulette
		port map (
			not_enRx => SS,
			accept   => accept,
			pFlag    => pFlag_sig,
			dFlag    => dFlag_sig,
			RXerror  => RXerror_sig,
			CLK      => MClk,
			Reset    => Reset,
			wr       => wr_sig,
			init     => init_sig,
			DXval    => DXval
		);

	-- Saída
	Data <= data_shift;

end structural;
