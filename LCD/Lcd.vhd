LIBRARY ieee; 
USE ieee.std_logic_1164.all;

entity Lcd is 
	port (		
		RegisterSelector 	: 	out std_logic;
		Enable				: 	out std_logic;
		D 						: 	out std_logic_vector(3 downto 0) 
	);
end Lcd;

architecture structural of Lcd is

	component UsbPort is 
	    port (
			inputPort:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			outputPort :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component;
		
	signal sig_rs 		: std_logic;
	signal sig_e 		: std_logic;
	signal sig_D		: std_logic_vector(3 downto 0);
	
	
	
	
	begin
	
	instance_UsbPort: UsbPort port map ( 
	
		inputPort 		=> "00000000",
		
		outputPort(1) 	=> sig_D(0),
		outputPort(2) 	=> sig_D(1),
		outputPort(3) 	=> sig_D(2),
		outputPort(4) 	=> sig_D(3),
		outputPort(6) 	=> sig_rs,
		outputPort(7) 	=> sig_e
	);
	
		RegisterSelector 	<= sig_rs;
		Enable				<= sig_e;
		D 						<= sig_D;

	
end structural;
	
	
	
	
	