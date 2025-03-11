LIBRARY ieee; 
USE ieee.std_logic_1164.all;

-- This is the entity is responsible for connecting the key control and key scanner
-- decoding the inputs from the keyboard
entity key_decode is

	port (
			lines : in std_logic_vector(3 downto 0);
			KAck  : in std_logic;
			CLK 	: in std_logic;
			reset : in stD_logic
			
			parallel_load_flag  : in std_logic;
			parallel_load_value : in std_logic_vector(3 downto 0);
			
			KVal   : out std_logic;
			result : out std_logic_vector(3 downto 0);
	);
	
end key_decode;


architecture behavioral of key_decode is
	
	-- Imports the KeyControl state machine
	component KeyControl is
		 port (
			  reset   : in std_logic;
			  clk     : in std_logic;
			  Kpress  : in std_logic;
			  Kack    : in std_logic;
			  
			  KScan   : out std_logic_vector(1 downto 0);
			  Kval    : out std_logic
		 );
	end component;
	
	
	-- Imports the key scanner circuit
	component key_scanner is
		 port (
			  KScan : in std_logic_vector(1 downto 0);
			  lines : in std_logic_vector(3 downto 0);
			  CLK   : in std_logic;

			  parallel_load_flag  : in std_logic;
			  parallel_load_value : in std_logic_vector(3 downto 0);

			  columns : out std_logic_vector(3 downto 0);
			  KPress  : out std_logic;
			  K       : out std_logic_vector(3 downto 0)
		 );
	end component;
	
	-- Defines the signals used to carry values
	signal key_pressed : std_logic;
	signal key_scan    : std_logic_vector(1 downto 0);
	
	
begin 

	instance_key_scanner: key_scanner
    port map (
        KScan               => KScan,
        lines               => lines,
        CLK                 => CLK,

        parallel_load_flag  => parallel_load_flag,
        parallel_load_value => parallel_load_value,

        columns             => ,
        KPress              => key_pressed,
        K                   => result
    );

	instance_KeyControl: KeyControl
    port map (
        reset   => reset,
        clk     => CLK,
        Kpress  => key_pressed,
        Kack    => KAck,
        
        KScan   => key_scan,
        Kval    => kVal
    );

end behavioral;




	
	

	
