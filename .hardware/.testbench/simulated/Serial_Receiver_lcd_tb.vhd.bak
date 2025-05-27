library ieee;
use ieee.std_logic_1164.all;

entity Serial_Receiver_tb is
end Serial_Receiver_tb;

architecture behavioral of Serial_Receiver_tb is

    component serial_receiver is
        port (
            SS      : in std_logic;
            SCLK    : in std_logic;
            SDX     : in std_logic;
            Reset   : in std_logic;    
            accept  : in std_logic;
				MClk 	  : in std_logic;
								
            DXval   : out std_logic;
            Data    : out std_logic_vector(4 downto 0)            
        );    
    end component;
    
    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    signal SS_tb      : std_logic;
    signal SCLK_tb    : std_logic;
    signal SDX_tb     : std_logic;
    signal Reset_tb   : std_logic;
    signal accept_tb  : std_logic;
    signal DXval_tb   : std_logic;
    signal Data_tb    : std_logic_vector(4 downto 0);
	 signal CLK_tb		 : std_logic;
	 

begin

    -- DUT instantiation
    UUT: serial_receiver
        port map (
            SS     => SS_tb,
            SCLK   => SCLK_tb,
            SDX    => SDX_tb,
            Reset  => Reset_tb,
            accept => accept_tb,
            DXval  => DXval_tb,
            Data   => Data_tb,
				MClk   => CLK_tb
        );

    -- Clock generation for SCLK
    clk_gen: process
    begin
        while true loop
            CLK_tb <= '0';
            wait for half_clk_period;
            CLK_tb <= '1';
            wait for half_clk_period;
        end loop;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Inicialização
        Reset_tb <= '1';
        SS_tb    <= '1';
        SDX_tb   <= '0';
        accept_tb <= '0';
		  SCLK_tb	<= '0';
        wait for clk_period;

        -- Tirar do reset
        Reset_tb <= '0';
        wait for clk_period;

        -- Ativar SS (início da receção)
        SS_tb <= '0';

        -- Enviar bits de dados (5 bits, por ex: 10101)
        -- Bit 4 (MSB)
        SDX_tb 	<= '1';  wait for clk_period;
		  accept_tb <= '1'; 	wait for clk_period;
		  SCLK_tb	<= '1';	wait for clk_period;
		  accept_tb <= '0'; 	wait for clk_period;
		  SCLK_tb	<= '0';	wait for clk_period;
		  
        -- Bit 3
        SDX_tb 	<= '0'; wait for clk_period;
		  accept_tb <= '1'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  accept_tb <= '0'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
        -- Bit 2
        SDX_tb 	<= '1'; wait for clk_period;
		  accept_tb <= '1'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  accept_tb <= '0'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
        -- Bit 1
        SDX_tb 	<= '0'; wait for clk_period;
		  accept_tb <= '1'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  accept_tb <= '0'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
        -- Bit 0 (LSB)
        SDX_tb 	<= '1'; wait for clk_period;
		  accept_tb <= '1'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  accept_tb <= '0'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;

        -- Desativar SS (fim de transmissão)
        SS_tb 		<= '1';
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
        wait for clk_period;
		  
        -- Parar simulação
        wait;
    end process;

end behavioral;
