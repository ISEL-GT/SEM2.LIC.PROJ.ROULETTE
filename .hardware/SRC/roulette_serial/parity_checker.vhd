LIBRARY ieee; 
USE ieee.std_logic_1164.all;

entity parity_checker_roulette is

	port (
		data		: 	in std_logic;
		init		: 	in std_logic;
		CLK		: 	in std_logic;
		Reset 	:	in std_logic;		
		
		error	 	: 	out std_logic
	);
end parity_checker_roulette;

architecture structural of parity_checker_roulette is

component counter_4bits is
	 port (
		 CE 		 : in std_logic;
		 CLK		 : in std_logic;
		 reset 	 : in std_logic;
  
		 count    : out std_logic_vector(3 downto 0)
    );
end component;
signal sig_count_out : std_logic_vector(3 downto 0);
signal sig_error 		: std_logic;

begin
	
	CounterUp : counter_4bits port map (
				 CE  		=> data,
				 CLK 		=>	CLK,	
				 reset 	=>	init,
		  
				 count 	=> sig_count_out
	);
	
	sig_error 	<= not sig_count_out(0);
	error 		<= sig_error;

end structural;

