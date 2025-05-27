LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade da máquina de estados que controla o ficheiro keydecode
entity KeyControl is
    port (
        reset   : in  std_logic;
        clk     : in  std_logic;
        Kpress  : in  std_logic;
        Kack    : in  std_logic;
        KScan   : out std_logic_vector(1 downto 0);
        Kval    : out std_logic
    );
end KeyControl;

architecture behavioral of KeyControl is

    type STATE_TYPE is (
        State_Scan_Columns,
        State_Scan_Lines,
        State_Val,
        State_Ack_Waiting
    );

    signal CurrentState, NextState : STATE_TYPE;

begin

    -- Flip-Flop de estado (transição síncrona com reset assíncrono)
    process(clk, reset)
    begin
        if reset = '1' then
            CurrentState <= State_Scan_Columns;
        elsif rising_edge(clk) then
            CurrentState <= NextState;
        end if;
    end process;

    -- Geração do próximo estado
    process(CurrentState, Kpress, Kack)
    begin
        case CurrentState is

            when State_Scan_Columns =>
                if Kpress = '1' then
                    NextState <= State_Scan_Lines;
                else
                    NextState <= State_Scan_Columns;
                end if;

            when State_Scan_Lines =>
                NextState <= State_Val;

            when State_Val =>
                if (Kack = '1') then
                    NextState <= State_Ack_Waiting;
                else
                    NextState <= State_Val;
                end if;

            when State_Ack_Waiting =>
                if (Kack = '0' and Kpress = '0') then
                    NextState <= State_Scan_Columns;
                else
                    NextState <= State_Ack_Waiting;
                end if;

        end case;
    end process;

    -- Geração de sinais de saída
    KScan(0) <= '1' when (CurrentState = State_Scan_Columns and Kpress = '0') else '0';
    KScan(1) <= '1' when (CurrentState = State_Scan_Lines) else '0';
    Kval     <= '0' when (CurrentState = State_Val) else '1';

end behavioral;
