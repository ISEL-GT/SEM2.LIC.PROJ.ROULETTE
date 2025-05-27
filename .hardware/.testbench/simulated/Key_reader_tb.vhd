LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Key_reader_tb is
end Key_reader_tb;

architecture behavioral of Key_reader_tb is

    component keyboard_reader is
        port (
            ack_control	: in std_logic;
            Liness 		: in std_logic_vector(3 downto 0);
            CLK    		: in std_logic;
            Reset  		: in std_logic;
				
            Colss  		: out std_logic_vector(3 downto 0);
            output   	: out std_logic_vector(3 downto 0);
            Dval   		: out std_logic
        );
    end component;
    
    constant clk_period       : TIME := 10 ns;
    constant half_clk_period  : TIME := clk_period / 2;
    
    signal Kack_tb  		: std_logic;
    signal lines_tb 		: std_logic_vector(3 downto 0);
    signal clk_tb    	: std_logic;
    signal reset_tb 		: std_logic;
    signal columns_tb 	: std_logic_vector(3 downto 0);
    signal K_tb   		: std_logic_vector(3 downto 0);
    signal Kval_tb   	: std_logic;
	 
    
begin

	clk_gen: process
    begin
        while true loop
            clk_tb <= '0';
            wait for half_clk_period;
            clk_tb <= '1';
            wait for half_clk_period;
        end loop;
    end process;
    
    UUT : keyboard_reader 
        port map (
            ack_control => Kack_tb, 
            Liness 		=> lines_tb, 
            CLK    		=> clk_tb, 
            Reset  		=> reset_tb, 
            Colss  		=> columns_tb, 
            output  		=> K_tb, 
            Dval   		=> Kval_tb
        );
    
    Test_gen: process
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
