library ieee;
use ieee.std_logic_1164.all;

entity keydecode_ringBuffer is
    port (
        lines          : in std_logic_vector(3 downto 0);
        CLK            : in std_logic;
        Reset          : in std_logic;
        CTS		     	  : in std_logic;

		  ack				  : out std_logic;
        columns		  : out std_logic_vector(3 downto 0);
        output 		  : out std_logic_vector(3 downto 0);
        Wreg   		  : out std_logic
    );
end keydecode_ringBuffer;

-- Connect the key_decode, ring buffer and output buffer components
architecture behavioral of keydecode_ringBuffer is

    component Key_decode is
        port (
            Kack    : in std_logic;
            lines   : in std_logic_vector(3 downto 0);
            CLK     : in std_logic;
            Reset   : in std_logic;

            columns : out std_logic_vector(3 downto 0);
            Kout    : out std_logic_vector(3 downto 0);
            Kval    : out std_logic
        );
    end component;

    component RingBuffer is
        port (
            D     : in  std_logic_vector(3 downto 0);
            DAV   : in  std_logic;
            CTS   : in  std_logic;
            RESET : in  std_logic;
            MCLK  : in  std_logic;

            Q     : out std_logic_vector(3 downto 0);
            Wreg  : out std_logic;
            DAC   : out std_logic
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
            Kack  => sig_ACK,
            lines => lines,
            CLK   => CLK,
            Reset => Reset,

            columns => columns,
            Kout    => output_key_decode,
            Kval    => Kval_key_decode
        );

   instance_ring_buffer: RingBuffer
        port map (
            D     => output_key_decode,
            DAV   => Kval_key_decode,
            CTS   => CTS,
            RESET => Reset,
            MCLK  => CLK,
            Q     => output,
            Wreg  => Wreg,
            DAC   => sig_ACK
        );
		  
		  ack <= sig_ACK;

end behavioral;
