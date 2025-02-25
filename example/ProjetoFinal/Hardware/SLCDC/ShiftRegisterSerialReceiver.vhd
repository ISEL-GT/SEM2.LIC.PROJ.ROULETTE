LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity ShiftRegisterSerialReceiver is
	port(
		reset : in std_logic;
		data: in std_logic;
		SCLK: in std_logic;
		E: in std_logic;
		D: out std_logic_vector(8 downto 0)
	);
end ShiftRegisterSerialReceiver;
architecture structural of ShiftRegisterSerialReceiver is
component FFD IS
	PORT(	
		CLK : in std_logic;
		RESET : in STD_LOGIC;
		SET : in std_logic;
		D : IN STD_LOGIC;
		EN : IN STD_LOGIC;
		Q : out std_logic
		);
end component;

signal saidaFFD1: std_logic;
signal saidaFFD2: std_logic;
signal saidaFFD3: std_logic;
signal saidaFFD4: std_logic;
signal saidaFFD5: std_logic;
signal saidaFFD6: std_logic;
signal saidaFFD7: std_logic;
signal saidaFFD8: std_logic;
signal saidaFFD9: std_logic;

begin

FFD1: FFD port map(CLK=>SCLK,RESET=> '0' ,SET=> '0',D=>data ,EN=>E ,Q=>saidaFFD1);
FFD2: FFD port map(CLK=>SCLK,RESET=> '0' ,SET=> '0',D=>saidaFFD1,EN=>E,Q=>saidaFFD2);
FFD3: FFD port map(CLK=>SCLK,RESET=> '0' ,SET=> '0',D=>saidaFFD2,EN=>E,Q=>saidaFFD3);
FFD4: FFD port map(CLK=>SCLK,RESET=> '0' ,SET=> '0',D=>saidaFFD3,EN=>E,Q=>saidaFFD4);
FFD5: FFD port map(CLK=>SCLK,RESET=> '0' ,SET=> '0',D=>saidaFFD4,EN=>E,Q=>saidaFFD5);
FFD6: FFD port map(CLK=>SCLK,RESET=> '0' ,SET=> '0',D=>saidaFFD5,EN=>E,Q=>saidaFFD6);
FFD7: FFD port map(CLK=>SCLK,RESET=> '0' ,SET=> '0',D=>saidaFFD6,EN=>E,Q=>saidaFFD7);
FFD8: FFD port map(CLK=>SCLK,RESET=> '0' ,SET=> '0',D=>saidaFFD7,EN=>E,Q=>saidaFFD8);
FFD9: FFD port map(CLK=>SCLK,RESET=> '0' ,SET=> '0',D=>saidaFFD8,EN=>E,Q=>saidaFFD9);

D(8)<= saidaFFD1;	
D(7)<= saidaFFD2;
D(6)<= saidaFFD3;
D(5)<= saidaFFD4;
D(4)<= saidaFFD5;
D(3)<= saidaFFD6;
D(2)<= saidaFFD7;
D(1)<= saidaFFD8;
D(0)<= saidaFFD9;

end structural;

