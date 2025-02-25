LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity SpaceInvadersGame is
	port(
		Cols: out std_logic_vector(2 downto 0);
		Lines: in std_logic_vector(3 downto 0);
		Mclk: in std_logic;
		Reset: in std_logic;
		E: out std_logic;
		Rs: out std_logic;
		D: out std_logic_vector(8 downto 0);
		coin : in std_logic;
		M : in std_logic;
		accept : out std_logic;
		HEX0	: out std_logic_vector(7 downto 0);
		HEX1	: out std_logic_vector(7 downto 0);
		HEX2	: out std_logic_vector(7 downto 0);
		HEX3	: out std_logic_vector(7 downto 0);
		HEX4	: out std_logic_vector(7 downto 0);
		HEX5	: out std_logic_vector(7 downto 0)
);
end SpaceInvadersGame;
architecture structural of SpaceInvadersGame is
component KeyBoardReader is	
	port(
		Lines: in std_logic_vector(3 downto 0);
		Mclk: in std_logic;
		Reset: in std_logic;
		ACK: in std_logic;
		Dval: out std_logic;
		QValue: out std_logic_vector(3 downto 0);
		Cols: out std_logic_vector(2 downto 0)
);
end component;
component UsbPort is	
	port(
			inputPort: in std_logic_vector(7 downto 0);
			outputPort : out std_logic_vector(7 downto 0)
);
end component;
component SLCDC is
port(
		SS : in std_logic;
		Reset : in std_logic;
		SCLK : in std_logic;
		Clk : in std_logic;
		SDX : in std_logic;
		WrL : out std_logic;
		DoutSLCDC: out std_logic_vector(8 downto 0)
		);
end component;
component SSC is
  port(
		SS : in std_logic;
		Reset : in std_logic;
		SCLK : in std_logic;
		Clk : in std_logic;
		SDX : in std_logic;
		WrD : out std_logic;
		DoutSSC: out std_logic_vector(6 downto 0)
);
end component;
component scoreDisplay is
port(	set	: in std_logic;
		cmd	: in std_logic_vector(2 downto 0);
		data	: in std_logic_vector(3 downto 0);
		HEX0	: out std_logic_vector(7 downto 0);
		HEX1	: out std_logic_vector(7 downto 0);
		HEX2	: out std_logic_vector(7 downto 0);
		HEX3	: out std_logic_vector(7 downto 0);
		HEX4	: out std_logic_vector(7 downto 0);
		HEX5	: out std_logic_vector(7 downto 0)
);
end component;

signal UsbPortACK_exit : std_logic;
signal KeyBoardReaderDval_exit : std_logic;
signal KeyBoardReaderQ_exit : std_logic_vector(3 downto 0);
signal SSSLCDC_USB : std_logic;
signal SSSSC_USB : std_logic;
signal SDXUSB : std_logic;
signal ClockSLCDC : std_logic;
signal set_scoreDisplay : std_logic;
signal cmd_scoreDisplay : std_logic_vector(2 downto 0);
signal data_scoreDisplay : std_logic_vector(3 downto 0);

begin

KeyBoard: KeyBoardReader port map (Lines => Lines, Mclk => Mclk, Reset => Reset, ACK => UsbPortACK_exit,Dval => KeyBoardReaderDval_exit ,QValue => KeyBoardReaderQ_exit, Cols => Cols);
Usb: UsbPort port map (inputPort(0) => KeyBoardReaderQ_exit(0) , inputPort(1) => KeyBoardReaderQ_exit(1) ,inputPort(2) => KeyBoardReaderQ_exit(2) , inputPort(3) => KeyBoardReaderQ_exit(3) ,inputPort(4) => KeyBoardReaderDval_exit ,inputPort(6) => coin ,inputPort(7) => M ,outputPort(0) => SSSLCDC_USB ,outputPort(1) => SSSSC_USB,outputPort(2) => open, outputPort(3) => SDXUSB ,outputPort(4) => ClockSLCDC ,outputPort(5) => open ,outputPort(6) => open ,outputPort(7) => UsbPortACK_exit);
SLC : SLCDC port map (SS => SSSLCDC_USB, Reset => Reset, Clk => Mclk, SCLK => ClockSLCDC, SDX => SDXUSB, Wrl => E, DoutSLCDC(0) => Rs, DoutSLCDC(1) => D(0),DoutSLCDC(2) => D(1),DoutSLCDC(3) => D(2),DoutSLCDC(4) => D(3),DoutSLCDC(5) => D(4),DoutSLCDC(6) => D(5),DoutSLCDC(7) => D(6),DoutSLCDC(8) => D(7));
SC : SSC port map (SS => SSSSC_USB, Reset => Reset, Clk => Mclk,SDX => SDXUSB, WrD => set_scoreDisplay, DoutSSC(0) => cmd_scoreDisplay(0), DoutSSC(1) => cmd_scoreDisplay(1), DoutSSC(2) => cmd_scoreDisplay(2), DoutSSC(3) => data_scoreDisplay(0),DoutSSC(4) => data_scoreDisplay(1),DoutSSC(5) => data_scoreDisplay(2), DoutSSC(6) => data_scoreDisplay(3),SCLK => ClockSLCDC );
SD : scoreDisplay port map (set => set_scoreDisplay, cmd(0) => cmd_scoreDisplay(0), cmd(1) => cmd_scoreDisplay(1), cmd(2) => cmd_scoreDisplay(2), data(0) => data_scoreDisplay(0), data(1) => data_scoreDisplay(1),data(2) => data_scoreDisplay(2),data(3) => data_scoreDisplay(3), HEX0 => HEX0, HEX1 => HEX1, HEX2 => HEX2, HEX3 => HEX3, HEX4 => HEX4, HEX5 => HEX5);
accept <= coin;
end structural;