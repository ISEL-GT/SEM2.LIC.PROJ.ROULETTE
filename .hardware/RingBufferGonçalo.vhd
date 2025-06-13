LIBRARY ieee;
USE ieee.std_logic_1164.all; 

entity ringControl is 
    port ( 
        reset: in std_logic;
        clk: in std_logic;
        DAV: in std_logic;
        CTS: in std_logic;
        full: in std_logic;
        empty: in std_logic;
        Wr: out std_logic;
        selPG: out std_logic;
        incPut: out std_logic;
        incGet: out std_logic;
        Wreg: out std_logic;
        DAC: out std_logic
    );
end ringControl;

architecture logic of ringControl is 

    type STATE_type is ( 
        STATE_IDLE, STATE_READ, STATE_INCGET, 
        STATE_PUT, STATE_WRITE, STATE_INCPUT,
        STATE_DAC
    );

    signal currentState, nextState : STATE_type;

begin 

    process(clk, reset)
    begin
        if reset = '1' then
            currentState <= STATE_IDLE;
        elsif rising_edge(clk) then
            currentState <= nextState;
        end if;
    end process;

    GenerateNextState: process(currentState, DAV, CTS, full, empty)
    begin 
        case currentState is
            when STATE_IDLE =>
                if (DAV = '0' and empty = '0' and CTS = '1') then
                    nextState <= STATE_READ;
                elsif (DAV = '1' and full = '0') then
                    nextState <= STATE_PUT;
                elsif (DAV = '1' and full = '1' and CTS = '1') then
                    nextState <= STATE_READ;
                else
                    nextState <= STATE_IDLE;
                end if;

            when STATE_READ =>
                if (CTS = '0') then
                    nextState <= STATE_INCGET;
                else
                    nextState <= STATE_READ;
                end if;

            when STATE_INCGET =>
                nextState <= STATE_IDLE;

            when STATE_PUT =>
                nextState <= STATE_WRITE;

            when STATE_WRITE =>
                nextState <= STATE_INCPUT;

            when STATE_INCPUT =>
                nextState <= STATE_DAC;

            when STATE_DAC =>
                if (DAV = '0') then
                    nextState <= STATE_IDLE;
                else 
                    nextState <= STATE_DAC;
                end if;
        end case;
    end process;

    -- Output logic
    selPG <= '1' when (currentState = STATE_PUT or currentState = STATE_WRITE or currentState = STATE_INCPUT) else '0';
    Wreg <= '1' when (currentState = STATE_READ) else '0';
    incGet <= '1' when (currentState = STATE_INCGET) else '0';
    Wr <= '1' when (currentState = STATE_WRITE) else '0';
    incPut <= '1' when (currentState = STATE_INCPUT) else '0';
    DAC <= '1' when (currentState = STATE_DAC) else '0';

end logic;