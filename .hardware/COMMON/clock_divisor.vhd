library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;  -- Biblioteca usada para operações com tipos numéricos como integer/unsigned

-- Entidade do divisor de clock
entity clock_divisor is
    generic (
        div : natural := 50000  -- Valor de divisão do clock (por padrão, divide por 50 milhões)
    );
    port (
        clk_in  : in  std_logic;   -- Clock de entrada (rápido)
        clk_out : out std_logic    -- Clock de saída (mais lento)
    );
end clock_divisor;

-- Arquitetura comportamental do divisor de clock
architecture bhv of clock_divisor is

    signal count : integer := 1;     -- Contador para contar os ciclos do clock de entrada
    signal tmp   : std_logic := '0'; -- Sinal temporário que será atribuído à saída do clock dividido

begin

    -- Processo sensível à borda de subida do clock de entrada
    process(clk_in)
    begin
        if (clk_in'event and clk_in = '1') then  -- Verifica se ocorreu uma borda de subida no clk_in
            count <= count + 1;                  -- Incrementa o contador

            if (count = div / 2) then            -- Quando o contador atinge metade do valor de divisão
                tmp   <= NOT tmp;                -- Inverte o valor de tmp (gera uma transição no clk_out)
                count <= 1;                      -- Reinicia o contador
            end if;

        end if;
    end process;

    clk_out <= tmp;  -- Atribuição contínua do sinal temporário à saída do clock dividido

end bhv;
