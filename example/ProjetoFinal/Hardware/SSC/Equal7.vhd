LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY Equal7 IS
port(
	Q: in STD_LOGIC_VECTOR(3 downto 0);
	TC: out STD_LOGIC);
	
end Equal7;

architecture structural of Equal7 is
begin

TC <= (Q(0) and Q(1) and Q(2) and not Q(3));


end structural;