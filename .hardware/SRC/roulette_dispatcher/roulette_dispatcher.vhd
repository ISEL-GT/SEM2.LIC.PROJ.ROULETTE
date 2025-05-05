LIBRARY ieee;
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
            clk   : in std_logic;
            reset : in std_logic;
            Dval  : in std_logic;
            Wrl   : out std_logic;
            done  : out std_logic
        );
    end component;

begin

    -- Instanciação do controlador
    control_unit: rouletteDispatcherControl
        port map (
            clk   => clk,
            reset => reset,
            Dval  => Dval,
            Wrl   => Wrl,
            done  => done
        );

    -- Ligação direta de dados
    Dout <= Din;

end structural;
