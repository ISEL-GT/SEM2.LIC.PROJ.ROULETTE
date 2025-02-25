LIBRARY ieee;
Use ieee.std_logic_1164.all;

Entity f_adder is
port
(
	A  :in std_logic;
	B  :in std_logic;
	Ci :in std_logic;
	S  :out std_logic;
	CO :out std_logic
);
end f_adder;

architecture structural of f_adder is
component h_adder is
port
(
	A : in std_logic;
	B : in std_logic;
	R : out std_logic;
	Co: out std_logic
);

end component;

signal adder: std_logic;
signal carry: std_logic_vector(1 downto 0);

begin
U1: h_adder port map ( A => A, B => B, R => adder, Co => carry(0));
U2: h_adder port map ( A => adder, B => Ci, R => S, Co => carry(1));

Co <= carry(0) or carry (1);

end structural;