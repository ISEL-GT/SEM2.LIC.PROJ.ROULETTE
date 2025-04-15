LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entity declaration for D Flip-Flop with enable, reset, and set functionalities
ENTITY FFD IS
    PORT (
        CLK   : IN  std_logic;   -- Clock input
        RESET : IN  std_logic;   -- Asynchronous reset input (active high)
        SET   : IN  std_logic;   -- Asynchronous set input (active high)
        D     : IN  std_logic;   -- Data input
        EN    : IN  std_logic;   -- Enable input (active high)
        Q     : OUT std_logic    -- Data output
    );
END FFD;

-- Architecture describing the behavior of the Flip-Flop
ARCHITECTURE logicFunction OF FFD IS
BEGIN

    -- Conditional signal assignment with priority: RESET > SET > ENABLE
    Q <= '0' WHEN RESET = '1' ELSE       -- Priority 1: Reset is active, set Q to '0'
         '1' WHEN SET = '1' ELSE         -- Priority 2: Set is active, set Q to '1'
          D  WHEN rising_edge(CLK) AND EN = '1';  -- Priority 3: Enable is active, update Q with D on rising edge of CLK

END logicFunction;
