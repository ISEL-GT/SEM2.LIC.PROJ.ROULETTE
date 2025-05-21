library ieee;
USE ieee.std_logic_1164.all;

entity LCD_Dispatcher is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        Dval  : in std_logic;
        Din   : in std_logic_vector(4 downto 0);

        Wrl   : out std_logic;
        Dout  : out std_logic_vector(4 downto 0);
        done  : out std_logic
    );
end LCD_Dispatcher;

architecture structural of LCD_Dispatcher is

    -- Componente do controlador
    component LCDDispatcherControl is
        port (
            clk       : in std_logic;
            reset     : in std_logic;
            Dval      : in std_logic;
            Count     : in std_logic_vector(3 downto 0);

            Wrl       : out std_logic;
            en_count  : out std_logic;
            done      : out std_logic
        );
    end component;

    -- Componente do contador
    component counter_4bits_dispatcher is
        port (
            CE     : in std_logic;
            CLK    : in std_logic;
            reset  : in std_logic;

            count  : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Sinais internos
    signal sig_en_count : std_logic;
    signal sig_count    : std_logic_vector(3 downto 0);

begin

    -- Instanciação do controlador
    control_unit: LCDDispatcherControl
        port map (
            clk       => clk,
            reset     => reset,
            Dval      => Dval,
            Count     => sig_count,
            en_count  => sig_en_count,
            Wrl       => Wrl,
            done      => done
        );

    -- Instanciação do contador
    counter_unit: counter_4bits_dispatcher
        port map (
            CLK     => clk,
            CE      => sig_en_count,
            reset   => reset,
            count   => sig_count
        );

    -- Ligação direta de dados
    Dout <= Din;
	 
end structural;