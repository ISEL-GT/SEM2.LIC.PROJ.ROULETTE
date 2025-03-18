library ieee;
use ieee.std_logic_1164.all;

entity KeyControl_tb is
end KeyControl_tb;

architecture behavioral of KeyControl_tb is

    component KeyControl is
        port (
            reset   : in std_logic;
            clk     : in std_logic;
            Kpress  : in std_logic;
            Kack    : in std_logic;
            
            KScan   : out std_logic_vector(1 downto 0);
            Kval    : out std_logic
        );
    end component;
    
    constant clk_period       : TIME := 10 ns;
    constant half_clk_period  : TIME := clk_period / 2;
    
    signal reset_tb   : std_logic;
    signal clk_tb     : std_logic;
    signal Kpress_tb  : std_logic;
    signal Kack_tb    : std_logic;
    signal KScan_tb   : std_logic_vector(1 downto 0);
    signal Kval_tb    : std_logic;
    
begin
    
    UUT : KeyControl 
        port map (
            reset   => reset_tb, 
            clk     => clk_tb, 
            Kpress  => Kpress_tb, 
            Kack    => Kack_tb, 
            KScan   => KScan_tb, 
            Kval    => Kval_tb
        );
    
    clk_gen: process
    begin
        clk_tb <= '0';
        wait for half_clk_period;
        clk_tb <= '1';
        wait for half_clk_period;
    end process;
    
    stimulus: process
    begin
        reset_tb    <= '1';
        wait for clk_period;
        
        Kpress_tb   <= '0';
        Kack_tb     <= '0';
        reset_tb    <= '0';
        wait for clk_period;
        
        Kpress_tb   <= '1';
        Kack_tb     <= '0';
        wait for clk_period * 2;
        
        Kpress_tb   <= '0';
        Kack_tb     <= '0';
        wait for clk_period;
        
        Kpress_tb   <= '1';
        Kack_tb     <= '1';
        wait for clk_period;
        
        Kpress_tb   <= '1';
        Kack_tb     <= '0';
        wait for clk_period;
        
        Kpress_tb   <= '0';
        Kack_tb     <= '1';
        wait for clk_period;
        
        Kpress_tb   <= '1';
        Kack_tb     <= '1';
        wait for clk_period;
        
        Kpress_tb   <= '0';
        Kack_tb     <= '0';
        wait for clk_period * 2;
        
        wait;
    end process;
    
end behavioral;