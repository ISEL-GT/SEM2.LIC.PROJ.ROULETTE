library ieee;
use ieee.std_logic_1164.all;

entity SLCDC_tb is
end SLCDC_tb;

architecture behavioral of SLCDC_tb is

    component SLCDC is
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
    end component;

    -- Clock timing constants
    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    -- Signals for interconnection
    signal LCDSel_tb  : std_logic;
    signal SCLK_tb    : std_logic;
    signal SDX_tb     : std_logic;
    signal MClk_tb    : std_logic;
    signal Reset_tb   : std_logic;
    signal accept_tb  : std_logic;

    signal Wrl_tb     : std_logic;
    signal Dout_tb    : std_logic_vector(4 downto 0);

begin

    -- Instantiate the DUT
    UUT: SLCDC
        port map (
            LCDSel => LCDSel_tb,
            SCLK   => SCLK_tb,
            SDX    => SDX_tb,
            MClk   => MClk_tb,
            Reset  => Reset_tb,
            accept => accept_tb,
            Wrl    => Wrl_tb,
            Dout   => Dout_tb
        );

    -- Clock generation
    clk_gen: process
    begin
        while true loop
            MClk_tb <= '0';
            wait for half_clk_period;
            MClk_tb <= '1';
            wait for half_clk_period;
        end loop;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Initialization
        Reset_tb    <= '1';
        LCDSel_tb   <= '1';
        SCLK_tb     <= '0';
        SDX_tb      <= '0';
        accept_tb   <= '0';


        wait for clk_period * 2;
        Reset_tb    <= '0';
        LCDSel_tb   <= '0';
        wait for clk_period * 2;

        -- Enviar bits de dados (5 bits, ex: 10101)

        -- Bit 4 (MSB)
        SDX_tb      <= '1'; wait for clk_period;
        accept_tb   <= '1'; wait for clk_period;
        SCLK_tb     <= '1'; wait for clk_period;
        accept_tb   <= '0'; wait for clk_period;
        SCLK_tb     <= '0'; wait for clk_period;

        -- Bit 3
        SDX_tb      <= '0'; wait for clk_period;
        accept_tb   <= '1'; wait for clk_period;
        SCLK_tb     <= '1'; wait for clk_period;
        accept_tb   <= '0'; wait for clk_period;
        SCLK_tb     <= '0'; wait for clk_period;

        -- Bit 2
        SDX_tb      <= '1'; wait for clk_period;
        accept_tb   <= '1'; wait for clk_period;
        SCLK_tb     <= '1'; wait for clk_period;
        accept_tb   <= '0'; wait for clk_period;
        SCLK_tb     <= '0'; wait for clk_period;

        -- Bit 1
        SDX_tb      <= '0'; wait for clk_period;
        accept_tb   <= '1'; wait for clk_period;
        SCLK_tb     <= '1'; wait for clk_period;
        accept_tb   <= '0'; wait for clk_period;
        SCLK_tb     <= '0'; wait for clk_period;

        -- Bit 0 (LSB)
        SDX_tb      <= '1'; wait for clk_period;
        accept_tb   <= '1'; wait for clk_period;
        SCLK_tb     <= '1'; wait for clk_period;
        accept_tb   <= '0'; wait for clk_period;
        SCLK_tb     <= '0'; wait for clk_period;


        wait for clk_period;

        -- End of simulation
        wait;
    end process;

end behavioral;
