library ieee;
use ieee.std_logic_1164.all;

entity serial_receiver is
    port (
        SS      : in  std_logic;
        SCLK    : in  std_logic;
        SDX     : in  std_logic;
        MClk    : in  std_logic;
        Reset   : in  std_logic;
        accept  : in  std_logic;

        DXval   : out std_logic;
        Data    : out std_logic_vector(4 downto 0)
    );
end serial_receiver;

architecture structural of serial_receiver is

    -- Componentes
    component counter_3bits is
        port (
            CE     : in  std_logic;
            CLK    : in  std_logic;
            reset  : in  std_logic;
            count  : out std_logic_vector(2 downto 0)
        );
    end component;

    component parity_checker is
        port (
            data   : in  std_logic;
            init   : in  std_logic;
            CLK    : in  std_logic;
            error  : out std_logic
        );
    end component;

    component ShiftRegisterSerialReceiver is
        port (
            reset  : in  std_logic;
            data   : in  std_logic;
            SCLK   : in  std_logic;
            E      : in  std_logic;
            D      : out std_logic_vector(4 downto 0)
        );
    end component;

    component receiver_controler is 
        port (
            not_enRx : in  std_logic;
            accept   : in  std_logic;
            pFlag    : in  std_logic;
            dFlag    : in  std_logic;
            RXerror  : in  std_logic;
            CLK      : in  std_logic;
            Reset    : in  std_logic;
            wr       : out std_logic;
            init     : out std_logic;
            DXval    : out std_logic
        );
    end component;

    -- Sinais internos
    signal wr_sig        : std_logic;
    signal init_sig      : std_logic;
    signal dFlag_sig     : std_logic;
    signal pFlag_sig     : std_logic;
    signal RXerror_sig   : std_logic;
    signal eq5           : std_logic;
    signal eq6           : std_logic;
    signal counter_val   : std_logic_vector(2 downto 0);
    signal data_shift    : std_logic_vector(4 downto 0);

begin

    -- Shift Register
    ShiftReg: ShiftRegisterSerialReceiver
        port map (
            reset  => Reset,
            data   => SDX,
            SCLK   => SCLK,
            E      => wr_sig,
            D      => data_shift
        );

    -- Parity Checker (sem Reset)
    ParityCheck: parity_checker
        port map (
            data   => SDX,
            init   => init_sig,
            CLK    => SCLK,
            error  => RXerror_sig
        );

    -- Counter
    Counter3bit: counter_3bits
        port map (
            CE     => wr_sig,
            CLK    => SCLK,
            reset  => Reset,
            count  => counter_val
        );

    -- Comparadores
    eq5 <= counter_val(0) and not counter_val(1) and counter_val(2); -- "101" = 5
    eq6 <= not counter_val(0) and counter_val(1) and counter_val(2); -- "110" = 6

    -- Flags
    pFlag_sig <= eq6;
    dFlag_sig <= eq5;

    -- Controlador
    Controller: receiver_controler
        port map (
            not_enRx => SS,
            accept   => accept,
            pFlag    => pFlag_sig,
            dFlag    => dFlag_sig,
            RXerror  => RXerror_sig,
            CLK      => MClk,
            Reset    => Reset,
            wr       => wr_sig,
            init     => init_sig,
            DXval    => DXval
        );

    -- Saída final
    Data <= data_shift;

end structural;
