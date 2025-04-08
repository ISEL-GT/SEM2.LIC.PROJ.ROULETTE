LIBRARY ieee;
Use ieee.std_logic_1164.all;

-- This entity is responsable for corresponding the 4 bits of the inputs to 2 bits
-- with Y(0) being A(0) and A(1) and Y(1) being the A(2) and A(3)
-- Gs is a signal that will be on when one of the inputs is active
entity priority_encoder is 
	port(
		 A 	: in std_logic_vector(3 downto 0);
		 
		 Y 	: out std_logic_vector(1 downto 0);
		 GS	: out std_logic
	);
end priority_encoder;

architecture structural of priority_encoder is

	component partial_priority_encoder is 
	port(
		 A 	: in std_logic_vector(1 downto 0);
		 
		 Y 	: out std_logic;
		 GS	: out std_logic
	);
	end component;
	
	component mux_2x1_penc is

	port (
		A : in std_logic;
		B : in std_logic;

		selector : in std_logic;

		result : out std_logic
	);

	end component;

	signal Y_PPenc1	:  std_logic;
	signal GS_PPenc1	:  std_logic;
	
	signal Y_PPenc2	:  std_logic;
	signal GS_PPenc2	:  std_logic;
	
	signal Y_PPenc3	:  std_logic;
	signal GS_PPenc3	:  std_logic;
	
	signal out_mux2x1 :  std_logic;
	
begin 

	
	PencPartial1: partial_priority_encoder 
	port map(
		 A(0) => A(0) ,
		 A(1) => A(1),
		 
		 Y 	=> Y_PPenc1,
		 GS 	=> GS_PPenc1
	);
		
	PencPartial2: partial_priority_encoder 
	port map(
		 A(0) => A(2) ,
		 A(1) => A(3),
		 
		 Y 	=> Y_PPenc2,
		 GS 	=> GS_PPenc2
	);
	
	PencPartial3: partial_priority_encoder 
	port map(
		 A(0) => GS_PPenc1,
		 A(1) => GS_PPenc2,
		 
		 Y 	=> Y_PPenc3,
		 GS 	=> GS_PPenc3
	);
	
	Mux2x1: mux_2x1_penc
	port map(
		A		=> Y_PPenc1,
		B		=>	Y_PPenc2,
		
		selector	=> Y_PPenc3,
		result	=> out_mux2x1
	);

-- Saídas do Penc
	
	Y(0)	<= out_mux2x1;
	Y(1)	<= Y_PPenc3;
	
	GS 	<= GS_PPenc3;

end structural;
