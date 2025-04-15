library ieee;
use ieee.std_logic_1164.all;

-- This entity is responsible for acting as a 2x4 decoder
entity decoder_2x4 is

	port(
		S : in std_logic_vector (1 downto 0);
		Y : out std_logic_vector (3 downto 0)
	);
	
end decoder_2x4;


architecture structural of decoder_2x4 is
begin

	Y(0) <= (not S(1) and not S(0));
	Y(1) <= (not S(1) and S(0));
	Y(2) <= (S(1) and not S(0));
	Y(3) <= (S(1) and S(0));
	
end structural;