LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity BufferControl is 
	port( 
		clk : in std_logic;
		reset : in std_logic;
		load : in std_logic;
		ACK : in std_logic;
		Dval : out std_logic;
		OBfree : out std_logic;
		Wreg : out std_logic
);
end BufferControl; 
architecture behavioral of BufferControl is
type STATE_TYPE is (Available, Sending, Confirming, Checking, Empty);

signal currentState, NextState: STATE_TYPE;

begin	

currentState <= Available when reset = '1' else NextState when rising_edge(clk);

GenerateNextState:
process (CurrentState, load, ACK)
	begin 	
		case CurrentState is
			when Available => if (load = '1') then 
										 NextState <= Sending;
								   else 		 
										 NextState <= Available;
								   end if;
			when Sending => NextState <= Confirming;
			
			when Confirming => if (load = '1') then
										 NextState <= Confirming;
									 else 
										 NextState <= Checking;
									 end if;
			when Checking => if (ACK = '1') then
										 NextState <= Empty;
								  else 
										 NextState <= Checking;
								  end if;
		   when Empty => if (ACK = '0') then
									NextState <= Available;
							  else 
									NextState <= Empty;
							  end if;		
	end case;
end process;

OBfree <= '1' when (CurrentState = Available) else '0';
Wreg <= '1' when (CurrentState = Sending) else '0';
Dval <= '1' when (CurrentState = Checking) else '0';

 
end behavioral;	
		