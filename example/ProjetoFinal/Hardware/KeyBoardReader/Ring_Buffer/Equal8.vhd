LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Equal8 is
	port(
		A, B : in STD_LOGIC_VECTOR(3 downto 0);
      Y : out STD_LOGIC
);
end Equal8;

architecture structural of Equal8 is
begin

TC <= (Q(0) and not Q(1) and not Q(2) and not Q(3));

end structural;