library ieee;
use ieee.std_logic_1164.all;

-- This entity is responsible for acting like a MUX, and giving the output based
-- on the selected inputs
entity mux_2x1_5bits is

	port (
		A : in std_logic_vector(4 downto 0);
		B : in std_logic_vector(4 downto 0);

		selector : in std_logic;

		result : out std_logic_vector(4 downto 0)
	);

end mux_2x1_5bits;


-- Implements the logic of a MUX with two inputs and one selector
architecture structural of mux_2x1_5bits is
begin
	
	result(0) <= (A(0) and not selector) or (B(0) and selector);
	result(1) <= (A(1) and not selector) or (B(1) and selector);
	result(2) <= (A(2) and not selector) or (B(2) and selector);
	result(3) <= (A(3) and not selector) or (B(3) and selector);
	result(4) <= (A(4) and not selector) or (B(4) and selector);

end structural;