library ieee;
use ieee.std_logic_1164.all;

entity priority_encoder_tb is
end priority_encoder_tb;

architecture behavioral of priority_encoder_tb is

    component priority_encoder is 
        port (
            A 	: in std_logic_vector(3 downto 0);
		 
				Y 	: out std_logic_vector(1 downto 0);
				GS	: out std_logic
        );
    end component;
    
    signal a_tb      : std_logic_vector(3 downto 0);
    signal y_tb      : std_logic_vector(1 downto 0);
    signal gs_tb     : std_logic;
	 
begin
    
    UUT : priority_encoder 
        port map (
					A 	=> a_tb,
				 
					Y  => y_tb,
					GS	=> gs_tb
        );
    
    stimulus: process
    begin
	 
		  a_tb    <= "0000";
        wait for 20 ns;
        
		  a_tb    <= "0001";
		  wait for 20 ns;
		  
		  a_tb    <= "0010";
        wait for 20 ns;
		  
		  a_tb    <= "0100";
		  wait for 20 ns;
		  
		  a_tb 	 <= "1000";
        wait for 20 ns;
        
        wait;
    end process;
    
end behavioral;
