library ieee;
use ieee.std_logic_1164.all;

entity counter_5bits is
    port (
        CE  : in std_logic;
        CLK : in std_logic;
        value: in std_logic_vector(4 downto 0);

        reset  : in std_logic;
        count : out std_logic_vector(4 downto 0)
    );
end counter_5bits;

architecture behavioral of counter_5bits is

    component adder_5bits is
        port (
            A         : in std_logic_vector(4 downto 0);
            B         : in std_logic_vector(4 downto 0);
            carry_in  : in std_logic;
            carry_out : out std_logic;
            result    : out std_logic_vector(4 downto 0)
        );
    end component;

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

    -- Internal signals
    signal result_adder_5bits    : std_logic_vector(4 downto 0);
    signal result_register_5bits : std_logic_vector(4 downto 0);

begin

    -- Adder: adds 1 to the current count
    instance_adder_5bits : adder_5bits
        port map (
            A         => result_register_5bits,
            B         => value, -- Addition value (either -1 or +1)
            carry_in  => '0',
            carry_out => open,
            result    => result_adder_5bits
        );

    -- Register: stores result of MUX
    instance_register_5bits : register_5bits
        port map (
            CLK   => CLK,
            RESET => reset,
            SET   => '1',  -- Assuming SET loads D regardless of content
            D     => result_adder_5bits,
            EN    => CE,
            Q     => result_register_5bits
        );

    -- Output the current count
    count <= result_register_5bits;

end behavioral;
