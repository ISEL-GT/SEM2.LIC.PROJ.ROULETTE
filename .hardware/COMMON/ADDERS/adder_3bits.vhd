library ieee;
use ieee.std_logic_1164.all;

entity adder_3bits is
	port (
		A : in std_logic_vector(2 downto 0);
		B : in std_logic_vector(2 downto 0);

		carry_in  : in std_logic;
		carry_out : out std_logic;

		result : out std_logic_vector(2 downto 0)
	);
end adder_3bits;

architecture behavioral of adder_3bits is

	component full_adder
		port (
			A : in std_logic;
			B : in std_logic;
			carry_in  : in std_logic;
			carry_out : out std_logic;
			result : out std_logic
		);
	end component;

	signal result_bits : std_logic_vector(2 downto 0);
	signal carry_chain : std_logic_vector(2 downto 0); -- carry_chain(0) é o carry_in

begin

	carry_chain(0) <= carry_in;

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
			carry_out => carry_out,
			result    => result_bits(2)
		);

	result <= result_bits;

end behavioral;
