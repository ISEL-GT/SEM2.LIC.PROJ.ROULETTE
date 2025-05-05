LIBRARY ieee;
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
            clk   : in std_logic;
            reset : in std_logic;
            Dval  : in std_logic;
            Wrl   : out std_logic;
            done  : out std_logic
        );
    end component;

begin

    -- Instanciação do controlador
    control_unit: LCDDispatcherControl
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
