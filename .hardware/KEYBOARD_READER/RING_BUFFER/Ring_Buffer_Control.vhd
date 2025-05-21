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
        SelectAddress,
        Writing,
        Data_Accepted,
        Data_Written,
        Delivering,
        Data_Delivered
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
                if (DAV = '1' and full = '0') then
                    NextState <= SelectAddress;
                elsif (((DAV = '1' and full = '1') or DAV = '0') and CTS = '1' and empty = '0') then
                    NextState <= Delivering;
                else
                    NextState <= START;
                end if;

            when SelectAddress =>
                NextState <= Writing;

            when Writing =>
                NextState <= Data_Accepted;

            when Data_Accepted =>
                if DAV = '0' then
                    NextState <= Data_Written;
                else
                    NextState <= Data_Accepted;
                end if;

            when Data_Written =>
                NextState <= START;

            when Delivering =>
                if CTS = '0' then
                    NextState <= Data_Delivered;
                else
                    NextState <= Delivering;
                end if;

            when Data_Delivered =>
                NextState <= START;

        end case;
    end process;

    -- Geração das saídas
    Wr      <= '1' when (CurrentState = Writing) else '0';

    selPG   <= '1' when (
                    CurrentState = SelectAddress or
                    CurrentState = Writing or
                    CurrentState = Data_Accepted or
                    CurrentState = Data_Written
                ) else '0';

    DAC     <= '1' when (CurrentState = Data_Accepted) else '0';
    incPut  <= '1' when (CurrentState = Data_Written) else '0';
    Wreg    <= '1' when (CurrentState = Delivering) else '0';
    incGet  <= '1' when (CurrentState = Data_Delivered) else '0';

end Behavioral;
