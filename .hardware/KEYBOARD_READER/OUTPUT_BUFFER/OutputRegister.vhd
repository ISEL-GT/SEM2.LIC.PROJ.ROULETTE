library ieee;
use ieee.std_logic_1164.all;

entity OutputRegister is
	port (
		clk   : in  std_logic;
		Wreg  : in  std_logic;
		reset : in  std_logic;
		Din   : in  std_logic_vector(3 downto 0);  
		Dout  : out std_logic_vector(3 downto 0) 
	);
end OutputRegister;

architecture behavioral of OutputRegister is
	signal Reg : std_logic_vector(3 downto 0);
begin

	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				Reg <= "0000";  
			elsif Wreg = '1' then
				Reg <= Din;
			end if;
		end if;
	end process;

	Dout <= Reg;

end behavioral;
