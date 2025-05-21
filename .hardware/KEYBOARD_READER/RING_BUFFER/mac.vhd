library ieee;
use ieee.std_logic_1164.all;

entity mac is
    port (
        CLK     : in std_logic;
        reset   : in std_logic;

        putget  : in std_logic;
        incput  : in std_logic;
        incget  : in std_logic;

        full    : out std_logic;
        empty   : out std_logic;
        output  : out std_logic_vector(3 downto 0)
    );
end mac;

architecture behavioral of mac is

    -- Imports the 4 bit counter
    component counter_4bits is
        port (
            CE  : in std_logic;
            CLK : in std_logic;
            reset  : in std_logic;
            count : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Imports the 5 bit counter
    component variable_counter_5bits is
        port (
            CE  : in std_logic;
            CLK : in std_logic;
            load: in std_logic_vector(4 downto 0);
            reset  : in std_logic;
            count : out std_logic_vector(4 downto 0)
        );
    end component;


    -- Imports the 2x1 4 bit mux
    component mux2x1_4bit is
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            selector : in std_logic;
				
            result : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Internal signals
    signal value_elements_counter : std_logic_vector(4 downto 0);
    signal enable_element_counter : std_logic;

    signal output_get_counter : std_logic_vector(3 downto 0);
    signal output_put_counter : std_logic_vector(3 downto 0);
    signal output_elements_counter : std_logic_vector(4 downto 0);

begin

    -- Instantiates two 4-bit counters, the put counter and the get counter
    put_counter : counter_4bits
        port map (
            CE    => incput,
            CLK   => CLK,
            reset => reset,
            count => output_put_counter
        );

    get_counter : counter_4bits
        port map (
            CE    => incget,
            CLK   => CLK,
            reset => reset,
            count => output_get_counter
        );

    -- Decide if we're going to increment or decrement based on the the incput signal
    value_elements_counter <= not (incput & incput & incput & incput) & '1';

    -- Decide whether to enable the 5-bit counter based on whether we're putting or getting something
    enable_element_counter <= incput or incget;

    -- Instantiates a 5-bit counter to keep track of the number of elements in the buffer
    elements_counter : variable_counter_5bits
        port map (
            CE    => enable_element_counter,
            CLK   => CLK,
            load => value_elements_counter,
            reset => reset,
            count => output_elements_counter
        );

    -- Instantiates a 2x1 4-bit mux to select between the put and get counters
    output_mux : mux2x1_4bit
        port map (
            A        => output_get_counter,
            B        => output_put_counter,
				
            selector => putget,
            result   => output
        );
		  
	full <= output_elements_counter(4) and not (
            output_elements_counter(3) or
            output_elements_counter(2) or
            output_elements_counter(1) or
            output_elements_counter(0)
        );


	empty <= not (
             output_elements_counter(4) or
             output_elements_counter(3) or
             output_elements_counter(2) or
             output_elements_counter(1) or
             output_elements_counter(0)
         );


end behavioral;