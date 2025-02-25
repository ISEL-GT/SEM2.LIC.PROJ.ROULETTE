	LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity KeyDecode is
	port(
		Kack: in std_logic;
		Kval: out std_logic;
		KDecode : out std_logic_vector(3 downto 0);
		Lines : in std_logic_vector(3 downto 0);
		Cols : out std_logic_vector(2 downto 0);
		Clk : in std_logic;
		Reset : in std_logic
);	
end KeyDecode;	
architecture structural of KeyDecode is
component KeyScan is
	port(
		Kscan : in std_logic;
		Kpress : out std_logic;
		K : out std_logic_vector(3 downto 0);	
		Lines : in std_logic_vector(3 downto 0);
		Cols : out std_logic_vector(2 downto 0);
		Osc : in std_logic;  
		Reset : in std_logic		
);
end component;
component KeyControl is
	port(
		Kack : in std_logic;
		Kpress : in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		Kval: out std_logic;
		Kscan: out std_logic
);	
end component;	
component ClkDiv is
generic(div: natural := 1000000);	
	port(
		clk_in: in std_logic;
		clk_out: out std_logic
);
end component;
signal SKscan : std_logic;
signal SKpress : std_logic;
signal Clock: std_logic;

begin
Clocke : ClkDiv generic map (1000000) port map (clk_in => Clk, clk_out => Clock);
Scan :  KeyScan port map (Kscan => SKscan , K => KDecode, Kpress => SKpress , Lines => Lines, Cols => Cols , Osc => Clock, Reset => Reset);
Control : KeyControl port map (Kack => Kack,Kpress => SKpress,clk=>Clk ,rst => Reset ,Kval => Kval  ,Kscan => SKscan);

end structural;