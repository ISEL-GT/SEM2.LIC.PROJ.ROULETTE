 library ieee;
use ieee.std_logic_1164.all;

entity counter_4bits_dispatcher is

    port (
        CE    : in std_logic;
		  CLK   : in std_logic;
		  reset : in std_logic;
		  
		  count : out std_logic_vector(3 downto 0)
    );

end counter_4bits_dispatcher;


architecture behavioral of counter_4bits_dispatcher is


	component adder_4bits is 
	 
		port (
			A : in std_logic_vector(3 downto 0);
			B : in std_logic_vector(3 downto 0);
				
			carry_in  : in std_logic;
			carry_out : out std_logic;
				
			result : out std_logic_vector(3 downto 0)
		);
			
	end component;	
	
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
	
	
	-- The carry out signal for the 4 bit adder
	signal carry_out_adder_4bits : std_logic_vector(3 downto 0);
	signal result_adder_4bits    : std_logic_vector(3 downto 0);
	signal result_register_4bits : std_logic_vector(3 downto 0);
	
begin

	-- Instantiates the 4 bit adder that always adds 1
	instance_adder_4bits : adder_4bits
	
		port map (
			A => result_register_4bits,
			B => "0001",
			carry_in => '0',
			carry_out => open,
				
			result => result_adder_4bits
		);		
		
	-- Instantiates the 4 bit register
	instance_registry_4bits : register_4bits_counter
	
		port map (
			CLK   => CLK,
			RESET => reset,
			SET   => '0',
			D     => result_adder_4bits,
			EN    => CE,
			Q     => result_register_4bits
		);
		
		count <= result_register_4bits;
		
end behavioral;