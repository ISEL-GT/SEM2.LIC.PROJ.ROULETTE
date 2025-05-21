library ieee;
use ieee.std_logic_1164.all;

entity register_5bits is

    port (
        CLK   : in std_logic;
        RESET : in std_logic;
        SET   : in std_logic;
        D     : in std_logic_vector(4 downto 0);
        EN    : in std_logic;
        Q     : out std_logic_vector(4 downto 0)
    );

end register_5bits;


architecture behavioral of register_5bits is

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
				
		FFD4: FFD
		  port map (
				CLK   => CLK,
				RESET => RESET,
				SET   => '0',
				EN    => EN,
				D     => D(3),
				Q     => Q(3)
		  );
		  
		FFD5: FFD
		  port map (
				CLK   => CLK,
				RESET => RESET,
				SET   => '0',
				EN    => EN,
				D     => D(4),
				Q     => Q(4)
		  );

end behavioral;
