LIBRARY ieee;
Use ieee.std_logic_1164.all;

-- This entity is responsable for corresponding the 4 bits of the inputs to 2 bits
-- with Y(0) being A(0) and A(1) and Y(1) being the A(2) and A(3)
-- Gs is a signal that will be on when one of the inputs is active
entity partial_priority_encoder is 
	port(
		 A 	: in std_logic_vector(1 downto 0);
		 
		 Y 	: out std_logic;
		 GS	: out std_logic
	);
end partial_priority_encoder;

architecture structural of partial_priority_encoder is

begin 

	Y  <= not A(0);
	GS <= A(0) or A(1); 

end structural;
