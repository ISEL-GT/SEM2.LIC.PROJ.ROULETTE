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
    component incrementable_counter_5bits is
        port (
            CE  : in std_logic;
            CLK : in std_logic;
            value: in std_logic_vector(4 downto 0);
            reset  : in std_logic;
            count : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Imports the 2x1 1 bit mux
    component mux_2x1_1bit is
        port (
            A : in std_logic;
            B : in std_logic;
            selector : in std_logic;
            result : out std_logic
        );
    end component;

    -- Imports the 2x1 4 bit mux
    component mux_2x1_4bits is
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
    enable_element_counter <= incinput or incget;

    -- Instantiates a 5-bit counter to keep track of the number of elements in the buffer
    elements_counter : incrementable_counter_5bits
        port map (
            CE    => enable_element_counter,
            CLK   => CLK,
            value => value_elements_counter,
            reset => reset,
            count => output_elements_counter
        );

    -- Instantiates a 2x1 4-bit mux to select between the put and get counters
    output_mux : mux_2x1_4bits
        port map (
            A        => output_get_counter,
            B        => output_get_counter,
            selector => putget,
            result   => output
        );

    full <= output_elements_counter = "10000";
    empty <= output_elements_counter = "00000";

end behavioral;