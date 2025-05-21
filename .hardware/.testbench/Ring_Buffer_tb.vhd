library ieee;
use ieee.std_logic_1164.all;

entity Ring_Buffer_tb is
end Ring_Buffer_tb;

architecture behavioral of Ring_Buffer_tb is

    component Ring_Buffer_Control is
        port (
            DAV    : in std_logic;
            CTS    : in std_logic;
            full   : in std_logic;
            empty  : in std_logic;
            CLK    : in std_logic;
            RESET  : in std_logic;

            Wr     : out std_logic;
            selPG  : out std_logic;
            incPut : out std_logic;
            incGet : out std_logic;
            Wreg   : out std_logic;
            DAC    : out std_logic
        );
    end component;

    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    signal DAV_tb    : std_logic;
    signal CTS_tb    : std_logic;
    signal full_tb   : std_logic;
    signal empty_tb  : std_logic;
    signal CLK_tb    : std_logic;
    signal RESET_tb  : std_logic;
    signal Wr_tb     : std_logic;
    signal selPG_tb  : std_logic;
    signal incPut_tb : std_logic;
    signal incGet_tb : std_logic;
    signal Wreg_tb   : std_logic;
    signal DAC_tb    : std_logic;

begin

    UUT: Ring_Buffer_Control
        port map (
            DAV    => DAV_tb,
            CTS    => CTS_tb,
            full   => full_tb,
            empty  => empty_tb,
            CLK    => CLK_tb,
            RESET  => RESET_tb,
            Wr     => Wr_tb,
            selPG  => selPG_tb,
            incPut => incPut_tb,
            incGet => incGet_tb,
            Wreg   => Wreg_tb,
            DAC    => DAC_tb
        );

    clk_gen: process
    begin
        while true loop
            CLK_tb <= '0';
            wait for half_clk_period;
            CLK_tb <= '1';
            wait for half_clk_period;
        end loop;
    end process;

    stimulus: process
    begin 
        RESET_tb <= '1';
        DAV_tb   <= '0';
        CTS_tb   <= '0';
        full_tb  <= '0';
        empty_tb <= '0';

        wait for clk_period * 2;
        RESET_tb <= '0';
        wait for clk_period * 2;

        -- Escrita possível (DAV='1', full='0')
        DAV_tb <= '1';
        full_tb <= '0';
        wait for clk_period * 6; -- Inclui transições entre estados
        DAV_tb <= '0';
        wait for clk_period * 2;

        -- Leitura possível (CTS='1', empty='0')
        CTS_tb <= '1';
        empty_tb <= '0';
        wait for clk_period * 2;
        CTS_tb <= '0';
        wait for clk_period * 2;

        -- Tentativa de escrita com buffer cheio (DAV='1', full='1')
        DAV_tb  <= '1';
        full_tb <= '1';
        empty_tb <= '0';
        wait for clk_period * 2;
        DAV_tb <= '0';

        -- Tentativa de leitura com buffer vazio (CTS='1', empty='1')
        full_tb  <= '0';
        CTS_tb   <= '1';
        empty_tb <= '1';
        wait for clk_period * 2;
        CTS_tb <= '0';

        wait;
    end process;

end behavioral;
