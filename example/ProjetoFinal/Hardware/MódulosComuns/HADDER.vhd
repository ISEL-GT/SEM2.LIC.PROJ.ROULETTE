LIBRARY ieee;
Use ieee.std_logic_1164.all;

Entity HADDER is
	port (
			A :in std_logic;
			B :in std_logic;
			R :out std_logic;
			Co :out std_logic

);
end HADDER;

architecture STRUCTUHADDER of HADDER is
begin

Co <= B and A;
R <= A xor B;
	
end STRUCTUHADDER;