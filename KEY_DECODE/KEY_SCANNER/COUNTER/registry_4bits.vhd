library ieee;
use ieee.std_logic_1164.all;

-- This entity defines a register with three flip-flops (FFD)
-- It takes in a 4-bit data input and produces a 4-bit output
-- The flip-flops are enabled by the EN signal and reset/set by the RESET and SET signals
entity registry_4bits is

    port (
        CLK   : in std_logic;
        RESET : in std_logic;
        SET   : in std_logic;
        D     : in std_logic_vector(2 downto 0);
        EN    : in std_logic;
        Q     : out std_logic_vector(2 downto 0)
    );

end registry_4bits;


architecture behavioral of registry_3bits is

    -- Declare the component for the flip-flop (FFD)
    component FFD is

        port (
            CLK    : in std_logic;
            RESET  : in std_logic;
            SET    : in std_logic;
            D      : in std_logic;
            EN     : in std_logic;
            Q      : out std_logic
        );

    end component;
    
begin

    -- Instantiate the flip-flops (FFD) for each bit of the data input
    FFD1: FFD
        port map (
            CLK   => CLK,
            RESET => RESET,
            SET   => '0',
            EN    => EN,
            D     => D(0),
            Q     => Q(0)
        );

    FFD2: FFD
        port map (
            CLK   => CLK,
            RESET => RESET,
            SET   => '0',
            EN    => EN,
            D     => D(1),
            Q     => Q(1)
        );

    FFD3: FFD
        port map (
            CLK   => CLK,
            RESET => RESET,
            SET   => '0',
            EN    => EN,
            D     => D(2),
            Q     => Q(2)
        );
		  
	FFD3: FFD
        port map (
            CLK   => CLK,
            RESET => RESET,
            SET   => '0',
            EN    => EN,
            D     => D(3),
            Q     => Q(3)
        );
    
end behavioral;
