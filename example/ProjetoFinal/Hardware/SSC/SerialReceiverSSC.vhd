LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity SerialReceiverSSC is
	port(
		Reset : in std_logic;
		SDX : in std_logic;
		Clk : in std_logic;
		SCLK : in std_logic;
		SS : in std_logic;
		accept : in std_logic;
		D : out std_logic_vector(6 downto 0);
		DXval : out std_logic
);		
end SerialReceiverSSC;
architecture structural of SerialReceiverSSC is
component ShiftRegisterSerialReceiverSSC is 
	port(
		reset : in std_logic;
		data: in std_logic;
		SCLK: in std_logic;
		E: in std_logic;
		D: out std_logic_vector(6 downto 0)
	);
end component;
component Counter is 
	port(
		PL:in std_logic;
		CE:in std_logic;
		CLK:in std_logic;
		Data_in: in std_logic_vector(3 downto 0);
		RESET: in std_logic;
		TC: out std_logic;
		Q:out std_logic_vector(3 downto 0)
		);
end component;
component ParityCheck is 
	port(
		data : in std_logic;
		Sclk : in std_logic;
		init : in std_logic;
		err : out std_logic
);
end component;
component SerialControl is 
	port(
		enRx : in std_logic;
		accept : in std_logic;
		pFlag : in std_logic;
		dFlag : in std_logic;
		RXerror : in std_logic;
		wr : out std_logic;
		init : out std_logic;
		Reset : in std_logic;
		Clk : in std_logic;
		DXval : out std_logic
);
end component;
component equal IS
port
	(A, B : in STD_LOGIC_VECTOR(3 downto 0);
      Y : out STD_LOGIC
   );
end component;

signal ParitCheck_err_exit : std_logic;
signal SerialControl_init_exit : std_logic;
signal SerialControl_wr_exit : std_logic;
signal CounterSerialReceiver_exit : std_logic_vector(3 downto 0);
signal dflag_7: std_logic;
signal pflag_8: std_logic;


begin

Shift: ShiftRegisterSerialReceiverSSC port map (data=>SDX ,SCLK=>SCLK ,E => SerialControl_wr_exit  ,D=>D, reset => Reset);

Count: Counter port map (PL => '0', CE => '1', CLK => SCLK, Data_in => "0000", RESET => SerialControl_init_exit, Q => CounterSerialReceiver_exit);

Parity: ParityCheck port map (data => SDX, Sclk => SCLK, init => SerialControl_init_exit, err => ParitCheck_err_exit);

Controle: SerialControl port map (enRX => SS, accept => accept, pFlag => pflag_8 , dFlag => dflag_7, RXerror => ParitCheck_err_exit, wr => SerialControl_wr_exit, init => SerialControl_init_exit, DXval => DXval, Clk => Clk, Reset => Reset);

EQ7: equal port map(A => CounterSerialReceiver_exit, B => "0111", Y => dflag_7);

EQ8: equal port map(A => CounterSerialReceiver_exit, B => "1000", Y => pflag_8);

end structural;
	