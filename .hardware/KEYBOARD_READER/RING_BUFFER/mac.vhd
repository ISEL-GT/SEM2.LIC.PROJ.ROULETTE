library ieee;
use ieee.std_logic_1164.all;

entity mac is

    port (
			CLK: 	  in std_logic;
			reset:  in std_logic;
			
			putget: in std_logic;
			incput: in std_logic;
			incget: in std_logic;

			full: out std_logic;
			empty: out std_logic;
			output: out std_logic_vector(4 downto 0)
    );

end mac;


architecture behavioral of mac is

	-- Imports the 5bit registry 
	component register_5bits is
	
		port (
        CLK   : in std_logic;
        RESET : in std_logic;
        SET   : in std_logic;
        D     : in std_logic_vector(4 downto 0);
        EN    : in std_logic;
        Q     : out std_logic_vector(4 downto 0)
		);
		
	end component;
	
	component adder_5bits is 
	 
		port (
			A : in std_logic_vector(4 downto 0);
			B : in std_logic_vector(4 downto 0);
				
			carry_in  : in std_logic;
			carry_out : out std_logic;
				
			result : out std_logic_vector(4 downto 0)
		);
			
	end component;	
	
	
	signal registry_data_1: std_logic_vector(4 downto 0);
	signal registry_data_2: std_logic_vector(4 downto 0);
	signal registry_input_1: std_logic_vector(4 downto 0);
	signal registry_input_2: std_logic_vector(4 downto 0);
	
	signal registry_add_amount_1: std_logic_vector(4 downto 0);
	signal registry_add_amount_2: std_logic_vector(4 downto 0);

	
	
begin

	registry_add_amount_1 <= "00001" when incput = '1' else "00000";
	registry_add_amount_2 <= "00001" when incget = '1' else "00000";
	

	-- Instantiates the 5 bit adder that always adds 1
	instance_adder_5bits : adder_5bits
	
		port map (
			A => registry_data_1,
			B => registry_add_amount_1,
			carry_in => '0',
			carry_out => open,
				
			result => registry_input_1
		);	
		
	instance_adder_5bits_1 : adder_5bits
	
		port map (
			A => registry_data_2,
			B => registry_add_amount_2,
			carry_in => '0',
			carry_out => open,
				
			result => registry_input_2
		);	
		
	-- Instantiates the 5 bit register
	registry_PUT : register_5bits
	
		port map (
			CLK   => CLK,
			RESET => reset,
			SET   => '0',
			D     => registry_input_1,
			EN    => '1',
			Q     => registry_data_1
		);
		
	-- Instantiates the 5 bit register
	registry_GET : register_5bits
	
		port map (
			CLK   => CLK,
			RESET => reset,
			SET   => '0',
			D     => registry_input_2,
			EN    => '1',
			Q     => registry_data_2
		);
		
	
	empty <= '1' when registry_data_1 = "00000" and registry_data_2 = "00000" else '0';
	full <= '1' when registry_data_1 = "10000" and registry_data_2 = "10000" else '0';
	output <= registry_data_1 when putget = '1' else registry_data_2;
	
end behavioral;