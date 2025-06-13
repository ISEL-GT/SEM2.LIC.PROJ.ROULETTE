library IEEE;
use IEEE.std_logic_1164.all;

entity Ring_Buffer_Control is
    port (
        RESET, CLK : in std_logic;

        -- Entradas da Máquina
        DAV, CTS, full, empty : in std_logic;

        -- Saídas da Máquina    
        Wr, selPG, incPut, incGet, Wreg, DAC : out std_logic
    );
end Ring_Buffer_Control;

architecture Behavioral of Ring_Buffer_Control is

    -- Estados da máquina
    type STATE_TYPE is (
        START,
        Reading,
        Writing,
        Data_Accepted,
        Put,
        Get,
        IncrementPut
    );

    signal CurrentState, NextState : STATE_TYPE;

begin

    -- Flip-Flop's
    process (CLK, RESET)
    begin
        if RESET = '1' then
            CurrentState <= START;
        elsif rising_edge(CLK) then
            CurrentState <= NextState;
        end if;
    end process;

    -- Gerar próximo estado
    process (CurrentState, DAV, CTS, full, empty)
    begin
        case CurrentState is

            when START =>
                if (DAV = '0' and empty = '0' and CTS = '1') then
                    NextState <= Reading;
                elsif (DAV = '1' and full = '0') then 
                    NextState <= Put;
                elsif (DAV = '1' and full = '1' and CTS = '1') then  
                    NextState <= Reading;
                else    
                    NextState <= START;
                end if;

            when Reading =>
                if (CTS = '0') then
                    NextState <= Get;
                else
                    NextState <= Reading;
                end if;

            when Get =>
                NextState <= START;

            when Put =>
                NextState <= Writing;

            when Writing =>
                NextState <= IncrementPut;

            when IncrementPut =>
                NextState <= Data_Accepted;

            when Data_Accepted =>
                if (DAV = '0') then
                    NextState <= START;
                else
                    NextState <= Data_Accepted;
                end if;

        end case;
    end process;

    -- Geração das saídas
    Wr      <= '1' when (CurrentState = Writing) else '0';

    selPG   <= '1' when (
                    CurrentState = Put or
                    CurrentState = Writing or
                    CurrentState = IncrementPut 
                ) else '0';

    DAC     <= '1' when (CurrentState = Data_Accepted) else '0';
    incPut  <= '1' when (CurrentState = IncrementPut) else '0';
    Wreg    <= '1' when (CurrentState = Reading) else '0';
    incGet  <= '1' when (CurrentState = Get) else '0';

end Behavioral;
