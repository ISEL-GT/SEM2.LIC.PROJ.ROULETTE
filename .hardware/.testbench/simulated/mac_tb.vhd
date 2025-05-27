library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mac_tb is
end mac_tb;

architecture test of mac_tb is

    -- Component Under Test
    component mac
        port (
            CLK     : in std_logic;
            reset   : in std_logic;
            putget  : in std_logic;
            incput  : in std_logic;
            incget  : in std_logic;
            full    : out std_logic;
            empty   : out std_logic;
            output  : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Signals for test
    signal CLK     : std_logic := '0';
    signal reset   : std_logic := '1';
    signal putget  : std_logic := '0';
    signal incput  : std_logic := '0';
    signal incget  : std_logic := '0';
    signal full    : std_logic;
    signal empty   : std_logic;
    signal output  : std_logic_vector(3 downto 0);

    -- Clock period
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate DUT
    uut: mac
        port map (
            CLK     => CLK,
            reset   => reset,
            putget  => putget,
            incput  => incput,
            incget  => incget,
            full    => full,
            empty   => empty,
            output  => output
        );

    -- Clock process
    clk_process : process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc : process
    begin
        -- Initial reset
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;
		 
        -- Simulate putting data
		  putget <= '1';
        for i in 0 to 15 loop
            incput <= '1';
            wait for CLK_PERIOD;
            incput <= '0';
            wait for CLK_PERIOD;
        end loop;

        -- Check full condition
        wait for 20 ns;

        -- Switch to getting data
        putget <= '0'; -- select get counter for output
        for i in 0 to 15 loop
            incget <= '1';
            wait for CLK_PERIOD;
            incget <= '0';
            wait for CLK_PERIOD;
        end loop;

        -- Final wait
        wait for 50 ns;
        wait;
    end process;

end test;
