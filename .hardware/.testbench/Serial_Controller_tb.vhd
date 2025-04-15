library ieee;
use ieee.std_logic_1164.all;

entity Serial_Controller_tb is
end Serial_Controller_tb;

architecture behavioral of Serial_Controller_tb is

	component receiver_controller is

	port (
		not_enRx	: 	in std_logic;
		accept	: 	in std_logic;
		pFlag    :  in std_logic;
		dFlag    :  in std_logic;
		RXerror  :  in std_logic;
		
		CLK		: 	in std_logic;
		Reset 	:	in std_logic;		
		
		wr	 		: 	out std_logic;
		init     :  out std_logic;
		DXval    :  out std_logic
	);
	end component;
		
	constant clk_period       : TIME := 10 ns;
   constant half_clk_period  : TIME := clk_period / 2;
	
	
	signal not_enRx_tb  : std_logic;
   signal accept_tb    : std_logic;
   signal pFlag_tb     : std_logic;
   signal dFlag_tb     : std_logic;
   signal RXerror_tb   : std_logic;
   signal CLK_tb       : std_logic;
   signal Reset_tb     : std_logic;
   signal wr_tb        : std_logic;
   signal init_tb      : std_logic;
   signal DXval_tb     : std_logic;
	 
begin 

	UUT: receiver_controller
		port map (
			not_enRx => not_enRx_tb,
         accept   => accept_tb,
         pFlag    => pFlag_tb,
         dFlag    => dFlag_tb,
         RXerror  => RXerror_tb,
         CLK      => CLK_tb,
         Reset    => Reset_tb,
         wr       => wr_tb,
         init     => init_tb,
         DXval    => DXval_tb
		);
	
	
	clk_gen: process
	begin 
		CLK_tb <= '0';
		wait for half_clk_period;
		CLK_tb <= '1';
		wait for half_clk_period;
	end process;
	
	stimulus: process
	begin
		Reset_tb <= '1';
		not_enRx_tb <= '0';
		accept_tb <= '0';
		pFlag_tb <= '0';
		dFlag <= '0';
		RXerror_tb <= '0';
		wr_tb <= '0';
		init_tb <= '0';
		DXval_tb <= '0';
		
		wait for clk_period*2;
		Reset_tb <= '0';
		wait for clk_period*2;
		
		not_enRx_tb <= '0';
      wait for clk_period*2;
		
		dFlag_tb <= '1';
      wait for clk_period*2;
		
		pFlag_tb <= '1';
      wait for clk_period*2;
		
		RXerror_tb <= '1';
      wait for clk_period*2;
		
		accept_tb <= '1';
      wait for clk_period*2;
		
		not_enRx_tb <= '1';
      wait for clk_period;
	 
		wait;
	end process;

end behavioral;