LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity LCDDispatcherControl_tb is
end LCDDispatcherControl_tb;

architecture behavioral of LCDDispatcherControl_tb is

	component LCDDispatcherControl is
		 port(
			  clk   : in std_logic;
			  reset : in std_logic;
			  Dval  : in std_logic;
			  Wrl   : out std_logic;
			  done  : out std_logic
		 );
	end component;

  -- Clock timing constants
    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    -- Signals for interconnection

    signal CLK_tb      : std_logic;
    signal Reset_tb    : std_logic;
    signal Dval_tb     : std_logic;
	 signal wrt_tb 	  : std_logic;
	 signal done_tb	  : std_logic;

begin 

  -- Instantiate the DUT
    UUT: LCDDispatcherControl
        port map (
            clk 	=> CLK_tb,
            reset => Reset_tb,
            Dval  => Dval_tb
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
		  Dval_tb		<= '0';
        
        wait for clk_period * 2;
        Reset_tb 		<= '0';
		  
        wait for clk_period * 2;
        Dval_tb		<= '1';
		  
        wait for clk_period * 13;
		  Dval_tb		<= '0';

        -- End of simulation
        wait;
    end process;

end behavioral;
