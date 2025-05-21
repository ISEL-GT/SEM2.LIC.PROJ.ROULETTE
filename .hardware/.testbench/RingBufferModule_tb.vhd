library ieee;
use ieee.std_logic_1164.all;

entity RingBufferModule_tb is
end RingBufferModule_tb;

architecture tb of RingBufferModule_tb is

    -- Componente a testar
    component RingBuffer
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

    -- Sinais para o testbench
    signal D_tb     : std_logic_vector(3 downto 0);
    signal DAV_tb   : std_logic;
    signal CTS_tb   : std_logic;
    signal RESET_tb : std_logic;
    signal MCLK_tb  : std_logic;

    signal Q_tb     : std_logic_vector(3 downto 0);
    signal Wreg_tb  : std_logic;
    signal DAC_tb   : std_logic;

    constant clk_period : time := 10 ns;

begin

    -- Instância do RingBuffer
    UUT: RingBuffer
        port map (
            D     => D_tb,
            DAV   => DAV_tb,
            CTS   => CTS_tb,
            RESET => RESET_tb,
            MCLK  => MCLK_tb,
            Q     => Q_tb,
            Wreg  => Wreg_tb,
            DAC   => DAC_tb
        );

    -- Geração do clock
    clk_gen: process
    begin
        while true loop
            MCLK_tb <= '0';
            wait for clk_period / 2;
            MCLK_tb <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Estímulos
    stimulus: process
    begin
        -- Inicialização
        DAV_tb   <= '0';
        CTS_tb   <= '0';
        D_tb     <= (others => '0');
        RESET_tb <= '1';
        wait for clk_period * 2;

        -- Reset desativado
        RESET_tb <= '0';
        wait for clk_period * 2;

        -- Escrita 1: Enviar D="1010", DAV=1
        D_tb   <= "1010";
        DAV_tb <= '1';
        wait for clk_period * 2;

        -- Retirar DAV (simular pulso)
        DAV_tb <= '0';
        wait for clk_period * 4;

        -- Escrita 2: Enviar D="1100", DAV=1
        D_tb   <= "1100";
        DAV_tb <= '1';
        wait for clk_period * 2;
        DAV_tb <= '0';
        wait for clk_period * 4;

        -- Leitura: CTS=1 (consumidor pronto), espera leitura
        CTS_tb <= '1';
        wait for clk_period * 2;
        CTS_tb <= '0';
        wait for clk_period * 2;

        -- Nova leitura
        CTS_tb <= '1';
        wait for clk_period * 2;
        CTS_tb <= '0';

        wait;
    end process;

end tb;
