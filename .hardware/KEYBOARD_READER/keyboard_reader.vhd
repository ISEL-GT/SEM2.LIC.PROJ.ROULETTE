library ieee;
use ieee.std_logic_1164.all;

entity keyboard_reader is
    port (
        lines          : in std_logic_vector(3 downto 0);
        CLK            : in std_logic;
        Reset          : in std_logic;
        ack_control    : in std_logic;

        columns : out std_logic_vector(3 downto 0);
        output : out std_logic_vector(3 downto 0);
        Dval   : out std_logic
    );
end keyboard_reader;

-- Connect the key_decode, ring buffer and output buffer components
architecture behavioral of keyboard_reader is

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

    -- Signals for inter-component communication
    signal output_key_decode : std_logic_vector(3 downto 0);
    signal Kval_key_decode  : std_logic;

    signal wreg_ring_buffer : std_logic;
    signal output_ring_buffer : std_logic_vector(3 downto 0);
    signal dac_ring_buffer : std_logic;

    signal obfree_output_buffer : std_logic;

begin

    instance_key_decode: Key_decode
        port map (
            Kack   => ack_control,
            lines => lines,
            CLK    => CLK,
            Reset  => Reset,

            columns  => columns,
            Kout   => output_key_decode,
            Kval   => Kval_key_decode
        );

    instance_ring_buffer: RingBuffer
        port map (
            D     => output_key_decode,
            DAV   => Kval_key_decode,
            CTS   => obfree_output_buffer,
            RESET => Reset,
            MCLK  => CLK,
            Q     => output_ring_buffer,
            Wreg  => wreg_ring_buffer,
            DAC   => dac_ring_buffer
        );

    instance_output_buffer: OutputBuffer
        port map (
            reset  => Reset,
            clk    => CLK,
            Load   => wreg_ring_buffer,
            ACK    => ack_control,
            Din    => output_ring_buffer,
            Dout   => output,
            OBfree => obfree_output_buffer,
            Dval   => Dval
        );

end behavioral;
