library ieee;
use ieee.std_logic_1164.all;

entity counter is

    port (
        CE    : in std_logic;
        CLK   : in std_logic;
        reset : in std_logic;
        count : out std_logic_vector(2 downto 0)
    );

end counter;


architecture behavioral of counter is


    component adder_3bits is

        port (
            A : in std_logic_vector(2 downto 0);
            B : in std_logic_vector(2 downto 0);

            carry_in  : in std_logic;
            carry_out : out std_logic;

            result : out std_logic_vector(2 downto 0)
        );

    end component;

    -- Imports the 2bit register
    component register_3bits is

        port (
            CLK   : in std_logic;
            RESET : in std_logic;
            SET   : in std_logic;
            D     : in std_logic_vector(2 downto 0);
            EN    : in std_logic;
            Q     : out std_logic_vector(2 downto 0)
        );

    end component;


    -- The carry out signal for the 3 bit adder
    signal carry_out_adder_3bits : std_logic_vector(2 downto 0);
    signal result_adder_3bits    : std_logic_vector(2 downto 0);
    signal result_register_3bits : std_logic_vector(2 downto 0);

begin

    -- Instantiates the 3 bit adder that always adds 1
    instance_adder_3bits : adder_3bits

        port map (
            A => result_register_3bits,
            B => "001",
            carry_in => '0',
            carry_out => open,
    
            result => result_adder_3bits
        );

    -- Instantiates the 4 bit register
    instance_registry_3bits : register_3bits

        port map (
            CLK   => CLK,
            RESET => reset,
            SET   => '1',
            D     => result_adder_3bits,
            EN    => CE,
            Q     => result_register_3bits
        );

    count <= result_register_3bits;

end behavioral;