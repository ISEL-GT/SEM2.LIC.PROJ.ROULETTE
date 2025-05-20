library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mac_tb is
end mac_tb;

architecture behavior of mac_tb is

    -- Component declaration for Unit Under Test (UUT)
    component mac
        port (
            CLK     : in std_logic;
            reset   : in std_logic;
            putget  : in std_logic;
            incput  : in std_logic;
            incget  : in std_logic;
            full    : out std_logic;
            empty   : out std_logic;
            output  : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Testbench signals
    signal CLK     : std_logic := '0';
    signal reset   : std_logic := '0';
    signal putget  : std_logic := '0';
    signal incput  : std_logic := '0';
    signal incget  : std_logic := '0';
    signal full    : std_logic;
    signal empty   : std_logic;
    signal output  : std_logic_vector(4 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
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

    -- Clock generation
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
    stim_proc: process
    begin
        -- Reset
        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';
        wait for CLK_PERIOD * 2;

        -- Increment PUT register 16 times (00000 to 10000)
        incput <= '1';
        wait for CLK_PERIOD * 16;
        incput <= '0';

        -- Increment GET register 16 times
        incget <= '1';
        wait for CLK_PERIOD * 16;
        incget <= '0';

        -- Check output with putget = 1 (PUT output)
        putget <= '1';
        wait for CLK_PERIOD * 2;

        -- Check output with putget = 0 (GET output)
        putget <= '0';
        wait for CLK_PERIOD * 2;

        -- Final check for full and empty flags
        wait for CLK_PERIOD;

        -- Finish simulation
        wait;
    end process;

end behavior;
