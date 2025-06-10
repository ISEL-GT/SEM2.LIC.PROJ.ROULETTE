LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Key_reader_tb is
end Key_reader_tb;

architecture behavioral of Key_reader_tb is

    component keyboard_reader is
        port (
            ack_control	: in std_logic;
            lines 		: in std_logic_vector(3 downto 0);
            CLK    		: in std_logic;
            Reset  		: in std_logic;
				
            columns  		: out std_logic_vector(3 downto 0);
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
	 signal clk_div		: std_logic;
	 
    
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
            lines 		=> lines_tb,
            CLK    		=> clk_tb, 
            Reset  		=> reset_tb, 
            columns  		=> columns_tb,
            output  		=> K_tb, 
            Dval   		=> Kval_tb
        );
    
    Test_gen: process
    begin
	 
		  -- Inicialização
        reset_tb <= '1';
        lines_tb <= "1111";
        Kack_tb  <= '0';
        wait for clk_period;

        reset_tb <= '0';
        wait for clk_period * 4;

        -- 20 "cliques"
        for i in 0 to 19 loop
		  
            -- Simula uma tecla diferente a ser premida
            case i mod 10 is
                when 0  => lines_tb <= "1110";
                when 1  => lines_tb <= "1101";
                when 2  => lines_tb <= "1011";
                when 3  => lines_tb <= "0111";
                when 4  => lines_tb <= "0110";
                when 5  => lines_tb <= "1001";
                when 6  => lines_tb <= "0011";
                when 7  => lines_tb <= "1100";
                when 8  => lines_tb <= "0101";
                when 9  => lines_tb <= "1110";
                when others => lines_tb <= "1111";
            end case;
				
				wait for clk_period * 4;
				lines_tb <= "1111";  -- Unpress
				wait for clk_period * 4;

			end loop;
				
				
			for i in 0 to 19 loop
			
				Kack_tb <= '1';
				wait for clk_period * 4;
				Kack_tb <= '0';
				wait for clk_period * 4;

			end loop;
			
	 wait;
    end process;
    
end behavioral;
