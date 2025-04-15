LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity receiver_controler is
    port (
        not_enRx : in std_logic;
        accept   : in std_logic;
        pFlag    : in std_logic;
        dFlag    : in std_logic;
        RXerror  : in std_logic;
        
        CLK      : in std_logic;
        Reset    : in std_logic;        
        
        wr       : out std_logic;
        init     : out std_logic;
        DXval    : out std_logic
    );
end receiver_controler;

architecture behavioral of receiver_controler is

    type STATE_TYPE is (State1, State2, State3, State4, State5, State6);
    signal CurrentState, NextState: STATE_TYPE;

begin

    -- Flip-Flop: update current state on rising edge of CLK or on reset
    state_register : process(CLK, Reset)
    begin
        if Reset = '1' then
            CurrentState <= State1;
        elsif rising_edge(CLK) then
            CurrentState <= NextState;
        end if;
    end process;

    -- Next State Logic
    GenerateNextState: process(CurrentState, not_enRx, accept, pFlag, dFlag, RXerror)
    begin
        case CurrentState is
            when State1 =>
                if not_enRx = '0' then
                    NextState <= State2;
                else
                    NextState <= State1;
                end if;

            when State2 =>
                if not_enRx = '1' then
                    NextState <= State1;
                elsif dFlag = '1' then
                    NextState <= State3;
                else
                    NextState <= State2;
                end if;

            when State3 =>
                if not_enRx = '1' then
                    NextState <= State1;
                elsif pFlag = '1' then
                    NextState <= State4;
                else
                    NextState <= State3;
                end if;

            when State4 =>
                if not_enRx = '1' then
                    NextState <= State1;
                elsif RXerror = '1' then
                    NextState <= State1;
                else
                    NextState <= State5;
                end if;

            when State5 =>
                if not_enRx = '1' then
                    NextState <= State1;
                elsif accept = '1' then
                    NextState <= State6;
                else
                    NextState <= State5;
                end if;

            when State6 =>
                if not_enRx = '1' or accept = '0' then
                    NextState <= State1;
                else
                    NextState <= State6;
                end if;
        end case;
    end process;

    -- Output Logic
    wr    <= '1' when CurrentState = State2 else '0';
    init  <= '1' when CurrentState = State1 else '0';
    DXval <= '1' when CurrentState = State5 else '0';

end behavioral;
