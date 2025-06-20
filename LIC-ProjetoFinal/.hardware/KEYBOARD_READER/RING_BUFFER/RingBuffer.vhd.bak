LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity RingBuffer is 
	port (
		D: in std_logic_vector(3 downto 0);
		DAV: in std_logic;
		CTS: in std_logic;
		RESET: in std_logic;
		MCLK: in std_logic;
		
		Q: out std_logic_vector(3 downto 0);
		Wreg: out std_logic;
		DAC: out std_logic	
	);
end RingBuffer;

architecture structural of RingBuffer is 

	component Ring_Buffer_Control is
		port(
			DAV:in std_logic;
			CTS:in std_logic;
			full:in std_logic;
			empty:in std_logic;
			MCLK:in std_logic;
			RESET:in std_logic;	
			
			Wr:out std_logic;
			selPG:out std_logic;
			incPut:out std_logic;
			incGet:out std_logic;
			Wreg:out std_logic;
			DAC:out std_logic
		);
	end component;
	
	
	component memory_address_control is 
		port (
			CLK: 	  in std_logic;
			reset:  in std_logic;
			
			putget: in std_logic;
			incput: in std_logic;
			incget: in std_logic;

			full: out std_logic;
			empty: out std_logic;
			output: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component RAM is
		generic(
			ADDRESS_WIDTH : natural := 4;
			DATA_WIDTH : natural := 4
		);
		port(
			address : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
			wr: in std_logic;
			din: in std_logic_vector(DATA_WIDTH - 1 downto 0);
			dout: out std_logic_vector(DATA_WIDTH - 1 downto 0)
		);
	end component;
	
	signal wr_sig: std_logic;
	signal selPG_sig: std_logic;
	signal incPut_sig: std_logic;
	signal incGet_sig: std_logic;
	signal full_sig: std_logic;
	signal empty_sig: std_logic;
	signal A_sig: std_logic_vector(3 downto 0);
	
	
	begin 
	
	
	ringBufferControl: Ring_Buffer_Control port map (
		DAV 	=>	DAV,
		CTS		=>	CTS,
		full	=> 	full_sig,
		empty	=>	empty_sig,
		MCLK	=> 	MCLK,
		RESET 	=> 	RESET,
		
		Wr		=> 	wr_sig,
		selPG	=>	selPG_sig,
		incPut	=>	incPut_sig,
		incGet	=> 	incGet_sig,
		Wreg	=> 	Wreg,
		DAC		=> 	DAC
	);
	
	mac: memory_address_control port map (
		CLK		=>	MCLK,
		reset	=>	RESET,
			
		putget	=>	selPG_sig,
		incput	=>	incPut_sig,
		incget	=>	incGet_sig,
	
		full	=>	full_sig,
		empty	=>	empty_sig,
		output	=>	A_sig
	);
		ramm: RAM generic map(4,4)
		 port map (
			address => A_sig,
			wr 		=> wr_sig,
			din		=> D,
			dout	=> Q
		 );
		
end structural;	
			
			
			