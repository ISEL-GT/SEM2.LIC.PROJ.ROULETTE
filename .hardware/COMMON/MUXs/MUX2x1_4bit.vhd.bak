library ieee;
use ieee.std_logic_1164.all;

-- This entity is responsible for acting like a MUX, and giving the output based
-- on the selected inputs
entity mux2x1_4bit is

    port (
        A : in std_logic;
        B : in std_logic;

        selector : in std_logic;

        result : out std_logic
    );

end mux2x1_4bit;


-- Implements the logic of a MUX with two inputs and one selector
architecture structural of mux2x1_4bit is
begin

    result <= (A and not selector) or (B and selector);

end structural;