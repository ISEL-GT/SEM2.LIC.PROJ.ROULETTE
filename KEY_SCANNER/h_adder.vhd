LIBRARY ieee;
Use ieee.std_logic_1164.all;

Entity h_adder is
	port (
			A :in std_logic;
			B :in std_logic;
			R :out std_logic;
			Co :out std_logic

);
end h_adder;

architecture structural of h_adder is
begin

Co <= B and A;
R <= A xor B;
	
end structural;