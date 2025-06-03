library ieee;
use ieee.std_logic_1164.all;

entity SLCDC_tb is
end SLCDC_tb;

architecture behavioral of SLCDC_tb is

    component SLCDC is
        port (
            LCDSel : in std_logic;
            SCLK   : in std_logic;
            SDX    : in std_logic;
            MClk   : in std_logic;
            Reset  : in std_logic;
          
            Wrl    : out std_logic;
            Dout   : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Clock timing constants
    constant clk_period      : time := 10 ns;
    constant half_clk_period : time := clk_period / 2;

    -- Signals for interconnection
    signal LCDSel_tb  : std_logic;
    signal SCLK_tb    : std_logic;
    signal SDX_tb     : std_logic;
    signal MClk_tb    : std_logic;
    signal Reset_tb   : std_logic;
   

    signal Wrl_tb     : std_logic;
    signal Dout_tb    : std_logic_vector(4 downto 0);

begin

    -- Instantiate the DUT
    UUT: SLCDC
        port map (
            LCDSel => LCDSel_tb,
            SCLK   => SCLK_tb,
            SDX    => SDX_tb,
            MClk   => MClk_tb,
            Reset  => Reset_tb,
           
            Wrl    => Wrl_tb,
            Dout   => Dout_tb
        );

    -- Clock generation
    clk_gen: process
    begin
        while true loop
            MClk_tb <= '0';
            wait for half_clk_period;
            MClk_tb <= '1';
            wait for half_clk_period;
        end loop;
    end process;

   -- Stimulus process
    stimulus: process
    begin
        -- Inicialização
        Reset_tb 	<= '1';
        LCDSel_tb <= '1';
        SDX_tb   	<= '0';
   	  SCLK_tb	<= '0';
        wait for clk_period;

        -- Tirar do reset
        Reset_tb <= '0';
        wait for clk_period;

        -- Ativar SS (início da receção)
        LCDSel_tb <= '0';

        -- Enviar bits de dados (5 bits, por ex: 10101)
        -- Bit 0 (LSB)
        SDX_tb 	<= '1';  wait for clk_period;
		  SCLK_tb	<= '1';	wait for clk_period;
		  SCLK_tb	<= '0';	wait for clk_period;
		  
        -- Bit 1
        SDX_tb 	<= '0'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
        -- Bit 2
        SDX_tb 	<= '1'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
        -- Bit 3
        SDX_tb 	<= '0'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
        -- Bit 4 (MSB)
        SDX_tb 	<= '1'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
		  -- Bit P 
        SDX_tb 	<= '1'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;

		  LCDSel_tb <= '1';	  
		  wait for clk_period*10;
		  
		  
		  reset_tb <= '1';
		  wait for clk_period;
		  
		  reset_tb <= '0';
		  wait for clk_period;
		  
		   -- Ativar SS (início da receção)
        LCDSel_tb <= '0';

        -- Enviar bits de dados (5 bits, por ex: 10101)
        -- Bit 0 (LSB)
        SDX_tb 	<= '1';  wait for clk_period;
		  SCLK_tb	<= '1';	wait for clk_period;
		  SCLK_tb	<= '0';	wait for clk_period;
		  
        -- Bit 1
        SDX_tb 	<= '0'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
        -- Bit 2
        SDX_tb 	<= '1'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
        -- Bit 3
        SDX_tb 	<= '0'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
        -- Bit 4 (MSB)
        SDX_tb 	<= '1'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;
		  
		  -- Bit P 
        SDX_tb 	<= '0'; wait for clk_period;
		  SCLK_tb	<= '1'; wait for clk_period;
		  SCLK_tb	<= '0'; wait for clk_period;

		    
		  wait for clk_period*10;
		  
		  
		  LCDSel_tb <= '1';
		 
		  wait for clk_period;
		  
        -- Parar simulação
        wait;
    end process;

end behavioral;