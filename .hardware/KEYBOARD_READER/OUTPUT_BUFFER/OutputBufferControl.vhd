library ieee;
use ieee.std_logic_1164.all;

entity OutputBufferControl is
	port (
		reset   : in  std_logic;
		clk     : in  std_logic;
		Load    : in  std_logic;
		ACK     : in  std_logic;

		Wreg    : out std_logic;
		OBfree  : out std_logic;
		Dval    : out std_logic
	);
end OutputBufferControl;

architecture behavioral of OutputBufferControl is

	type STATE_TYPE is (State_Idle, State_Load, State_WaitAck, State_Clear);
	signal CurrentState, NextState : STATE_TYPE;

begin

	-- Flip-Flops
	CurrentState <= State_Idle when reset = '1' else NextState when rising_edge(clk);

	-- Generate Next State
	GenerateNextState:
	process (CurrentState, Load, ACK)
	begin
		case CurrentState is
		
			when State_Idle =>
				if Load = '1' then
					NextState <= State_Load;
				else
					NextState <= State_Idle;
				end if;

			when State_Load =>
				if Load = '1' then 
					NextState <= State_Load;
				else
				NextState <= State_WaitAck;
				end if;
				
			when State_WaitAck =>
				if ACK = '1' then
					NextState <= State_Clear;
				else
					NextState <= State_WaitAck;
				end if;

			when State_Clear => 
				if ACK = '0' THEN 
				NextState <= State_Idle;
								else
				NextState <= State_clear;
				end if;

		end case;
	end process;

	-- Generate outputs
	Wreg   <= '1' when (CurrentState = State_Load) else '0';
	Dval   <= '1' when (CurrentState = State_Load or CurrentState = State_WaitAck) else '0';
	OBfree <= '1' when (CurrentState = State_Idle or CurrentState = State_Clear) else '0';

end behavioral;
