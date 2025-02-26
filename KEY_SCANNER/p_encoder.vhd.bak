LIBRARY ieee;
Use ieee.std_logic_1164.all;

entity p_encoder is 
	port (
		A: in std_logic_vector(3 downto 0);
		Y: out std_logic_vector(1 downto 0);
		GS: out std_logic
	);
end p_encoder;

architecture structural of p_encoder is

begin 

Y(1) <= A(2) or A(3);
Y(0) <= A(1) or A(3);
GS <= A(0) or A(1) or A(2) or A(3); 
end structural;
