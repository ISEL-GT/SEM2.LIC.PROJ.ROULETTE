library ieee;
use ieee.std_logic_1164.all;

entity adder_4bits is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        
        carry_in  : in std_logic;
        carry_out : out std_logic;
        
        result : out std_logic_vector(3 downto 0)
    );
end adder_4bits;

architecture behavioral of adder_4bits is

    -- Componente de somador completo (full adder)
    component full_adder
        port (
            A         : in std_logic;
            B         : in std_logic;
            carry_in  : in std_logic;
            carry_out : out std_logic;
            result    : out std_logic
        );
    end component;

    -- Sinais intermédios para resultados e carries
    signal out0, out1, out2, out3 : std_logic;
    signal c1, c2, c3, c4         : std_logic;

begin

    -- Bit 0
    FA0: full_adder
        port map (
            A         => A(0),
            B         => B(0),
            carry_in  => carry_in,
            carry_out => c1,
            result    => out0
        );

    -- Bit 1
    FA1: full_adder
        port map (
            A         => A(1),
            B         => B(1),
            carry_in  => c1,
            carry_out => c2,
            result    => out1
        );

    -- Bit 2
    FA2: full_adder
        port map (
            A         => A(2),
            B         => B(2),
            carry_in  => c2,
            carry_out => c3,
            result    => out2
        );

    -- Bit 3
    FA3: full_adder
        port map (
            A         => A(3),
            B         => B(3),
            carry_in  => c3,
            carry_out => carry_out,
            result    => out3
        );

    -- Atribuições finais
    result(0) <= out0;
    result(1) <= out1;
    result(2) <= out2;
    result(3) <= out3;

end behavioral;
