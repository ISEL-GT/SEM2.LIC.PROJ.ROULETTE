LIBRARY ieee;
Use ieee.std_logic_1164.all;

Entity ADDER is
	port(
		A  :in std_logic_vector(3 downto 0);
		B  :in std_logic_vector(3 downto 0);
		S  :out std_logic_vector(3 downto 0);
		Ci :in std_logic;
		Co :out std_logic
);
end ADDER;

architecture structural of ADDER is
component FADDER is
	port( 
		A : in std_logic;
		B : in std_logic;
		Ci : in std_logic;
		S : out std_logic;
		CO : out std_logic
);
end component;

signal carry : std_logic_vector(3 downto 1);

begin

U1 : FADDER port map ( A => A(0), B => B(0), Ci => Ci, S => S(0), CO => carry(1));

U2 : FADDER port map ( A => A(1), B => B(1), Ci => carry(1), S => S(1), CO => carry(2));
 
u3 : FADDER port map ( A => A(2), B => B(2), Ci => carry(2), S => S(2), CO => carry(3));

u4 : FADDER port map ( A => A(3), B => B(3), Ci => carry(3), S => S(3), CO => CO);

end structural;





