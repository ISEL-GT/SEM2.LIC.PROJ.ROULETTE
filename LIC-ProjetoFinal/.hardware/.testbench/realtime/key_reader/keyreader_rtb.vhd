LIBRARY ieee; 
USE ieee.std_logic_1164.all;


entity keyreader_rtb is

	port (
		lines         : in std_logic_vector(3 downto 0);
		CLK            : in std_logic;
		Reset          : in std_logic;
		ack_control    : in std_logic;

		columns : out std_logic_vector(3 downto 0);
		output : out std_logic_vector(3 downto 0);
		Dval   : out std_logic
	);
end keyreader_rtb;

architecture structural of keyreader_rtb is

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

begin

	instance_keyboard_reader: keyboard_reader
		port map (
			lines         => lines,
			CLK            => CLK,
			Reset          => Reset,
			ack_control    => ack_control,

			columns => columns,
			output => output,
			Dval   => Dval
		);


end structural;