library ieee;
use ieee.std_logic_1164.all;

entity SLCDC_test is 
    port (
        MCLK     : in std_logic;
        RESET    : in std_logic;
        LCD_EN   : out std_logic;
        LCD_RS   : out std_logic;
        LCD_DATA : out std_logic_vector(7 downto 4);
        data     : out std_logic_vector(4 downto 0)
    );
end SLCDC_test;

architecture structural of SLCDC_test is

    component SLCDC is 
        port (
            LCDSel : in std_logic;
            SCLK   : in std_logic;
            SDX    : in std_logic;
            MClk   : in std_logic;
            RESET  : in std_logic;
            WRL    : out std_logic;
            Dout   : out std_logic_vector(4 downto 0)
        );
    end component;

    component UsbPort is
        port (
            inputPort  : in std_logic_vector(7 downto 0);
            outputPort : out std_logic_vector(7 downto 0)
        );
    end component;

    signal signal_D     : std_logic_vector(4 downto 0);
    signal signalInput  : std_logic_vector(7 downto 0);
    signal signalOutput : std_logic_vector(7 downto 0);

begin

    U1 : UsbPort
        port map (
            inputPort  => signalInput,
            outputPort => signalOutput
        );

    U2 : SLCDC
        port map (
            LCDSel => signalOutput(5),
            SCLK   => signalOutput(7),
            SDX    => signalOutput(1),
            MClk   => MCLK,
            RESET  => RESET,
            WRL    => LCD_EN,
            Dout   => signal_D
        );

    LCD_DATA(7 downto 4) 	<= signal_D(4 downto 1);
    LCD_RS              	<= signal_D(0);
    data                	<= signal_D;

end structural;
