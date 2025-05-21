LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity SLCDC is
    port (
        LCDSel : in std_logic;
        SCLK   : in std_logic;
        SDX    : in std_logic;
        MClk   : in std_logic;
        Reset  : in std_logic;
        accept : in std_logic;
        
        Wrl    : out std_logic;
        Dout   : out std_logic_vector(4 downto 0)
    );
end SLCDC;

architecture structural of SLCDC is

    component serial_receiver is
        port (
            SS      : in std_logic;
            SCLK    : in std_logic;
            SDX     : in std_logic;
            MClk    : in std_logic;
            Reset   : in std_logic;
            accept  : in std_logic;

            DXval   : out std_logic;
            Data    : out std_logic_vector(4 downto 0)
        );
    end component;

    component LCD_Dispatcher is
        port (
            clk   : in std_logic;
            reset : in std_logic;
            Dval  : in std_logic;
            Din   : in std_logic_vector(4 downto 0);
            
            Wrl   : out std_logic;
            Dout  : out std_logic_vector(4 downto 0);
            done  : out std_logic
        );
    end component;

    -- Sinais internos para interligação
    signal DXval_sig : std_logic;
    signal Data_sig  : std_logic_vector(4 downto 0);
    signal done_sig  : std_logic;

begin

    -- Instância do receptor serial
    ReceiverInst: serial_receiver
        port map (
            SS      => LCDSel,
            SCLK    => SCLK,
            SDX     => SDX,
            MClk    => MClk,
            Reset   => Reset,
            accept  => accept,
            DXval   => DXval_sig,
            Data    => Data_sig
        );

    -- Instância do dispatcher LCD
    DispatcherInst: LCD_Dispatcher
        port map (
            clk     => MClk,
            reset   => Reset,
            Dval    => DXval_sig,
            Din     => Data_sig,
            Wrl     => Wrl,
            Dout    => Dout,
            done    => done_sig
        );

end structural;