library ieee;
use ieee.std_logic_1164.all;

entity decoder_tb is
end decoder_tb;

architecture behavioral of decoder_tb is

    component decoder_2x4 is
        port (
            S : in std_logic_vector (1 downto 0);
				Y : out std_logic_vector (3 downto 0)
        );
    end component;
    
    signal s_tb 	  : std_logic_vector(1 downto 0);
    signal y_tb     : std_logic_vector(3 downto 0);
    
begin
    
    UUT : decoder_2x4 
        port map (
            S   => s_tb, 
            Y   => y_tb
        );
    
    stimulus: process
    begin
        s_tb    <= "00";
        wait for 20 ns;
        
		  s_tb    <= "01";
		  wait for 20 ns;
		  
		  s_tb    <= "10";
        wait for 20 ns;
		  
		  s_tb    <= "11";
        wait for 20 ns;
        
        
        wait;
    end process;
    
end behavioral;