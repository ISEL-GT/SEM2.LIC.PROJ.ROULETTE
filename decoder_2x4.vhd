LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder_2x4 IS
	port(
		S : in std_logic_vector(1 downto 0);
		Y : out std_logic_vector(3 downto 0)
		
);
END decoder_2x4;

ARCHITECTURE structural of decoder_2x4 is
begin
Y(0) <= (not S(1) and not S(0));
Y(1) <= (not S(1) and S(0));
Y(2) <= (S(1) and not S(0));
Y(3) <= (S(1) and S(0));
end structural;