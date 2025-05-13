library ieee;
use ieee.std_logic_1164.all;

entity memory_address_control is

    port (
        putget: in std_logic;
		  incput: in std_logic;
		  incget: in std_logic;
		  
		  full: out std_logic;
		  empty: out std_logic;
		  output: out std_logic_vector(3 downto 0)
    );

end memory_address_control;


architecture behavioral of memory_address_control is

	-- Imports the 4bit registry 
	component register_4bits_counter is
	
		port (
        CLK   : in std_logic;
        RESET : in std_logic;
        SET   : in std_logic;
        D     : in std_logic_vector(3 downto 0);
        EN    : in std_logic;
        Q     : out std_logic_vector(3 downto 0)
		);
		
	end component;
	
	component adder_4bits is 
	 
		port (
			A : in std_logic_vector(3 downto 0);
			B : in std_logic_vector(3 downto 0);
				
			carry_in  : in std_logic;
			carry_out : out std_logic;
				
			result : out std_logic_vector(3 downto 0)
		);
			
	end component;	
	
	
	signal registry_data_1: std_logic_vector(3 downto 0);
	signal registry_data_2: std_logic_vector(3 downto 0);
	signal registry_input_1: std_logic_vector(3 downto 0);
	signal registry_input_2: std_logic_vector(3 downto 0);
	
	signal registry_add_amount_1: std_logic;
	signal registry_add_amount_2: std_logic;

	
	
begin

	registry_add_amount_1 <= '1' when incput else '0';
	registry_add_amount_2 <= '1' when incget else '0';
	

	-- Instantiates the 4 bit adder that always adds 1
	instance_adder_4bits : adder_4bits
	
		port map (
			A => registry_data_1,
			B => registry_add_amount_1,
			carry_in => '0',
			carry_out => open,
				
			result => registry_input_1
		);	
		
	instance_adder_4bits_1 : adder_4bits
	
		port map (
			A => registry_data_2,
			B => registry_add_amount_2,
			carry_in => '0',
			carry_out => open,
				
			result => registry_input_2
		);	
		
	-- Instantiates the 4 bit register
	registry_PUT : register_4bits_counter
	
		port map (
			CLK   => CLK,
			RESET => reset,
			SET   => '0',
			D     => registry_input_1,
			EN    => CE,
			Q     => registry_data_1
		);
		
	-- Instantiates the 4 bit register
	registry_GET : register_4bits_counter
	
		port map (
			CLK   => CLK,
			RESET => reset,
			SET   => '0',
			D     => registry_input_2,
			EN    => CE,
			Q     => registry_data_2
		);
		
	
	empty <= '1' when registry_data_1 = "0000" and registry_data_1 = "0000" else '0';
	full <= '1' when registry_data_1 = "1111" and registry_data_1 = "1111" else '0';
	result <= registry_data_1 when putget else registry_data_2;
	
end behavioral;