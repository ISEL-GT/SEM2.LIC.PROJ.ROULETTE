library ieee;
use ieee.std_logic_1164.all;

entity Key_Scanner_tb is
end Key_Scanner_tb;

architecture behavioral of Key_Scanner_tb is
	component key_scanner is
		port(
			KScan: in std_logic_vector(1 downto 0);
			lines : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			reset: in std_logic;
			
			columns: out std_logic_vector(3 downto 0);
			Kpress: out std_logic;
			K : out std_logic_vector(3 downto 0)
			);
		end component;
		
		constant clk_period : TIME := 10 ns;
		constant half_clk_period : TIME := clk_period / 2;
		
		signal Kscan_tb : std_logic_vector(1 downto 0);
		signal lines_tb : std_logic_vector(3 downto 0);
		signal clk_tb : std_logic;
		signal reset_tb: std_logic;
		signal columns_tb : std_logic_vector(3 downto 0);
		signal Kpress_tb : std_logic;
		signal K_tb : std_logic_vector(3 downto 0);
		
begin

	UUT : key_scanner port map (Kscan => Kscan_tb, lines => lines_tb, CLK => clk_tb, reset => reset_tb, columns => columns_tb, Kpress => Kpress_tb, K => K_tb);
	
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
		
		wait for clk_period;
		
		Kscan_tb <= "11";
		lines_tb <= "1110";
		reset_tb <= '0';
		
		wait for clk_period;
		
		lines_tb <= "1101";
		
		wait for clk_period;
		
		lines_tb <= "1111";
		
		wait for clk_period;
		
		lines_tb <= "0111";
		
		wait for clk_period;
		
		wait;
		
	end process;
	
end behavioral;
			