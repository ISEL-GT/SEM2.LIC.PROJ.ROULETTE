library ieee;
USE ieee.std_logic_1164.all;

entity roulette_dispatcher is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        Dval  : in std_logic;
        Din   : in std_logic_vector(7 downto 0);

        Wrl   : out std_logic;
        Dout  : out std_logic_vector(7 downto 0);
        done  : out std_logic
    );
end roulette_dispatcher;

architecture structural of roulette_dispatcher is

    -- Componente do controlador
    component rouletteDispatcherControl is
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
    component counter_4bits is
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
    control_unit: rouletteDispatcherControl
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
    counter_unit: counter_4bits
        port map (
            CLK     => clk,
            CE      => sig_en_count,
            reset   => reset,
            count   => sig_count
        );

    -- Ligação direta de dados
    Dout <= Din;
	 
end structural;