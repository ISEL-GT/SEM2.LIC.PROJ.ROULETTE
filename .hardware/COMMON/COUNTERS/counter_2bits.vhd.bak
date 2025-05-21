library ieee;
use ieee.std_logic_1164.all;

entity counter is

    port (
		  CE    : in std_logic;
		  CLK   : in std_logic;
		  reset : in std_logic;
		  count : out std_logic_vector(1 downto 0)
    );

end counter;


architecture behavioral of counter is


	component adder_2bits is 
	 
		port (
			A : in std_logic_vector(1 downto 0);
			B : in std_logic_vector(1 downto 0);
				
			carry_in  : in std_logic;
			carry_out : out std_logic;
				
			result : out std_logic_vector(1 downto 0)
		);
			
	end component;
	
	-- Imports the 2bit register
	component register_2bits is
	
		port (
        CLK   : in std_logic;
        RESET : in std_logic;
        SET   : in std_logic;
        D     : in std_logic_vector(1 downto 0);
        EN    : in std_logic;
        Q     : out std_logic_vector(1 downto 0)
		);
		
	end component;
	
	
	-- The carry out signal for the 2 bit adder
	signal carry_out_adder_2bits : std_logic_vector(1 downto 0);
	signal result_adder_2bits    : std_logic_vector(1 downto 0);
	signal result_register_2bits : std_logic_vector(1 downto 0);
	
begin

	-- Instantiates the 2 bit adder that always adds 1
	instance_adder_2bits : adder_2bits
	
		port map (
			A => result_register_2bits,
			B => "01",
			carry_in => '0',
			carry_out => open,
				
			result => result_adder_2bits
		);
		
	-- Instantiates the 4 bit register
	instance_registry_2bits : register_2bits
	
		port map (
			CLK   => CLK,
			RESET => reset,
			SET   => '1',
			D     => result_adder_2bits,
			EN    => CE,
			Q     => result_register_2bits
		);
		
	count <= result_register_2bits;
		
end behavioral;