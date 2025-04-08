library ieee;
use ieee.std_logic_1164.all;

entity Key_decode_tb is
end Key_decode_tb;

architecture behavioral of Key_decode_tb is

    component Key_decode is 
        port (
            Kack   : in std_logic;
            Liness : in std_logic_vector(3 downto 0);
            CLK    : in std_logic;
            Reset  : in std_logic;
            
            Colss  : out std_logic_vector(3 downto 0);
            Kout   : out std_logic_vector(3 downto 0);
            Kval   : out std_logic
        );
    end component;
    
    constant clk_period       : TIME := 20 ns;
    constant half_clk_period  : TIME := clk_period / 2;
    
    signal Kack_tb      : std_logic;
    signal lines_tb     : std_logic_vector(3 downto 0);
    signal clk_tb       : std_logic;
    signal reset_tb     : std_logic;
    signal columns_tb   : std_logic_vector(3 downto 0);
    signal K_tb         : std_logic_vector(3 downto 0);
    signal Kval_tb      : std_logic;

begin
    
    UUT : Key_decode 
        port map (
            Kack   => Kack_tb, 
            Liness => lines_tb, 
            CLK    => clk_tb, 
            Reset  => reset_tb, 
            Colss  => columns_tb, 
            Kval   => Kval_tb, 
            Kout   => K_tb
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
        reset_tb <= '1';
		  lines_tb <= "1111";
		  Kack_tb  <= '0';
        wait for clk_period;
		  
        lines_tb <= "1111";  -- not Kpress
        reset_tb <= '0';
		  Kack_tb  <= '1';
        wait for clk_period * 2;

        -- Test of first line
        lines_tb <= "0111";
        wait for clk_period * 2;
		  
        Kack_tb  <= '1';
        wait for clk_period * 2;
		  
        lines_tb <= "1111";  -- not Kpress
        wait for clk_period * 2;
		  
        Kack_tb  <= '0';
        wait for clk_period * 2;

        -- Test of second line
        lines_tb <= "1011";
        wait for clk_period * 2;
		  
        Kack_tb  <= '1';
        wait for clk_period * 2;
		  
        lines_tb <= "1111";  -- not Kpress
        wait for clk_period * 2;
		  
        Kack_tb  <= '0';
        wait for clk_period * 2;

        -- Test of third line
        lines_tb <= "1101";
        wait for clk_period * 2;
		  
        Kack_tb  <= '1';
        wait for clk_period * 2;
		  
        lines_tb <= "1111";  -- not Kpress
        wait for clk_period * 2;
		  
        Kack_tb  <= '0';
        wait for clk_period * 2;

        -- Test of fourth line
        lines_tb <= "1110";
        wait for clk_period * 2;
		  
        Kack_tb  <= '1';
        wait for clk_period * 2;
		  
        lines_tb <= "1111";  -- not Kpress
        wait for clk_period * 2;
		  
        Kack_tb  <= '0';
        wait for clk_period * 2;

        wait;
    end process;
    
end behavioral;
