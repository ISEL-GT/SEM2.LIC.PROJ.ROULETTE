library ieee;
use ieee.std_logic_1164.all;

entity OutputBuffer_tb is
end OutputBuffer_tb;

architecture behavioral of OutputBuffer_tb is

    -- Componente a testar
    component OutputBuffer is
        port (
            reset   : in  std_logic;
            clk     : in  std_logic;
            Load    : in  std_logic;
            ACK     : in  std_logic;
            Din     : in  std_logic_vector(3 downto 0); 
            Dout    : out std_logic_vector(3 downto 0);
            OBfree  : out std_logic;
            Dval    : out std_logic
        );
    end component;

    -- Constantes de tempo
    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    -- Sinais de teste
    signal clk_tb     : std_logic;
    signal reset_tb   : std_logic;
    signal Load_tb    : std_logic;
    signal ACK_tb     : std_logic;
    signal Din_tb     : std_logic_vector(3 downto 0);
    signal Dout_tb    : std_logic_vector(3 downto 0);
    signal OBfree_tb  : std_logic;
    signal Dval_tb    : std_logic;

begin

    -- Instanciação do DUT
    UUT: OutputBuffer
        port map (
            reset   => reset_tb,
            clk     => clk_tb,
            Load    => Load_tb,
            ACK     => ACK_tb,
            Din     => Din_tb,
            Dout    => Dout_tb,
            OBfree  => OBfree_tb,
            Dval    => Dval_tb
        );

    -- Geração de clock
    clk_gen: process
    begin
        while true loop
            clk_tb <= '0';
            wait for half_clk_period;
            clk_tb <= '1';
            wait for half_clk_period;
        end loop;
    end process;

    -- Estímulos de teste
    stimulus: process
    begin
        while true loop 
        -- Reset inicial
        reset_tb <= '1';
        Load_tb  <= '0';
        ACK_tb   <= '0';
        Din_tb   <= "0000";
        wait for clk_period;

        reset_tb <= '0';
        wait for clk_period;

        -- Load de um valor
        Din_tb  <= "1010";
        Load_tb <= '1';
        wait for clk_period;
        Load_tb <= '0';

        -- Esperar alguns ciclos com o valor carregado
        wait for clk_period * 3;

        -- ACK do recetor, a sinalizar que leu o valor
        ACK_tb <= '1';
        wait for clk_period;
        ACK_tb <= '0';

        -- Espera extra
        wait for clk_period * 4;

        -- Novo valor
        Din_tb  <= "0101";
        Load_tb <= '1';
        wait for clk_period;
        Load_tb <= '0';

        wait for clk_period * 2;

        ACK_tb <= '1';
        wait for clk_period;
        ACK_tb <= '0';

        wait for clk_period * 5;
        end loop;
    end process;

end behavioral;
