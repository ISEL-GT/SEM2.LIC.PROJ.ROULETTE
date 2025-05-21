library ieee;
use ieee.std_logic_1164.all;

entity adder_4bits is
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		
		carry_in  : in std_logic;
		carry_out : out std_logic;
		
		result : out std_logic_vector(3 downto 0)
	);
end adder_4bits;

architecture behavioral of adder_4bits is

	component full_adder
		port (
			A : in std_logic;
			B : in std_logic;
			carry_in  : in std_logic;
			carry_out : out std_logic;
			result : out std_logic
		);
	end component;

	-- Result signals from each full adder
	signal result_bits : std_logic_vector(3 downto 0);
	
	-- Carry signals between full adders
	signal carry_chain : std_logic_vector(3 downto 0); -- carry_chain(0) is initial carry_in

begin

	-- Assign initial carry input
	carry_chain(0) <= carry_in;

	-- Instantiate full adders
	full_adder_0: full_adder
		port map (
			A => A(0),
			B => B(0),
			carry_in  => carry_chain(0),
			carry_out => carry_chain(1),
			result    => result_bits(0)
		);

	full_adder_1: full_adder
		port map (
			A => A(1),
			B => B(1),
			carry_in  => carry_chain(1),
			carry_out => carry_chain(2),
			result    => result_bits(1)
		);

	full_adder_2: full_adder
		port map (
			A => A(2),
			B => B(2),
			carry_in  => carry_chain(2),
			carry_out => carry_chain(3),
			result    => result_bits(2)
		);

	full_adder_3: full_adder
		port map (
			A => A(3),
			B => B(3),
			carry_in  => carry_chain(3),
			carry_out => carry_chain(4),
			result    => result_bits(3)
		);

	-- Final output assignment
	result <= result_bits;

end behavioral;
