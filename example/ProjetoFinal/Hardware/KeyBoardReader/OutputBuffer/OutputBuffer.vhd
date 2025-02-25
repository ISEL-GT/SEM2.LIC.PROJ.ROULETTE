LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity OutputBuffer is
	port(
		clk : in std_logic;
		reset : in std_logic;
		D : in std_logic_vector(3 downto 0);
		load : in std_logic;
		ACK : in std_logic;
		Q : out std_logic_vector(3 downto 0);
		OBfree : out std_logic;
		Dval : out std_logic
);		
end OutputBuffer;
architecture structural of OutputBuffer is
component OutputRegister is
	port(
		D : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		reset : in std_logic;
		Q : out std_logic_vector(3 downto 0)
);		
end component;
component BufferControl is
	port( 
		clk : in std_logic;
		reset : in std_logic;
		load : in std_logic;
		ACK : in std_logic;
		Dval : out std_logic;
		OBfree : out std_logic;
		Wreg : out std_logic 
);		
end component;		

signal Wreg_exit : std_logic;

begin

outR: OutputRegister port map (D => D, clk => Wreg_exit, reset => reset, Q => Q);
BC : BufferControl port map (clk => clk, reset => reset, load => load, ACK => ACK, Dval => Dval, OBfree => OBfree, Wreg => Wreg_exit);

end structural;
