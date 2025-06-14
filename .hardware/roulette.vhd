library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity roulette is
    Port (
        clk       : in  std_logic;
        reset     : in  std_logic;
        Coin      : in  std_logic;
        Coin_id   : in  std_logic;
        Lines     : in  std_logic_vector(3 downto 0);
		  M 		   : in  std_logic;
        
        KEY_COL   : out std_logic_vector(3 downto 0);
        LCD_DATA  : out std_logic_vector(7 downto 4);
        LCD_RS    : out std_logic;
        LCD_EN    : out std_logic;
		  accept    : out std_logic;
        HEX0, HEX1,
        HEX2, HEX3,
        HEX4, HEX5 : out std_logic_vector(7 downto 0)
    );
end roulette;

architecture Structural of roulette is

    -- Declaração dos componentes

    component keyboard_reader
        Port (
            lines       : in  std_logic_vector(3 downto 0);
            CLK         : in  std_logic;
            Reset       : in  std_logic;
            ack_control : in  std_logic;
				
            columns     : out std_logic_vector(3 downto 0);
            output      : out std_logic_vector(3 downto 0);
            Dval        : out std_logic
        );
    end component;

    component UsbPort
        Port (
            inputPort  : in  std_logic_vector(7 downto 0);
            outputPort : out std_logic_vector(7 downto 0)
        );
    end component;

    component SRC
        Port (
            RouSel : in  std_logic;
            SCLK   : in  std_logic;
            SDX    : in  std_logic;
            MClk   : in  std_logic;
            Reset  : in  std_logic;
								
            Wrl    : out std_logic;
            Dout   : out std_logic_vector(7 downto 0)
        );
    end component;

    component SLCDC
        Port (
            LCDSel : in  std_logic;
            SCLK   : in  std_logic;
            SDX    : in  std_logic;
            MClk   : in  std_logic;
            Reset  : in  std_logic;
				
            Wrl    : out std_logic;
            Dout   : out std_logic_vector(4 downto 0)
        );
    end component;

    component rouletteDisplay
        Port (
            set	: in std_logic;
				cmd	: in std_logic_vector(2 downto 0);
				data	: in std_logic_vector(4 downto 0);
				
				HEX0	: out std_logic_vector(7 downto 0);
				HEX1	: out std_logic_vector(7 downto 0);
				HEX2	: out std_logic_vector(7 downto 0);
				HEX3	: out std_logic_vector(7 downto 0);
				HEX4	: out std_logic_vector(7 downto 0);
				HEX5	: out std_logic_vector(7 downto 0)
        );
    end component;
     
    -- Sinais internos
    signal sig_Q         : std_logic_vector(3 downto 0);
    signal sig_Dval      : std_logic;
    signal ACK       	 : std_logic;

    signal sig_inputPort  : std_logic_vector(7 downto 0);
    signal sig_outputPort : std_logic_vector(7 downto 0);

    signal Dout_SRC  	 : std_logic_vector(7 downto 0);
    signal sig_WRD       : std_logic;

    signal Dout_LCD  	 : std_logic_vector(4 downto 0);
    signal sig_WRL       : std_logic;

    signal sig_cmd       : std_logic_vector(2 downto 0);
    signal sig_data      : std_logic_vector(4 downto 0);
    signal sig_set       : std_logic;

	 signal internal_SDX    : std_logic;
    signal internal_LCDSel : std_logic;
    signal internal_RouSel : std_logic;
    signal internal_SCLK   : std_logic;
begin

    -- Instância do teclado
    U5: keyboard_reader
        port map (
            lines       => Lines,
            CLK         => clk,
            Reset       => reset,
            ack_control => ACK,
            columns     => KEY_COL,
            output      => sig_Q,
            Dval        => sig_Dval
        );

    -- Instância da USBPort
    U1: UsbPort
        port map (
            inputPort  => sig_inputPort,
            outputPort => sig_outputPort
        );

    -- Instância do receptor serial
    U2: SRC
        port map (
            RouSel => internal_RouSel,
            SCLK   => internal_SCLK,
            SDX    => internal_SDX,
            MClk   => clk,
            Reset  => reset,
            Wrl    => sig_WRD,
            Dout   => Dout_SRC
        );

    -- Instância do SLCDC
    U4: SLCDC
        port map (
            LCDSel => internal_LCDSel,
            SCLK   => internal_SCLK,
            SDX    => internal_SDX,
            MClk   => clk,
            Reset  => reset,
            Wrl    => sig_WRL,
            Dout   => Dout_LCD
        );
		  
	 sig_cmd(0) <= Dout_SRC(0);
	 sig_cmd(1) <= Dout_SRC(1);
	 sig_cmd(2) <= Dout_SRC(2);
	 
	 sig_data(0)  <= Dout_SRC(3);
	 sig_data(1)  <= Dout_SRC(4);
	 sig_data(2)  <= Dout_SRC(5);
	 sig_data(3)  <= Dout_SRC(6);
	 sig_data(4)  <= Dout_SRC(7);
	 sig_set   	  <= sig_WRD;


    -- Instância do display da roleta
    U3: rouletteDisplay
        port map (
            cmd   => sig_cmd,
            data  => sig_data,
            set   => sig_set,
				
            HEX0  => HEX0,
            HEX1  => HEX1,
            HEX2  => HEX2,
            HEX3  => HEX3,
            HEX4  => HEX4,
            HEX5  => HEX5
        );

    -- Atribuições internas
    sig_inputPort(0)           <= sig_Dval;
    sig_inputPort(4 downto 1)  <= sig_Q;
	 sig_inputPort(5)				 <= Coin_id;
	 sig_inputPort(6)				 <= Coin;
	 sig_inputPort(7)		       <= M;
	 
	 internal_SDX    <= sig_outputPort(1);
	 accept			  <= sig_outputPort(2);
    ACK             <= sig_outputPort(4);
    internal_LCDSel <= sig_outputPort(5);
    internal_RouSel <= sig_outputPort(6);
    internal_SCLK   <= sig_outputPort(7);
	 
    LCD_DATA <= Dout_LCD(4 downto 1);
	 LCD_RS   <= Dout_LCD(0); 
    LCD_EN   <= sig_WRL;

end Structural;
