LIBRARY ieee; 
USE ieee.std_logic_1164.all;

entity parity_checker is

	port (
		data		: 	in std_logic;
		init		: 	in std_logic;
		CLK		: 	in std_logic;
				
		error	 	: 	out std_logic
	);
end parity_checker;

architecture structural of parity_checker is

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

