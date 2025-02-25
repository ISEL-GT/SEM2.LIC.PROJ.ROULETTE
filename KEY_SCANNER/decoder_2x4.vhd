LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder_2x4 IS
	port(
		Y : out std_logic_vector(3 downto 0);
		S0, S1 : in std_logic
);
END decoder_2x4;

ARCHITECTURE structural of decoder_2x4 is
begin
Y(0) <= (not S0 and not S1);
Y(1) <= (S0 and not S1);
Y(2) <= (not S0 and S1);
Y(3) <= (S0 and S1);
end structural;