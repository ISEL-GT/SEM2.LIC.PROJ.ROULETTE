LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux4x1 IS
	port(
		A : in std_logic_vector(3 downto 0);
		S0, S1 : in std_logic;
		Y : out std_logic	
);
END mux4x1;

ARCHITECTURE arch_mux4x1 of mux4x1 is
begin

Y <= (not S0 and not S1 and A(0)) or (S0 and not S1 and A(1)) or (not S0 and S1 and A(2)) or (S0 and S1 and A(3));

end arch_mux4x1;