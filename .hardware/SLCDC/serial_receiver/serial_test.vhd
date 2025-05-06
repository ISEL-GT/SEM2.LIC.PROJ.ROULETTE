LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity serial_test is 
    port(
        RESETport   : in  std_logic;
        MCLK        : in  std_logic;
        acceptport  : in  std_logic;
		  
		  DXvalport   : out std_logic;
        Dport       : out std_logic_vector(4 downto 0)
    );
end serial_test;

architecture logic of serial_test is

    component serial_receiver is
        port (
            SS       : in  std_logic;
            SCLK     : in  std_logic;
            SDX      : in  std_logic;
            MClk     : in  std_logic;
            Reset    : in  std_logic;
            accept   : in  std_logic;
            DXval    : out std_logic;
            Data     : out std_logic_vector(4 downto 0)
        );
    end component;

    component UsbPort is
        port (
            inputPort  : in  std_logic_vector(7 downto 0);
            outputPort : out std_logic_vector(7 downto 0)
        );
    end component;

    signal SS_N, S_CLK, S_DX 	 : std_logic;
    signal input, output       : std_logic_vector(7 downto 0);
	

begin
    -- Instancia o receptor serial
    U0: serial_receiver 
        port map (
            SS     => SS_N,
            SCLK   => S_CLK,
            SDX    => S_DX,
            MCLK   => MCLK,
            Reset  => RESETport,
            accept => acceptport,
            DXval  => DXvalport,
            Data   => Dport
        );

    -- Instancia o UsbPort
    U1: UsbPort 
        port map (
            inputPort  => input,
            outputPort => output
        );

    -- Mapeamento dos sinais de saída do UsbPort para sinais internos
    -- S_DX  <= output(1);
    -- SCLK_N <= output(7);
    -- SS_N   <= output(5);

end logic;
