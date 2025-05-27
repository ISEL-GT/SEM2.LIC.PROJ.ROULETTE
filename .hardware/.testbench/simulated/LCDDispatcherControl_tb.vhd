library ieee;
USE ieee.std_logic_1164.all;

entity LCDDispatcherControl_tb is

end LCDDispatcherControl_tb;


architecture behavioral of LCDDispatcherControl_tb is

    component LCDDispatcherControl is
        port(
            clk        : in std_logic;
            reset      : in std_logic;
            Dval       : in std_logic;
            Count      : in std_logic_vector(3 downto 0);

            Wrl        : out std_logic;
            en_count   : out std_logic;
            done       : out std_logic
        );
    end component;

    -- Clock timing constants
    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    -- Signals for interconnection
    signal clk_tb      : std_logic;
    signal reset_tb    : std_logic;
    signal Dval_tb     : std_logic;
    signal Count_tb    : std_logic_vector(3 downto 0);
    signal Wrl_tb      : std_logic;
    signal en_count_tb : std_logic;
    signal done_tb     : std_logic;

begin

    -- Instanciação do DUT
    UUT: LCDDispatcherControl
        port map (
            clk       => clk_tb,
            reset     => reset_tb,
            Dval      => Dval_tb,
            Count     => Count_tb,
            Wrl       => Wrl_tb,
            en_count  => en_count_tb,
            done      => done_tb
        );

    -- Geração do clock
    clk_gen: process
    begin
        while true loop
            clk_tb <= '0';
            wait for half_clk_period;
            clk_tb <= '1';
            wait for half_clk_period;
        end loop;
    end process;

    -- Estímulo
   stimulus: process
    begin
        while true loop  

            -- Reset inicial
            reset_tb    <= '1';
            Dval_tb     <= '0';
            Count_tb    <= "0000";
            wait for clk_period;

            reset_tb <= '0';
            wait for clk_period;

            -- Envio de Dval = '1' e incremento de Count até 13
            Dval_tb <= '1';
            wait for clk_period;

            Count_tb <= "0000"; wait for clk_period;
            Count_tb <= "0001"; wait for clk_period;
            Count_tb <= "0010"; wait for clk_period;
            Count_tb <= "0011"; wait for clk_period;
            Count_tb <= "0100"; wait for clk_period;
            Count_tb <= "0101"; wait for clk_period;
            Count_tb <= "0110"; wait for clk_period;
            Count_tb <= "0111"; wait for clk_period;
            Count_tb <= "1000"; wait for clk_period;
            Count_tb <= "1001"; wait for clk_period;
            Count_tb <= "1010"; wait for clk_period;
            Count_tb <= "1011"; wait for clk_period;
            Count_tb <= "1100"; wait for clk_period;
            Count_tb <= "1101"; wait for clk_period * 10;

            Dval_tb <= '0';
            wait for clk_period * 5;  -- Pequena pausa antes de repetir

        end loop;
    end process;
end behavioral;