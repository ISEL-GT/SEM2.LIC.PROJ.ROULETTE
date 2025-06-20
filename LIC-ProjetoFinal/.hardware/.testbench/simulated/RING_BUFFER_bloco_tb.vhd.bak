LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity RING_BUFFER_bloco_tb is
end RING_BUFFER_bloco_tb;

architecture behavioral of RING_BUFFER_bloco_tb is

    
    component RingBuffer
        port (
            D     : in  std_logic_vector(3 downto 0);
            DAV   : in  std_logic;
            CTS   : in  std_logic;
            RESET : in  std_logic;
            MCLK  : in  std_logic;
            Q     : out std_logic_vector(3 downto 0);
            Wreg  : out std_logic;
            DAC   : out std_logic
        );
    end component;
	
	constant clk_period      : time := 10 ns;
	constant half_clk_period : time := clk_period / 2;

    
    signal D_s     : std_logic_vector(3 DOWNTO 0);
    signal DAV_s   : std_logic;
    signal CTS_s   : std_logic;
    signal RESET_s : std_logic;
    signal MCLK_s  : std_logic;
    signal Q_s     : std_logic_vector(3 DOWNTO 0);
    signal Wreg_s  : std_logic;
    signal DAC_s   : std_logic;


begin

    ringBufferpm: RingBuffer port map (
            D     => D_s,
            DAV   => DAV_s,
            CTS   => CTS_s,
            RESET => RESET_s,
            MCLK  => MCLK_s,
            Q     => Q_s,
            Wreg  => Wreg_s,
            DAC   => DAC_s
        );

    
    clk_gen: process
    begin
        while true loop
            MCLK_s 	<= '0';
            wait for half_clk_period;
            MCLK_s  <= '1';
            wait for half_clk_period;
        end loop;
    end process;

    
	stimulus: process
    begin
        D_s     <= "0000";
		DAV_s	<= '0';
		CTS_s   <= '0';
		RESET_s <= '0';
        RESET_s <= '1';
		
        wait for clk_period * 2;
        RESET_s <= '0';
        wait for clk_period * 2;

        -- write 0
		d_s   <= "0000";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 1
		d_s   <= "0001";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 2
		d_s   <= "0010";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 3
		d_s   <= "0011";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 4
		d_s   <= "0100";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 5
		d_s   <= "0101";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 6
		d_s   <= "0110";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 7
		d_s   <= "0111";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 8
		d_s   <= "1000";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 9
		d_s   <= "1001";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 10
		d_s   <= "1010";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 11
		d_s   <= "1011";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 12
		d_s   <= "1100";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 13
		d_s   <= "1101";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 14
		d_s   <= "1110";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		-- write 15
		d_s   <= "1111";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;
		
		
		-- try write when full: dac must stay '0'
		d_s   <= "0000";
		dav_s <= '1';
		wait for clk_period * 2;
		dav_s <= '0';
		wait for clk_period * 2;

		
		wait for clk_period;
		CTS_s <= '1';
		wait for clk_period;
		CTS_s <= '0';


		
		-- read 0
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 1
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 2
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 3
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 4
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 5
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 6
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 7
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 8
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 9
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 10
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 11
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 12
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 13
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 14
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- read 15
		cts_s <= '1';
		wait for clk_period * 2;
		cts_s <= '0';
		wait for clk_period * 2;

		-- tentar ler vazio: wreg deve ficar '0'
		cts_s <= '1';
		wait for clk_period * 2;

		wait;
	  end process;

end behavioral;