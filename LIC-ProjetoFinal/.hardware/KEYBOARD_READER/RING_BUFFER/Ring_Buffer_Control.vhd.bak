LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Ring_Buffer_Control is
	
	port(
		DAV:in std_logic;
		CTS:in std_logic;
		full:in std_logic;
		empty:in std_logic;
		MCLK:in std_logic;
		RESET:in std_logic;	
		
		Wr:out std_logic;
		selPG:out std_logic;
		incPut:out std_logic;
		incGet:out std_logic;
		Wreg:out std_logic;
		DAC:out std_logic
	);
end Ring_Buffer_Control;

architecture behavorial of Ring_Buffer_Control is

type STATE_TYPE is (Iswaiting, CanBeStored, Writing, WriteCompleted, Reading);
						
signal CurrentState, NextState: STATE_TYPE;

begin

--Flip Flop's
CurrentState <= Iswaiting when RESET = '1' else NextState when rising_edge(Mclk);

Generatenextstate:

process (CurrentState, DAV, full, CTS, empty)
	begin
		case CurrentState is
		
			when Iswaiting => 	if (DAV = '1' and full = '0') then 
												NextState <= CanBeStored;
												
										elsif (CTS = '1' and empty = '0') then 
												NextState <= Reading;
										else 
												NextState <= Iswaiting;
										end if;
										
			when CanBeStored => NextState <= Writing;
			
			when Writing => NextState <= WriteCompleted;
			
			when WriteCompleted => if (DAV = '1') then 
												NextState <= WriteCompleted;
												
										  else 
												NextState <= Iswaiting;
										  end if;
										  
			when Reading => 		if (CTS = '0') then 
												NextState <= Iswaiting;
										else 
												NextState <= Reading;
										end if;
		end case; 	
end process;

wr 		<= 	'1' when (CurrentState = Writing) else'0';
selPG 	<= 	'1' when (CurrentState = CanBeStored or CurrentState = Writing) else '0';
incPut 	<= 	'1' when (CurrentState = Writing) else '0';
incGet 	<= 	'1' when (CurrentState = Reading and CTS = '0') else'0';
Wreg 		<= 	'1' when (CurrentState = Reading) else'0';
DAC 		<= 	'1' when (CurrentState = WriteCompleted) else'0';

end behavorial;			
     								 
								 
								 