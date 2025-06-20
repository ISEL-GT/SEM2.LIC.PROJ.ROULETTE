library ieee;
use ieee.std_logic_1164.all;

entity SRC_test is
    port (
        MCLK     : in std_logic;
        RESET    : in std_logic;
        HEX0     : out std_logic_vector(7 downto 0);
        HEX1     : out std_logic_vector(7 downto 0);
        HEX2     : out std_logic_vector(7 downto 0);
        HEX3     : out std_logic_vector(7 downto 0);
        HEX4     : out std_logic_vector(7 downto 0);
        HEX5     : out std_logic_vector(7 downto 0)
    );
end SRC_test;

architecture structural of SRC_test is

    component SRC is 
        port (
            RouSel : in std_logic;
            SCLK   : in std_logic;
            SDX    : in std_logic;
            MClk   : in std_logic;
            Reset  : in std_logic;
            Wrl    : out std_logic;
            Dout   : out std_logic_vector(7 downto 0)
        );
    end component;

    component UsbPort is
        port (
            inputPort  : in std_logic_vector(7 downto 0);
            outputPort : out std_logic_vector(7 downto 0)
        );
    end component;

    component rouletteDisplay is
        port (
            set  : in std_logic;
            cmd  : in std_logic_vector(2 downto 0);
            data : in std_logic_vector(4 downto 0);
            HEX0 : out std_logic_vector(7 downto 0);
            HEX1 : out std_logic_vector(7 downto 0);
            HEX2 : out std_logic_vector(7 downto 0);
            HEX3 : out std_logic_vector(7 downto 0);
            HEX4 : out std_logic_vector(7 downto 0);
            HEX5 : out std_logic_vector(7 downto 0)
        );
    end component;

    signal signalInput  : std_logic_vector(7 downto 0);
    signal signalOutput : std_logic_vector(7 downto 0);
    signal Dout_wire    : std_logic_vector(7 downto 0);
    signal Wrl_wire     : std_logic;

begin

    U1 : UsbPort
        port map (
            inputPort  => signalInput,
            outputPort => signalOutput
        );

    U2 : SRC
        port map (
            RouSel => signalOutput(6),
            SCLK   => signalOutput(7),
            SDX    => signalOutput(1),
            MClk   => MCLK,
            Reset  => RESET,
            Wrl    => Wrl_wire,
            Dout   => Dout_wire
        );
		  
    U3 : rouletteDisplay
        port map (
            set  => Wrl_wire,
            cmd  => Dout_wire(2 downto 0),
            data => Dout_wire(7 downto 3),
            HEX0 => HEX0,
            HEX1 => HEX1,
            HEX2 => HEX2,
            HEX3 => HEX3,
            HEX4 => HEX4,
            HEX5 => HEX5
        );

end structural;
