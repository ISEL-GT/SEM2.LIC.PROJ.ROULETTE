library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LCDDispatcherControl is
    port(
        clk        : in std_logic;
        reset      : in std_logic;
        Dval       : in std_logic;
        Count      : in std_logic_vector(3 downto 0);

        Wrl        : out std_logic;
        en_count   : out std_logic;
        done       : out std_logic
    );
end LCDDispatcherControl;

architecture behavior of LCDDispatcherControl is

    type STATE_TYPE is (WaitingDval, ReceivingDval, DoneReceived);
    signal currentState, nextState : STATE_TYPE;

begin

    -- Registo de estado (sincrono com reset)
    process(clk, reset)
    begin
        if reset = '1' then
            currentState <= WaitingDval;
        elsif rising_edge(clk) then
            currentState <= nextState;
        end if;
    end process;

    -- Lógica de transição de estados
    process(currentState, Dval, Count)
    begin
        case currentState is
            when WaitingDval =>
                if Dval = '1' then
                    nextState <= ReceivingDval;
                else
                    nextState <= WaitingDval;
                end if;

            when ReceivingDval =>
                -- Condição de fim quando Count = "1101" (13)
                if Count = "1101" then
                    nextState <= DoneReceived;
                else
                    nextState <= ReceivingDval;
                end if;

            when DoneReceived =>
                if Dval = '0' then
                    nextState <= WaitingDval;
                else
                    nextState <= DoneReceived;
                end if;
        end case;
    end process;

    -- Sinais de controlo
    Wrl      <= '1' when currentState = ReceivingDval else '0';
    done     <= '1' when currentState = DoneReceived  else '0';
    en_count <= '1' when currentState = ReceivingDval else '0';

end behavior;
