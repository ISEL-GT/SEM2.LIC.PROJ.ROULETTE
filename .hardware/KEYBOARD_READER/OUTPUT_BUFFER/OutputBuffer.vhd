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

	component OutputRegister
		port (
			clk   : in  std_logic;
			Wreg  : in  std_logic;
			Din   : in  std_logic_vector(3 downto 0);
			Dout  : out std_logic_vector(3 downto 0)
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
	REG: OutputRegister
		port map (
			clk   => clk,
			Wreg  => Wreg_internal,
			Din   => Din,
			Dout  => Dout
		);

end structural;
