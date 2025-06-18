library ieee;
use ieee.std_logic_1164.all;

entity KBD_test is 
    port (
        lines          : in std_logic_vector(3 downto 0);
        CLK            : in std_logic;
        Reset          : in std_logic;
        ack_control    : in std_logic;

		  
        columns: out std_logic_vector(3 downto 0);
        output : out std_logic_vector(3 downto 0);
        Dval   : out std_logic
    );
end KBD_test;

architecture structural of KBD_test is

    component keyboard_reader
        Port (
            lines       : in  std_logic_vector(3 downto 0);
            CLK         : in  std_logic;
            Reset       : in  std_logic;
            ack_control : in  std_logic;
				
            columns     : out std_logic_vector(3 downto 0);
            output      : out std_logic_vector(3 downto 0);
            Dval        : out std_logic
        );
    end component;

    component UsbPort is
        port (
            inputPort  : in std_logic_vector(7 downto 0);
            outputPort : out std_logic_vector(7 downto 0)
        );
    end component;

    
    signal sig_inputPort  : std_logic_vector(7 downto 0);
    signal sig_outputPort : std_logic_vector(7 downto 0);
	 signal signal_ACK   : std_logic;
	 signal sig_Dval 		: std_logic;
	 signal signalOutput : std_logic_vector(3 downto 0);

begin

    U1 : UsbPort
        port map (
            inputPort  => sig_inputPort,
            outputPort => sig_outputPort
        );

    U2: keyboard_reader
        port map (
            lines       => lines,
            CLK         => CLK,
            Reset       => Reset,
            ack_control => signal_ACK,
            columns     => columns,
            output      => signalOutput,
            Dval        => sig_Dval
        );
	
	sig_inputPort(0)           <= sig_Dval;
   sig_inputPort(4 downto 1)  <= signalOutput;
	
	signal_ACK <= sig_outputPort(4);
	
	
	output <= signalOutput;
	Dval <= sig_Dval;
	
end structural;
