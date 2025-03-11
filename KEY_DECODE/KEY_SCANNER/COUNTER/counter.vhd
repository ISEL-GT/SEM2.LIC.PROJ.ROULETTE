library ieee;
use ieee.std_logic_1164.all;

-- This entity defines a 4bit counter that always adds +1 to the current count, looping
-- around indefinitely.
entity counter is

    port (
        CE  : in std_logic_vector(1 downto 0);
		  CLK : in std_logic;
		  
		  reset 					 : in std_logic;
		  parallel_load_flag  : in std_logic;
		  parallel_load_value : in std_logic_vector(1 downto 0);
		  
		  count : out std_logic_vector(1 downto 0)
    );

end counter;


architecture behavioral of counter is

   -- Declare the component for the flip-flop (FFD)
	component adder_4bits is 
	 
		port (
			A : in std_logic_vector(1 downto 0);
			B : in std_logic_vector(1 downto 0);
				
			carry_in  : in std_logic;
			carry_out : out std_logic;
				
			result : out std_logic_vector(3 downto 0)
		);
			
	end component;
	
	
	-- Imports a 2 inputs x 4 bits mux
	component mux_2x4 is
		
		port (
			A : in std_logic(3 downto 0);
			B : in std_logic_vector(3 downto 0);

			selector : in std_logic;

			result : out std_logic_vector(3 downto 0)
		);
		
	end component;
	
	
	-- Imports the 4bit registry 
	component registry_4bits is
	
		port (
        CLK   : in std_logic;
        RESET : in std_logic;
        SET   : in std_logic;
        D     : in std_logic_vector(2 downto 0);
        EN    : in std_logic;
        Q     : out std_logic_vector(2 downto 0)
		);
		
	end component;
	
	
	-- The carry out signal for the 4 bit adder
	signal carry_out_adder_4bits : std_logic_vector(1 downto 0);
	signal result_adder_4bits    : std_logic_vector(1 downto 0);
	signal result_mux 			  : std_logic_vector(1 downto 0);
	
begin

	-- Instantiates the 4 bit adder that always adds 1
	instance_adder_4bits : adder_4bits
	
		port map (
			A => result_registry_4bits,
			B => '01',
				
			carry_in => '0',
			carry_out => carry_out_adder_4bits,
				
			result => result_adder_4bits;
		);
		
		
	-- Instantiates the MUX
	instance_mux_2x4 : mux_2x4
	
		port map (
			A => result_adder_4bits,
			B => parallel_load_value,

			selector => parallel_load_value,

			result => result_mux;
		);
		
		
	-- Instantiates the 4 bit registry
	instance_registry_4bits : registry_4bits
	
		port map (
			CLK   => CLK,
			RESET => reset,
			SET   => '1',
			D     => result_mux,
			EN    => CE,
			
			Q     => count;
		);
		
end behavioral;
	
	
	

	

	
	
	
	
	
	
    
begin