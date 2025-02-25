LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY Equal9 IS
port(
	Q: in STD_LOGIC_VECTOR(3 downto 0);
	TC: out STD_LOGIC);
	
end Equal9;

architecture structural of Equal9 is
begin

TC <= (Q(0) and not Q(1) and not Q(2) and Q(3));

end structural;