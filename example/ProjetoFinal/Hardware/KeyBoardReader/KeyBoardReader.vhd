LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity KeyBoardReader is
	port(
		Lines: in std_logic_vector(3 downto 0);
		Mclk: in std_logic;
		Reset: in std_logic;
		ACK: in std_logic;
		Dval: out std_logic;
		QValue: out std_logic_vector(3 downto 0);
		Cols: out std_logic_vector(2 downto 0)
);		
end KeyBoardReader;
architecture structural of KeyBoardReader is
component KeyDecode is
	port(	
		Kack: in std_logic;
		Kval: out std_logic;
		KDecode : out std_logic_vector(3 downto 0);
		Lines : in std_logic_vector(3 downto 0);
		Cols : out std_logic_vector(2 downto 0);
		Clk : in std_logic;
		Reset : in std_logic	
);
end component;
component Ring_Buffer is
	port(
		MCLK: in std_logic;
		RESET: in std_logic;
		D: in std_logic_vector(3 downto 0);
		DAV : in std_logic;
		CTS: in std_logic;
		Wreg: out std_logic;
		DAC: out std_logic;
		Q : out std_logic_vector(3 downto 0)
);
end component;
component OutputBuffer is
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
end component;

signal Kval_exit : std_logic;
signal K_exit : std_logic_vector(3 downto 0);
signal Wreg_exit : std_logic;
signal Q_exit : std_logic_vector(3 downto 0);
signal DAC_exit : std_logic;
signal OBfree_exit : std_logic;
 
begin 

Decode: KeyDecode port map (Kack => DAC_exit, Lines => Lines, Clk => Mclk, Reset => Reset, Kval => Kval_exit, KDecode => K_exit, Cols => Cols);
RB : Ring_Buffer port map (MCLK => Mclk , RESET => reset, D => K_exit, DAV => Kval_exit, CTS => OBfree_exit, Wreg => Wreg_exit, DAC => DAC_exit, Q => Q_exit);
OB : OutputBuffer port map (clk => Mclk , reset => reset, D => Q_exit, load => Wreg_exit, ACK => ACK, Q => QValue, Dval => Dval, OBfree => OBfree_exit);

end structural;	