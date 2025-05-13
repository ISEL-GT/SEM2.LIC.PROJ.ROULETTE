library ieee;
use ieee.std_logic_1164.all;

entity counterSerialLCD_tb is
end counterSerialLCD_tb;

architecture behavioral of counterSerialLCD_tb is

    component counter_3bits is
        port (
            CE    : in  std_logic;
            CLK   : in  std_logic;
            reset : in  std_logic;
            count : out std_logic_vector(2 downto 0)
        );
    end component;

    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    signal enable_tb : std_logic;
    signal clk_tb    : std_logic;
    signal reset_tb  : std_logic;
    signal count_tb  : std_logic_vector(2 downto 0);

begin

    -- DUT instantiation
    UUT: counter_3bits
        port map (
            CE    => enable_tb,
            CLK   => clk_tb,
            reset => reset_tb,
            count => count_tb
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
        reset_tb  <= '1';
        enable_tb <= '0';
        wait for clk_period;

        -- Tirar reset e ativar enable
        reset_tb  <= '0';
        enable_tb <= '1';
        wait for clk_period * 8;

        -- Voltar a ativar e desativar o reset
        reset_tb <= '1';
        wait for clk_period;
		  
		  reset_tb <= '0';
		  wait for clk_period;

        wait;
    end process;

end behavioral;
