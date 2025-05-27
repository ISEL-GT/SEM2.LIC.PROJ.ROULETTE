library ieee;
use ieee.std_logic_1164.all;

entity Serial_Controller_tb is
end Serial_Controller_tb;

architecture behavioral of Serial_Controller_tb is

    -- Component declaration of the DUT
    component receiver_controler is
        port (
            not_enRx : in std_logic;
            accept   : in std_logic;
            pFlag    : in std_logic;
            dFlag    : in std_logic;
            RXerror  : in std_logic;

            CLK      : in std_logic;
            Reset    : in std_logic;

            wr       : out std_logic;
            init     : out std_logic;
            DXval    : out std_logic
        );
    end component;

    -- Clock timing constants
    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    -- Signals for interconnection
    signal not_enRx_tb : std_logic;
    signal accept_tb   : std_logic;
    signal pFlag_tb    : std_logic;
    signal dFlag_tb    : std_logic;
    signal RXerror_tb  : std_logic;
    signal CLK_tb      : std_logic;
    signal Reset_tb    : std_logic;
    signal wr_tb       : std_logic;
    signal init_tb     : std_logic;
    signal DXval_tb    : std_logic;

begin

    -- Instantiate the DUT
    UUT: receiver_controler
        port map (
            not_enRx => not_enRx_tb,
            accept   => accept_tb,
            pFlag    => pFlag_tb,
            dFlag    => dFlag_tb,
            RXerror  => RXerror_tb,
            CLK      => CLK_tb,
            Reset    => Reset_tb,
            wr       => wr_tb,
            init     => init_tb,
            DXval    => DXval_tb
        );

    -- Clock generation
    clk_gen: process
    begin
        while true loop
            CLK_tb <= '0';
            wait for half_clk_period;
            CLK_tb <= '1';
            wait for half_clk_period;
        end loop;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Initialization
        Reset_tb     <= '1';
        not_enRx_tb  <= '0';
        accept_tb    <= '0';
        pFlag_tb     <= '0';
        dFlag_tb     <= '0';
        RXerror_tb   <= '0';

        wait for clk_period * 2;
        Reset_tb <= '0';
        wait for clk_period * 2;

        -- State 1: Disable and re-enable receiver
        not_enRx_tb <= '1';
        wait for clk_period * 2;
        not_enRx_tb <= '0';
        wait for clk_period * 2;

        -- State 2: Toggle dFlag
        dFlag_tb <= '0';
        wait for clk_period * 2;
        dFlag_tb <= '1';
        wait for clk_period * 2;

        -- State 3: Toggle pFlag and RXerror
        pFlag_tb   <= '0';
        wait for clk_period * 2;
        pFlag_tb   <= '1';
        wait for clk_period * 2;
        RXerror_tb <= '0';
        wait for clk_period * 2;

        -- State 4: Toggle accept
        accept_tb <= '0';
        wait for clk_period * 2;
        accept_tb <= '1';

        -- State 5: Maintain and reset accept
        wait for clk_period * 2;
        accept_tb <= '1';
        wait for clk_period * 2;
        accept_tb <= '0';

        -- End of simulation
        wait;
    end process;

end behavioral;
