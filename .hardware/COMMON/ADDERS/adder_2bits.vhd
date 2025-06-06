library ieee;
use ieee.std_logic_1164.all;

entity adder_2bits is

	port (
		A : in std_logic_vector(1 downto 0);
		B : in std_logic_vector(1 downto 0);

		carry_in  : in std_logic;
		carry_out : out std_logic;

		result : out std_logic_vector(1 downto 0)
	);

end adder_2bits;


architecture behavioral of adder_2bits is

	-- Imports the full adder from the specification in the full_adder entity
	component full_adder

		port (
			A : in std_logic;
			B : in std_logic;

			carry_in  : in std_logic;
			carry_out : out std_logic;

			result : out std_logic
		);

	end component;


	-- Declares the output and carry variables for the 4 full adders
	signal out_full_adder_1 : std_logic;
	signal out_full_adder_2 : std_logic;

	signal carry_full_adder_1 : std_logic;
	signal carry_full_adder_2 : std_logic;

begin

	-- Instantiates a full adder with all the default values
	instance_full_adder_1 : full_adder

		port map (
			A => A(0),
			B => B(0),

			carry_in  => carry_in,
			carry_out => carry_full_adder_1,

			result => out_full_adder_1
		);

	instance_full_adder_2 : full_adder

		port map (
			A => A(1),
			B => B(1),

			carry_in  => carry_full_adder_1,
			carry_out => carry_full_adder_2,

			result => out_full_adder_2
		);


	-- Defines the adder/subtractor's carry out as the last full adder's carry
	carry_out <= carry_full_adder_2;

	-- Sets the result bits in order
	result(0) <= out_full_adder_1;
	result(1) <= out_full_adder_2;

end behavioral;

