LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity roulette_dispatcher_tb is
end roulette_dispatcher_tb;


architecture behavioral of roulette_dispatcher_tb is

    component roulette_dispatcher is
        port(
            clk   : in std_logic;
				reset : in std_logic;
				Dval  : in std_logic;
				Din   : in std_logic_vector(7 downto 0);

				Wrl   : out std_logic;
				Dout  : out std_logic_vector(7 downto 0);
				done  : out std_logic
        );
    end component;

    -- Clock timing constants
    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    -- Signals for interconnection
    signal clk_tb      : std_logic;
    signal reset_tb    : std_logic;
    signal Dval_tb     : std_logic;
	 signal Din_tb		  : std_logic_vector(7 downto 0);
   
    signal Wrl_tb      : std_logic;
    signal Dout_tb 	  : std_logic_vector(7 downto 0);
    signal done_tb     : std_logic;

begin

    -- Instanciação do DUT
    UUT: roulette_dispatcher
        port map (
            clk       => clk_tb,
            reset     => reset_tb,
            Dval      => Dval_tb,
				Din 		 => Din_tb,
            
            Wrl       => Wrl_tb,
            Dout	    => Dout_tb,
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
        while true loop  -- <== Adicionado loop infinito

            -- Reset inicial
            reset_tb    <= '1';
            Dval_tb     <= '0';
            Din_tb    <= "10101010";
            wait for clk_period;

            reset_tb <= '0';
            wait for clk_period;

            -- Envio de Dval = '1' e 
            Dval_tb <= '1';
            wait for clk_period*15;


            Dval_tb <= '0';
            wait for clk_period * 5;  
				
				Din_tb    <= "00001111";
            wait for clk_period;
				
				 -- Envio de Dval = '1' e 
            Dval_tb <= '1';
            wait for clk_period*15;
				
				Dval_tb <= '0';
            wait for clk_period * 5;  

        end loop;
    end process;


end behavioral;