library ieee;
use ieee.std_logic_1164.all;

-- This entity defines the key scanner circuit
entity key_scanner is

    port (
		KScan : in std_logic_vector(1 downto 0);
		lines : in std_logic_vector(3 downto 0);
		CLK 	: in std_logic;
		
		parallel_load_flag  : in std_logic;
		parallel_load_value : in std_logic_vector(3 downto 0);
		
		columns : out std_logic_vector(3 downto 0);
		KPress  : out std_logic; 
		K 		  : out std_logic_vector(3 downto 0)
    );

end key_scanner;


architecture structural of counter is

	-- Imports the 4 bit registry
	component registry_2bits is
		
		port (
        CLK   : in std_logic;
        RESET : in std_logic;
        D     : in std_logic_vector(2 downto 0);
        Q     : out std_logic_vector(2 downto 0)
		);
	 
	end component;
	
	
	-- Imports the priority encoder
	component priority_encoder is
		
		port (
        A   : in std_logic_vector(3 downto 0);
		  
        Y   : in std_logic_vector(1 downto 0);
        GS  : out std_logic
		);
	 
	end component;
	
	
	-- Imports the decoder
	component decoder_2x4 is
		
		port(
			S : in std_logic_vector (1 downto 0);
			Y : out std_logic_vector (3 downto 0)
		);
	 
	end component;
	
	
	-- Imports the counter
	component counter is
		
		port (
        CE  : in std_logic_vector(1 downto 0);
		  CLK : in std_logic;
		  
		  reset 					 : in std_logic;
		  parallel_load_flag  : in std_logic;
		  parallel_load_value : in std_logic_vector(1 downto 0);
		  
		  count : out std_logic_vector(1 downto 0)
		);

	end component;
	
	
	-- Initializes the signal values for the instance counter
	signal result_counter : std_logic_vector(3 downto 0);
	signal result_priority_encoder : std_logic_vector(3 downto 0);
	signal registry_partial_result : std_logic_vector(1 downto 0);
	signal counter_partial_result  : std_logic_vector(1 downto 0);
	
	
begin

	instance_counter: counter
		port map (
			CE  => Kscan(1),
			CLK => CLK,

			reset 				  => RESET,
			parallel_load_flag  => parallel_load_flag,
			parallel_load_value => parallel_load_value

			count => counter_partial_result
		);
			
			
	instance_decoder: decoder
		port map (
			S => counter,
			Y => columns
		);
	

	instance_priority_encoder: priority_encoder
		port map (
			A  => lines,
		  
			Y  => result_priority_encoder,
			GS => KPress
		);
	
	
	instance_registry_2bits: registry_2bits
		port map (
			CLK   => CLK,
			RESET => RESET,
			D     => result_priority_encoder
			Q     => registry_partial_result
		);	
		
		
	K <= counter_partial_result & registry_partial_result;

end structural
