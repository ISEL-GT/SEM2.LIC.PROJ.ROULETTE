library ieee;
use ieee.std_logic_1164.all;

entity Serial_Receiver_tb is
end Serial_Receiver_tb;

architecture behavioral of Serial_Receiver_tb is

	component serial_receiver is

	port (
		SS			: 	in std_logic;
		SCLK		: 	in std_logic;
		SDX		: 	in std_logic;
		Reset 	:	in std_logic;	
		accept   :  in std_logic;
		
		DXval 	: 	out std_logic;
		Data		: 	out std_logic_vector(4 downto 0)			
	);	
	end component;
	
	constant clk_period       : TIME := 10 ns;
   constant half_clk_period  : TIME := clk_period / 2;
	
	signal SS_tb: std_logic;
	signal SCLK_tb: std_logic;
	signal SDX_tb: std_logic;
	signal Reset_tb: std_logic;
	signal accept_tb: std_logic;
	signal DXval_tb: std_logic;
	signal Data_tb: std_logic_vector(4 downto 0);
	
begin 

	UUT: serial_receiver
		port map (
			SS => SS_tb,
			SCLK => SCLK_tb,
			SDX => SDX_tb,
			Reset => Reset_tb,
			accept => accept_tb,
			DXval => DXval_tb,
			Data => Data_tb
		);
		
	clk_gen: process
	begin 
		SCLK_tb <= '0';
		wait for half_clk_period;
		SCLK_tb <= '1';
		wait for half_clk_period;
	end process;
	
	stimulus: process
	begin 
		Reset_tb <= '1';
		SS_tb <= '1';
		accept_tb <= '0';
		SDX_tb <= '0';
		
		wait for clk_period*2;
		
		Reset_tb <= '0';
		wait for clk_period*2;
		
		SS_tb <= '0';
		wait for clk_period*2;
		
		
		--RS
		SDX_tb <= '0';
		wait for clk_period*2;
		
		--DADOS
		SDX_tb <= '0';
		wait for clk_period*2;
		
		SDX_tb <= '1';
		wait for clk_period*2;
		
		SDX_tb <= '0';
		wait for clk_period*2;
		
		SDX_tb <= '1';
		wait for clk_period*2;
		
		SDX_tb <= '1';
		wait for clk_period*2;
		
		
		accept_tb <= '1';
		wait for clk_period*2;
		accept_tb <= '0';
		
		SS_tb <= '1';
		wait for clk_period*4;
		
		
		wait;
	end process;

end behavioral;
		
		