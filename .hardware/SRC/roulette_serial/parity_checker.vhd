LIBRARY ieee; 
USE ieee.std_logic_1164.all;

entity parity_checker_roulette is

	port (
		data		: 	in std_logic;
		init		: 	in std_logic;
		CLK		: 	in std_logic;
				
		error	 	: 	out std_logic
	);
end parity_checker_roulette;

architecture structural of parity_checker_roulette is

component FFD is
	 PORT (
        CLK   : IN  std_logic;   -- Clock input
        RESET : IN  std_logic;   -- Asynchronous reset input (active high)
        SET   : IN  std_logic;   -- Asynchronous set input (active high)
        D     : IN  std_logic;   -- Data input
        EN    : IN  std_logic;   -- Enable input (active high)
        Q     : OUT std_logic    -- Data output
    );
end component;			

component counter_4bits is
	 port (
		 CE 		 : in std_logic;
		 CLK		 : in std_logic;
		 reset 	 : in std_logic;
  
		 count    : out std_logic_vector(3 downto 0)
    );
end component;
signal sig_xor_bit   : std_logic;
signal sig_error 		: std_logic;
signal sig_check		: std_logic;

begin
	FlipFlop  : FFD
	port map (
			CLK	=> CLK,
			RESET	=> init,
			SET	=>	'0',
			D		=> sig_check,
			EN		=> data,
			Q 		=> sig_xor_bit
			);
			
	sig_check <= sig_xor_bit xor data;
		
	sig_error 	<= not sig_xor_bit;
	
	error 		<= sig_error;

end structural;

