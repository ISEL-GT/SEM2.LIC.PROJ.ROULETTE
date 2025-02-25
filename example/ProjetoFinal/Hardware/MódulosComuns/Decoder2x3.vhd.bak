LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Decoder2x3 IS
	port(
		Y : out std_logic_vector(2 downto 0);
		S0, S1 : in std_logic
);
END Decoder2x3;

ARCHITECTURE arch_Decoder of Decoder2x3 is
begin
Y(0) <= (not S0 and not S1);
Y(1) <= (S0 and not S1);
Y(2) <= (not S0 and S1);

end arch_Decoder;