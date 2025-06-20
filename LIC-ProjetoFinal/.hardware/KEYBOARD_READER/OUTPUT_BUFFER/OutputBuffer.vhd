library ieee;
use ieee.std_logic_1164.all;

entity OutputBuffer is
	port (
		reset   : in  std_logic;
		clk     : in  std_logic;
		Load    : in  std_logic;
		ACK     : in  std_logic;
		Din     : in  std_logic_vector(3 downto 0); 
		Dout    : out std_logic_vector(3 downto 0);
		OBfree  : out std_logic;
		Dval    : out std_logic
	);
end OutputBuffer;

architecture structural of OutputBuffer is

	component OutputBufferControl
		port (
			reset   : in  std_logic;
			clk     : in  std_logic;
			Load    : in  std_logic;
			ACK     : in  std_logic;
			Wreg    : out std_logic;
			OBfree  : out std_logic;
			Dval    : out std_logic
		);
	end component;

	component register_4bits
		port (
			CLK   : in std_logic;
			RESET : in std_logic;
			SET   : in std_logic;
			D     : in std_logic_vector(3 downto 0);
			EN    : in std_logic;
			Q     : out std_logic_vector(3 downto 0)
		);
	end component;
	

	signal Wreg_internal : std_logic;

begin

	-- Instância da máquina de estados
	CTRL: OutputBufferControl
		port map (
			reset   => reset,
			clk     => clk,
			Load    => Load,
			ACK     => ACK,
			Wreg    => Wreg_internal,
			OBfree  => OBfree,
			Dval    => Dval
		);

	-- Instância do registo de dados
	REG: register_4bits
		port map (
			CLK   => Wreg_internal,
			RESET => reset,
			SET   => '0',
			EN    => '1',
			D	   => Din,
			Q  	=> Dout
		);

end structural;
