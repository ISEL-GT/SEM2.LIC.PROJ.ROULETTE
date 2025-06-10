library ieee;
use ieee.std_logic_1164.all;

entity parity_checker_tb is
end parity_checker_tb;

architecture behavioral of parity_checker_tb is

    component parity_checker is
        port (
            data   : in std_logic;
            init   : in std_logic;
            CLK    : in std_logic;
            error  : out std_logic
        );	
    end component;

    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    signal data_tb   : std_logic;
    signal init_tb   : std_logic;
    signal clk_tb    : std_logic;
    signal error_tb  : std_logic;

begin

    -- DUT instantiation
    UUT: parity_checker
        port map (
            data   => data_tb,
            init   => init_tb,
            CLK    => clk_tb,
            error  => error_tb
        );

    -- Clock generation
    clk_gen: process
    begin
        while true loop
            clk_tb <= '0';
            wait for half_clk_period;
            clk_tb <= '1';
            wait for half_clk_period;
        end loop;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Inicialização
        init_tb  <= '1';
        data_tb  <= '0';
        wait for clk_period;

        -- Tirar reset e init
        init_tb  <= '0';
        wait for clk_period;

        -- Enviar sequência de 5 bits com paridade ímpar (por ex: 1, 0, 1, 0, 1) => número ímpar de bits a '1'
        data_tb <= '1'; wait for clk_period;
        data_tb <= '0'; wait for clk_period;
        data_tb <= '1'; wait for clk_period;
        data_tb <= '0'; wait for clk_period;
        data_tb <= '1'; wait for clk_period;

        wait for clk_period;

        -- Enviar sequência com paridade par (por ex: 1, 0, 1, 0) => número par de bits a '1'
        init_tb  <= '1'; wait for clk_period; -- reinicializar o contador
        init_tb  <= '0'; wait for clk_period;

        data_tb <= '1'; wait for clk_period;
        data_tb <= '0'; wait for clk_period;
        data_tb <= '1'; wait for clk_period;
        data_tb <= '0'; wait for clk_period;

        wait for clk_period;

        -- Parar simulação
        wait;
    end process;

end behavioral;
