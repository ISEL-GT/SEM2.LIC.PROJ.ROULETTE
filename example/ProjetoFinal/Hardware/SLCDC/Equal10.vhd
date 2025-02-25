LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY Equal10 IS
port(
	Q: in STD_LOGIC_VECTOR(3 downto 0);
	TC: out STD_LOGIC);
	
end Equal10;

architecture structural of Equal10 is
begin

TC <= (not Q(0) and Q(1) and not Q(2) and Q(3));

end structural;