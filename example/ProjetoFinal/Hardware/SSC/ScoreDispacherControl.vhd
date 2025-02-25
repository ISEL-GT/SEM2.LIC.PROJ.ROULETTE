LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ScoreDispacherControl is
	port(
		clk : in std_logic;
		reset : in std_logic;
		Dval : in std_logic;
		WrD : out std_logic;
		done : out std_logic
);
end ScoreDispacherControl;
architecture behavior of ScoreDispacherControl is
type STATE_TYPE is (WaitingDval, ReceivingDval, DoneReceived);

signal currentState, NextState: STATE_TYPE;

begin 

currentState <= WaitingDval when reset = '1' else NextState when rising_edge(clk);
	
GenerateNextState:
process(currentState, Dval)
	begin
		case currentState is
				when WaitingDval => if (Dval = '1') then
												NextState <= ReceivingDval;
										  else 
												NextState <= WaitingDval;
										  end if;
				when ReceivingDval => NextState <= DoneReceived;
					
				when DoneReceived => 		  if (Dval = '1') then
											 NextState <= DoneReceived;
										  else 
											 NextState <= WaitingDval;
										  end if;
				end case;
				end process;

WrD <= '1' when (CurrentState = ReceivingDval) 
else '0'; 		

done <= '1' when (CurrentState = DoneReceived) 
else '0';

end behavior; 	