LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity SerialControl is 
	port( 
		enRx : in std_logic;
		RESET : in std_logic;
		accept : in std_logic;
		pFlag : in std_logic;
		dFlag : in std_logic;
		RXerror : in std_logic;
		clk : in std_logic;
      wr : out std_logic;
		init: out std_logic;
		DXval : out std_logic
);
end SerialControl; 

architecture behavioral of SerialControl is 

type STATE_TYPE is (Intializing, Starting, Waiting, Acepted, ItsDone);

signal currentState, NextState: STATE_TYPE;

begin	

currentState <= Intializing when RESET = '1' else NextState when rising_edge(clk);

GenerateNextState:
process (currentState, enRx, accept, pFlag, RXerror, dFlag)
	begin 
		case currentState is 
			when Intializing	=> if (enRx = '0') then
												NextState <= Starting;
											else
												NextState <= Intializing;
											end if;
											
			when Starting			=> if (enRx = '1') then 
												NextState <= Intializing;
											elsif (dFlag = '1') then 
												NextState <= Waiting ;
											else 
												NextState <= Starting;
											end if;
			
			when Waiting  			=> if (enRx = '1') then 
												NextState <= Intializing;
											elsif(pFlag = '1') then 
												NextState <= Acepted;
											else 
												NextState <= Waiting;
											end if;
											
			when Acepted				=> if(RXerror = '0') then 
												NextState <= ItsDone;
											else
												NextState <= Intializing;
											end if;
											
			when ItsDone			=> if(accept = '1') then 
												NextState <= Intializing;
											else 
												NextState <= ItsDone;
											end if;
											
	end case;
end process;
	
wr <= '1' when(currentState = Starting) else '0';
init <= '1' when(currentState = Intializing) else '0';
DXval <= '1' when (currentState = ItsDone) else '0';

end behavioral;