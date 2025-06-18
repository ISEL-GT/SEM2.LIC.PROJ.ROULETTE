library ieee;
use ieee.std_logic_1164.all;

entity keydecode_outputbuffer is
    port (
        lines          : in std_logic_vector(3 downto 0);
        CLK            : in std_logic;
        Reset          : in std_logic;
        Kack		     : in std_logic;

		  
        columns: out std_logic_vector(3 downto 0);
        output : out std_logic_vector(3 downto 0);
        Dval   : out std_logic
    );
end keydecode_outputbuffer;

-- Connect the key_decode, ring buffer and output buffer components
architecture behavioral of keydecode_outputbuffer is

    component Key_decode is
        port (
            Kack    : in std_logic;
            lines  : in std_logic_vector(3 downto 0);
            CLK     : in std_logic;
            Reset   : in std_logic;

            columns   : out std_logic_vector(3 downto 0);
            Kout    : out std_logic_vector(3 downto 0);
            Kval    : out std_logic
        );
    end component;

    component OutputBuffer is
        port (
            reset  : in  std_logic;
            clk    : in  std_logic;
            Load   : in  std_logic;
            ACK    : in  std_logic;
            Din    : in  std_logic_vector(3 downto 0);
            Dout    : out std_logic_vector(3 downto 0);
            OBfree  : out std_logic;
            Dval    : out std_logic
        );
    end component;
	 
	 component UsbPort
        Port (
            inputPort  : in  std_logic_vector(7 downto 0);
            outputPort : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signals for inter-component communication
    signal output_key_decode 	: std_logic_vector(3 downto 0);
    signal Kval_key_decode  	: std_logic;

    signal wreg_ring_buffer 	: std_logic;
    signal output_ring_buffer : std_logic_vector(3 downto 0);
    signal dac_ring_buffer 	: std_logic;

    signal obfree_output_buffer : std_logic;
	 
	 signal sig_inputPort  : std_logic_vector(7 downto 0);
    signal sig_outputPort : std_logic_vector(7 downto 0);
	 
	 signal sig_Q         : std_logic_vector(3 downto 0);
    signal sig_Dval      : std_logic;
    signal sig_ACK       	 : std_logic;

begin

    instance_key_decode: Key_decode
        port map (
            Kack  => Kack,
            lines => lines,
            CLK   => CLK,
            Reset => Reset,

            columns  => columns,
            Kout   => output_key_decode,
            Kval   => Kval_key_decode
        );


    instance_output_buffer: OutputBuffer
        port map (
            reset  => Reset,
            clk    => CLK,
            Load   => Kval_key_decode,
            ACK    => sig_ACK,
            Din    => output_key_decode,
            Dout   => sig_Q,
            OBfree => obfree_output_buffer,
            Dval   => sig_Dval
        );
		  
		  -- Instância da USBPort
    instance_UsbPort: UsbPort
        port map (
            inputPort  => sig_inputPort,
            outputPort => sig_outputPort
        );
		  
	 sig_inputPort(0)           <= sig_Dval;
    sig_inputPort(4 downto 1)  <= sig_Q;
	 
	 sig_ACK             		 <= sig_outputPort(4);
	 
	 Dval <= sig_Dval;
	 output <= sig_Q;
	 

end behavioral;
