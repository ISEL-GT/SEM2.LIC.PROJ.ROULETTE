-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "05/21/2025 10:38:38"

-- 
-- Device: Altera 10M50DAF484C6GES Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	RingBuffer IS
    PORT (
	D : IN std_logic_vector(3 DOWNTO 0);
	DAV : IN std_logic;
	CTS : IN std_logic;
	RESET : IN std_logic;
	MCLK : IN std_logic;
	Q : OUT std_logic_vector(3 DOWNTO 0);
	Wreg : OUT std_logic;
	DAC : OUT std_logic
	);
END RingBuffer;

-- Design Ports Information
-- Q[0]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[2]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[3]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Wreg	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[0]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MCLK	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESET	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CTS	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAV	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[1]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[2]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[3]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RingBuffer IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_D : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_DAV : std_logic;
SIGNAL ww_CTS : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_MCLK : std_logic;
SIGNAL ww_Q : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Wreg : std_logic;
SIGNAL ww_DAC : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \rtl~12clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~10clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~11clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~7clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~2clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~6clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~15clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~5clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~4clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~14clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \MCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~13clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~3clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~8clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~9clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RESET~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[2]~output_o\ : std_logic;
SIGNAL \Q[3]~output_o\ : std_logic;
SIGNAL \Wreg~output_o\ : std_logic;
SIGNAL \DAC~output_o\ : std_logic;
SIGNAL \MCLK~input_o\ : std_logic;
SIGNAL \MCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \CTS~input_o\ : std_logic;
SIGNAL \DAV~input_o\ : std_logic;
SIGNAL \inst_ringBufferControl|NextState.SelectAddress~0_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|CurrentState.SelectAddress~feeder_combout\ : std_logic;
SIGNAL \RESET~input_o\ : std_logic;
SIGNAL \RESET~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst_ringBufferControl|CurrentState.SelectAddress~q\ : std_logic;
SIGNAL \inst_ringBufferControl|CurrentState.Writing~q\ : std_logic;
SIGNAL \inst_ringBufferControl|Selector1~0_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|CurrentState.Data_Accepted~q\ : std_logic;
SIGNAL \inst_ringBufferControl|NextState.Data_Written~0_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|CurrentState.Data_Written~q\ : std_logic;
SIGNAL \inst_mac|registry_PUT|FFD1|Q~0_combout\ : std_logic;
SIGNAL \inst_mac|registry_PUT|FFD1|Q~q\ : std_logic;
SIGNAL \inst_mac|registry_PUT|FFD2|Q~0_combout\ : std_logic;
SIGNAL \inst_mac|registry_PUT|FFD2|Q~q\ : std_logic;
SIGNAL \inst_mac|registry_PUT|FFD3|Q~0_combout\ : std_logic;
SIGNAL \inst_mac|registry_PUT|FFD3|Q~q\ : std_logic;
SIGNAL \inst_mac|instance_adder_4bits|FA2|instance_half_adder_2|carry_out~combout\ : std_logic;
SIGNAL \inst_mac|registry_PUT|FFD4|Q~0_combout\ : std_logic;
SIGNAL \inst_mac|registry_PUT|FFD4|Q~q\ : std_logic;
SIGNAL \inst_ringBufferControl|process_1~1_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|process_1~0_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|process_1~2_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|Selector2~0_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|CurrentState.Delivering~q\ : std_logic;
SIGNAL \inst_ringBufferControl|NextState.Data_Delivered~0_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|CurrentState.Data_Delivered~q\ : std_logic;
SIGNAL \inst_ringBufferControl|NextState~2_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|Selector0~0_combout\ : std_logic;
SIGNAL \inst_ringBufferControl|CurrentState.START~q\ : std_logic;
SIGNAL \inst_ringBufferControl|selPG~0_combout\ : std_logic;
SIGNAL \inst_mac|registry_GET|FFD1|Q~0_combout\ : std_logic;
SIGNAL \inst_mac|registry_GET|FFD1|Q~q\ : std_logic;
SIGNAL \inst_mac|registry_GET|FFD2|Q~0_combout\ : std_logic;
SIGNAL \inst_mac|registry_GET|FFD2|Q~q\ : std_logic;
SIGNAL \inst_mac|output[1]~0_combout\ : std_logic;
SIGNAL \D[0]~input_o\ : std_logic;
SIGNAL \inst_mac|output[0]~1_combout\ : std_logic;
SIGNAL \inst_mac|registry_GET|FFD3|Q~0_combout\ : std_logic;
SIGNAL \inst_mac|registry_GET|FFD3|Q~q\ : std_logic;
SIGNAL \inst_mac|instance_adder_4bits_1|FA2|instance_half_adder_2|carry_out~combout\ : std_logic;
SIGNAL \inst_mac|registry_GET|FFD4|Q~0_combout\ : std_logic;
SIGNAL \inst_mac|registry_GET|FFD4|Q~q\ : std_logic;
SIGNAL \inst_mac|output[3]~2_combout\ : std_logic;
SIGNAL \inst_mac|output[2]~3_combout\ : std_logic;
SIGNAL \ramm|ram~109_combout\ : std_logic;
SIGNAL \rtl~5_combout\ : std_logic;
SIGNAL \rtl~5clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~24_combout\ : std_logic;
SIGNAL \ramm|ram~110_combout\ : std_logic;
SIGNAL \rtl~6_combout\ : std_logic;
SIGNAL \rtl~6clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~16_combout\ : std_logic;
SIGNAL \ramm|ram~66_combout\ : std_logic;
SIGNAL \ramm|ram~108_combout\ : std_logic;
SIGNAL \rtl~4_combout\ : std_logic;
SIGNAL \rtl~4clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~20_combout\ : std_logic;
SIGNAL \ramm|ram~111_combout\ : std_logic;
SIGNAL \rtl~7_combout\ : std_logic;
SIGNAL \rtl~7clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~28_combout\ : std_logic;
SIGNAL \ramm|ram~67_combout\ : std_logic;
SIGNAL \ramm|ram~113_combout\ : std_logic;
SIGNAL \rtl~9_combout\ : std_logic;
SIGNAL \rtl~9clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~4_combout\ : std_logic;
SIGNAL \ramm|ram~114_combout\ : std_logic;
SIGNAL \rtl~10_combout\ : std_logic;
SIGNAL \rtl~10clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~0_combout\ : std_logic;
SIGNAL \ramm|ram~68_combout\ : std_logic;
SIGNAL \ramm|ram~115_combout\ : std_logic;
SIGNAL \rtl~11_combout\ : std_logic;
SIGNAL \rtl~11clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~12_combout\ : std_logic;
SIGNAL \ramm|ram~112_combout\ : std_logic;
SIGNAL \rtl~8_combout\ : std_logic;
SIGNAL \rtl~8clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~8_combout\ : std_logic;
SIGNAL \ramm|ram~69_combout\ : std_logic;
SIGNAL \ramm|ram~70_combout\ : std_logic;
SIGNAL \ramm|ram~106_combout\ : std_logic;
SIGNAL \rtl~2_combout\ : std_logic;
SIGNAL \rtl~2clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~32_combout\ : std_logic;
SIGNAL \ramm|ram~105_combout\ : std_logic;
SIGNAL \rtl~1_combout\ : std_logic;
SIGNAL \rtl~1clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~36_combout\ : std_logic;
SIGNAL \ramm|ram~64_combout\ : std_logic;
SIGNAL \ramm|ram~107_combout\ : std_logic;
SIGNAL \rtl~3_combout\ : std_logic;
SIGNAL \rtl~3clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~44_combout\ : std_logic;
SIGNAL \ramm|ram~104_combout\ : std_logic;
SIGNAL \rtl~0_combout\ : std_logic;
SIGNAL \rtl~0clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~40_combout\ : std_logic;
SIGNAL \ramm|ram~65_combout\ : std_logic;
SIGNAL \ramm|ram~119_combout\ : std_logic;
SIGNAL \rtl~15_combout\ : std_logic;
SIGNAL \rtl~15clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~60_combout\ : std_logic;
SIGNAL \ramm|ram~116_combout\ : std_logic;
SIGNAL \rtl~12_combout\ : std_logic;
SIGNAL \rtl~12clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~52_combout\ : std_logic;
SIGNAL \ramm|ram~118_combout\ : std_logic;
SIGNAL \rtl~14_combout\ : std_logic;
SIGNAL \rtl~14clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~48_combout\ : std_logic;
SIGNAL \ramm|ram~117_combout\ : std_logic;
SIGNAL \rtl~13_combout\ : std_logic;
SIGNAL \rtl~13clkctrl_outclk\ : std_logic;
SIGNAL \ramm|ram~56_combout\ : std_logic;
SIGNAL \ramm|ram~71_combout\ : std_logic;
SIGNAL \ramm|ram~72_combout\ : std_logic;
SIGNAL \ramm|ram~73_combout\ : std_logic;
SIGNAL \D[1]~input_o\ : std_logic;
SIGNAL \ramm|ram~53_combout\ : std_logic;
SIGNAL \ramm|ram~21_combout\ : std_logic;
SIGNAL \ramm|ram~5_combout\ : std_logic;
SIGNAL \ramm|ram~76_combout\ : std_logic;
SIGNAL \ramm|ram~37_combout\ : std_logic;
SIGNAL \ramm|ram~77_combout\ : std_logic;
SIGNAL \ramm|ram~49_combout\ : std_logic;
SIGNAL \ramm|ram~1_combout\ : std_logic;
SIGNAL \ramm|ram~33_combout\ : std_logic;
SIGNAL \ramm|ram~78_combout\ : std_logic;
SIGNAL \ramm|ram~17_combout\ : std_logic;
SIGNAL \ramm|ram~79_combout\ : std_logic;
SIGNAL \ramm|ram~80_combout\ : std_logic;
SIGNAL \ramm|ram~57_combout\ : std_logic;
SIGNAL \ramm|ram~25_combout\ : std_logic;
SIGNAL \ramm|ram~41_combout\ : std_logic;
SIGNAL \ramm|ram~9_combout\ : std_logic;
SIGNAL \ramm|ram~74_combout\ : std_logic;
SIGNAL \ramm|ram~75_combout\ : std_logic;
SIGNAL \ramm|ram~61_combout\ : std_logic;
SIGNAL \ramm|ram~45_combout\ : std_logic;
SIGNAL \ramm|ram~29_combout\ : std_logic;
SIGNAL \ramm|ram~13_combout\ : std_logic;
SIGNAL \ramm|ram~81_combout\ : std_logic;
SIGNAL \ramm|ram~82_combout\ : std_logic;
SIGNAL \ramm|ram~83_combout\ : std_logic;
SIGNAL \D[2]~input_o\ : std_logic;
SIGNAL \ramm|ram~62_combout\ : std_logic;
SIGNAL \ramm|ram~50_combout\ : std_logic;
SIGNAL \ramm|ram~54_combout\ : std_logic;
SIGNAL \ramm|ram~91_combout\ : std_logic;
SIGNAL \ramm|ram~58_combout\ : std_logic;
SIGNAL \ramm|ram~92_combout\ : std_logic;
SIGNAL \ramm|ram~46_combout\ : std_logic;
SIGNAL \ramm|ram~38_combout\ : std_logic;
SIGNAL \ramm|ram~34_combout\ : std_logic;
SIGNAL \ramm|ram~42_combout\ : std_logic;
SIGNAL \ramm|ram~86_combout\ : std_logic;
SIGNAL \ramm|ram~87_combout\ : std_logic;
SIGNAL \ramm|ram~14_combout\ : std_logic;
SIGNAL \ramm|ram~6_combout\ : std_logic;
SIGNAL \ramm|ram~10_combout\ : std_logic;
SIGNAL \ramm|ram~2_combout\ : std_logic;
SIGNAL \ramm|ram~88_combout\ : std_logic;
SIGNAL \ramm|ram~89_combout\ : std_logic;
SIGNAL \ramm|ram~90_combout\ : std_logic;
SIGNAL \ramm|ram~30_combout\ : std_logic;
SIGNAL \ramm|ram~22_combout\ : std_logic;
SIGNAL \ramm|ram~18_combout\ : std_logic;
SIGNAL \ramm|ram~84_combout\ : std_logic;
SIGNAL \ramm|ram~26_combout\ : std_logic;
SIGNAL \ramm|ram~85_combout\ : std_logic;
SIGNAL \ramm|ram~93_combout\ : std_logic;
SIGNAL \D[3]~input_o\ : std_logic;
SIGNAL \ramm|ram~3_combout\ : std_logic;
SIGNAL \ramm|ram~19_combout\ : std_logic;
SIGNAL \ramm|ram~98_combout\ : std_logic;
SIGNAL \ramm|ram~51_combout\ : std_logic;
SIGNAL \ramm|ram~35_combout\ : std_logic;
SIGNAL \ramm|ram~99_combout\ : std_logic;
SIGNAL \ramm|ram~43_combout\ : std_logic;
SIGNAL \ramm|ram~27_combout\ : std_logic;
SIGNAL \ramm|ram~11_combout\ : std_logic;
SIGNAL \ramm|ram~96_combout\ : std_logic;
SIGNAL \ramm|ram~59_combout\ : std_logic;
SIGNAL \ramm|ram~97_combout\ : std_logic;
SIGNAL \ramm|ram~100_combout\ : std_logic;
SIGNAL \ramm|ram~23_combout\ : std_logic;
SIGNAL \ramm|ram~55_combout\ : std_logic;
SIGNAL \ramm|ram~7_combout\ : std_logic;
SIGNAL \ramm|ram~39_combout\ : std_logic;
SIGNAL \ramm|ram~94_combout\ : std_logic;
SIGNAL \ramm|ram~95_combout\ : std_logic;
SIGNAL \ramm|ram~31_combout\ : std_logic;
SIGNAL \ramm|ram~63_combout\ : std_logic;
SIGNAL \ramm|ram~47_combout\ : std_logic;
SIGNAL \ramm|ram~15_combout\ : std_logic;
SIGNAL \ramm|ram~101_combout\ : std_logic;
SIGNAL \ramm|ram~102_combout\ : std_logic;
SIGNAL \ramm|ram~103_combout\ : std_logic;
SIGNAL \ALT_INV_RESET~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_D <= D;
ww_DAV <= DAV;
ww_CTS <= CTS;
ww_RESET <= RESET;
ww_MCLK <= MCLK;
Q <= ww_Q;
Wreg <= ww_Wreg;
DAC <= ww_DAC;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\rtl~12clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~12_combout\);

\rtl~10clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~10_combout\);

\rtl~1clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~1_combout\);

\rtl~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~0_combout\);

\rtl~11clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~11_combout\);

\rtl~7clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~7_combout\);

\rtl~2clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~2_combout\);

\rtl~6clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~6_combout\);

\rtl~15clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~15_combout\);

\rtl~5clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~5_combout\);

\rtl~4clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~4_combout\);

\rtl~14clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~14_combout\);

\MCLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \MCLK~input_o\);

\rtl~13clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~13_combout\);

\rtl~3clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~3_combout\);

\rtl~8clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~8_combout\);

\rtl~9clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~9_combout\);

\RESET~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \RESET~input_o\);
\ALT_INV_RESET~inputclkctrl_outclk\ <= NOT \RESET~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y51_N24
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X34_Y0_N23
\Q[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ramm|ram~73_combout\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

-- Location: IOOBUF_X29_Y39_N16
\Q[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ramm|ram~83_combout\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

-- Location: IOOBUF_X36_Y39_N16
\Q[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ramm|ram~93_combout\,
	devoe => ww_devoe,
	o => \Q[2]~output_o\);

-- Location: IOOBUF_X26_Y39_N23
\Q[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ramm|ram~103_combout\,
	devoe => ww_devoe,
	o => \Q[3]~output_o\);

-- Location: IOOBUF_X34_Y39_N9
\Wreg~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_ringBufferControl|CurrentState.Delivering~q\,
	devoe => ww_devoe,
	o => \Wreg~output_o\);

-- Location: IOOBUF_X36_Y39_N23
\DAC~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_ringBufferControl|CurrentState.Data_Accepted~q\,
	devoe => ww_devoe,
	o => \DAC~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\MCLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MCLK,
	o => \MCLK~input_o\);

-- Location: CLKCTRL_G19
\MCLK~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \MCLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \MCLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X34_Y39_N22
\CTS~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CTS,
	o => \CTS~input_o\);

-- Location: IOIBUF_X34_Y39_N29
\DAV~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DAV,
	o => \DAV~input_o\);

-- Location: LCCOMB_X36_Y27_N12
\inst_ringBufferControl|NextState.SelectAddress~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|NextState.SelectAddress~0_combout\ = (\inst_ringBufferControl|process_1~1_combout\ & (\DAV~input_o\ & !\inst_ringBufferControl|CurrentState.START~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_ringBufferControl|process_1~1_combout\,
	datab => \DAV~input_o\,
	datad => \inst_ringBufferControl|CurrentState.START~q\,
	combout => \inst_ringBufferControl|NextState.SelectAddress~0_combout\);

-- Location: LCCOMB_X36_Y27_N14
\inst_ringBufferControl|CurrentState.SelectAddress~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|CurrentState.SelectAddress~feeder_combout\ = \inst_ringBufferControl|NextState.SelectAddress~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_ringBufferControl|NextState.SelectAddress~0_combout\,
	combout => \inst_ringBufferControl|CurrentState.SelectAddress~feeder_combout\);

-- Location: IOIBUF_X78_Y29_N15
\RESET~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET,
	o => \RESET~input_o\);

-- Location: CLKCTRL_G7
\RESET~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RESET~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RESET~inputclkctrl_outclk\);

-- Location: FF_X36_Y27_N15
\inst_ringBufferControl|CurrentState.SelectAddress\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~inputclkctrl_outclk\,
	d => \inst_ringBufferControl|CurrentState.SelectAddress~feeder_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_ringBufferControl|CurrentState.SelectAddress~q\);

-- Location: FF_X36_Y27_N13
\inst_ringBufferControl|CurrentState.Writing\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	asdata => \inst_ringBufferControl|CurrentState.SelectAddress~q\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_ringBufferControl|CurrentState.Writing~q\);

-- Location: LCCOMB_X36_Y27_N20
\inst_ringBufferControl|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|Selector1~0_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\) # ((\DAV~input_o\ & \inst_ringBufferControl|CurrentState.Data_Accepted~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DAV~input_o\,
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \inst_ringBufferControl|CurrentState.Data_Accepted~q\,
	combout => \inst_ringBufferControl|Selector1~0_combout\);

-- Location: FF_X36_Y27_N29
\inst_ringBufferControl|CurrentState.Data_Accepted\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~inputclkctrl_outclk\,
	asdata => \inst_ringBufferControl|Selector1~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_ringBufferControl|CurrentState.Data_Accepted~q\);

-- Location: LCCOMB_X36_Y27_N26
\inst_ringBufferControl|NextState.Data_Written~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|NextState.Data_Written~0_combout\ = (!\DAV~input_o\ & \inst_ringBufferControl|CurrentState.Data_Accepted~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DAV~input_o\,
	datad => \inst_ringBufferControl|CurrentState.Data_Accepted~q\,
	combout => \inst_ringBufferControl|NextState.Data_Written~0_combout\);

-- Location: FF_X36_Y27_N27
\inst_ringBufferControl|CurrentState.Data_Written\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~inputclkctrl_outclk\,
	d => \inst_ringBufferControl|NextState.Data_Written~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_ringBufferControl|CurrentState.Data_Written~q\);

-- Location: LCCOMB_X36_Y27_N4
\inst_mac|registry_PUT|FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|registry_PUT|FFD1|Q~0_combout\ = \inst_mac|registry_PUT|FFD1|Q~q\ $ (\inst_ringBufferControl|CurrentState.Data_Written~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_mac|registry_PUT|FFD1|Q~q\,
	datad => \inst_ringBufferControl|CurrentState.Data_Written~q\,
	combout => \inst_mac|registry_PUT|FFD1|Q~0_combout\);

-- Location: FF_X36_Y27_N5
\inst_mac|registry_PUT|FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	d => \inst_mac|registry_PUT|FFD1|Q~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_mac|registry_PUT|FFD1|Q~q\);

-- Location: LCCOMB_X36_Y27_N18
\inst_mac|registry_PUT|FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|registry_PUT|FFD2|Q~0_combout\ = \inst_mac|registry_PUT|FFD2|Q~q\ $ (((\inst_mac|registry_PUT|FFD1|Q~q\ & \inst_ringBufferControl|CurrentState.Data_Written~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_mac|registry_PUT|FFD1|Q~q\,
	datac => \inst_mac|registry_PUT|FFD2|Q~q\,
	datad => \inst_ringBufferControl|CurrentState.Data_Written~q\,
	combout => \inst_mac|registry_PUT|FFD2|Q~0_combout\);

-- Location: FF_X36_Y27_N19
\inst_mac|registry_PUT|FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	d => \inst_mac|registry_PUT|FFD2|Q~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_mac|registry_PUT|FFD2|Q~q\);

-- Location: LCCOMB_X36_Y27_N24
\inst_mac|registry_PUT|FFD3|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|registry_PUT|FFD3|Q~0_combout\ = \inst_mac|registry_PUT|FFD3|Q~q\ $ (((\inst_mac|registry_PUT|FFD1|Q~q\ & (\inst_mac|registry_PUT|FFD2|Q~q\ & \inst_ringBufferControl|CurrentState.Data_Written~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|registry_PUT|FFD1|Q~q\,
	datab => \inst_mac|registry_PUT|FFD2|Q~q\,
	datac => \inst_mac|registry_PUT|FFD3|Q~q\,
	datad => \inst_ringBufferControl|CurrentState.Data_Written~q\,
	combout => \inst_mac|registry_PUT|FFD3|Q~0_combout\);

-- Location: FF_X36_Y27_N25
\inst_mac|registry_PUT|FFD3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	d => \inst_mac|registry_PUT|FFD3|Q~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_mac|registry_PUT|FFD3|Q~q\);

-- Location: LCCOMB_X36_Y27_N30
\inst_mac|instance_adder_4bits|FA2|instance_half_adder_2|carry_out\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|instance_adder_4bits|FA2|instance_half_adder_2|carry_out~combout\ = (\inst_mac|registry_PUT|FFD1|Q~q\ & (\inst_mac|registry_PUT|FFD2|Q~q\ & (\inst_mac|registry_PUT|FFD3|Q~q\ & \inst_ringBufferControl|CurrentState.Data_Written~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|registry_PUT|FFD1|Q~q\,
	datab => \inst_mac|registry_PUT|FFD2|Q~q\,
	datac => \inst_mac|registry_PUT|FFD3|Q~q\,
	datad => \inst_ringBufferControl|CurrentState.Data_Written~q\,
	combout => \inst_mac|instance_adder_4bits|FA2|instance_half_adder_2|carry_out~combout\);

-- Location: LCCOMB_X36_Y27_N22
\inst_mac|registry_PUT|FFD4|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|registry_PUT|FFD4|Q~0_combout\ = \inst_mac|registry_PUT|FFD4|Q~q\ $ (\inst_mac|instance_adder_4bits|FA2|instance_half_adder_2|carry_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_mac|registry_PUT|FFD4|Q~q\,
	datad => \inst_mac|instance_adder_4bits|FA2|instance_half_adder_2|carry_out~combout\,
	combout => \inst_mac|registry_PUT|FFD4|Q~0_combout\);

-- Location: FF_X36_Y27_N23
\inst_mac|registry_PUT|FFD4|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	d => \inst_mac|registry_PUT|FFD4|Q~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_mac|registry_PUT|FFD4|Q~q\);

-- Location: LCCOMB_X36_Y27_N0
\inst_ringBufferControl|process_1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|process_1~1_combout\ = (((!\inst_mac|registry_PUT|FFD3|Q~q\) # (!\inst_mac|registry_PUT|FFD1|Q~q\)) # (!\inst_mac|registry_PUT|FFD2|Q~q\)) # (!\inst_mac|registry_PUT|FFD4|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|registry_PUT|FFD4|Q~q\,
	datab => \inst_mac|registry_PUT|FFD2|Q~q\,
	datac => \inst_mac|registry_PUT|FFD1|Q~q\,
	datad => \inst_mac|registry_PUT|FFD3|Q~q\,
	combout => \inst_ringBufferControl|process_1~1_combout\);

-- Location: LCCOMB_X36_Y27_N6
\inst_ringBufferControl|process_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|process_1~0_combout\ = (\inst_mac|registry_PUT|FFD2|Q~q\) # ((\inst_mac|registry_PUT|FFD1|Q~q\) # ((\inst_mac|registry_PUT|FFD3|Q~q\) # (\inst_mac|registry_PUT|FFD4|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|registry_PUT|FFD2|Q~q\,
	datab => \inst_mac|registry_PUT|FFD1|Q~q\,
	datac => \inst_mac|registry_PUT|FFD3|Q~q\,
	datad => \inst_mac|registry_PUT|FFD4|Q~q\,
	combout => \inst_ringBufferControl|process_1~0_combout\);

-- Location: LCCOMB_X35_Y27_N2
\inst_ringBufferControl|process_1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|process_1~2_combout\ = (\CTS~input_o\ & (\inst_ringBufferControl|process_1~0_combout\ & ((!\inst_ringBufferControl|process_1~1_combout\) # (!\DAV~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DAV~input_o\,
	datab => \CTS~input_o\,
	datac => \inst_ringBufferControl|process_1~1_combout\,
	datad => \inst_ringBufferControl|process_1~0_combout\,
	combout => \inst_ringBufferControl|process_1~2_combout\);

-- Location: LCCOMB_X35_Y27_N20
\inst_ringBufferControl|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|Selector2~0_combout\ = (\CTS~input_o\ & ((\inst_ringBufferControl|CurrentState.Delivering~q\) # ((!\inst_ringBufferControl|CurrentState.START~q\ & \inst_ringBufferControl|process_1~2_combout\)))) # (!\CTS~input_o\ & 
-- (!\inst_ringBufferControl|CurrentState.START~q\ & ((\inst_ringBufferControl|process_1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CTS~input_o\,
	datab => \inst_ringBufferControl|CurrentState.START~q\,
	datac => \inst_ringBufferControl|CurrentState.Delivering~q\,
	datad => \inst_ringBufferControl|process_1~2_combout\,
	combout => \inst_ringBufferControl|Selector2~0_combout\);

-- Location: FF_X35_Y27_N21
\inst_ringBufferControl|CurrentState.Delivering\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	d => \inst_ringBufferControl|Selector2~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_ringBufferControl|CurrentState.Delivering~q\);

-- Location: LCCOMB_X34_Y27_N6
\inst_ringBufferControl|NextState.Data_Delivered~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|NextState.Data_Delivered~0_combout\ = (!\CTS~input_o\ & \inst_ringBufferControl|CurrentState.Delivering~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CTS~input_o\,
	datac => \inst_ringBufferControl|CurrentState.Delivering~q\,
	combout => \inst_ringBufferControl|NextState.Data_Delivered~0_combout\);

-- Location: FF_X35_Y27_N19
\inst_ringBufferControl|CurrentState.Data_Delivered\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~inputclkctrl_outclk\,
	asdata => \inst_ringBufferControl|NextState.Data_Delivered~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_ringBufferControl|CurrentState.Data_Delivered~q\);

-- Location: LCCOMB_X35_Y27_N0
\inst_ringBufferControl|NextState~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|NextState~2_combout\ = (\DAV~input_o\ & ((\inst_ringBufferControl|process_1~1_combout\) # ((\CTS~input_o\ & \inst_ringBufferControl|process_1~0_combout\)))) # (!\DAV~input_o\ & (\CTS~input_o\ & 
-- ((\inst_ringBufferControl|process_1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DAV~input_o\,
	datab => \CTS~input_o\,
	datac => \inst_ringBufferControl|process_1~1_combout\,
	datad => \inst_ringBufferControl|process_1~0_combout\,
	combout => \inst_ringBufferControl|NextState~2_combout\);

-- Location: LCCOMB_X35_Y27_N22
\inst_ringBufferControl|Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|Selector0~0_combout\ = (!\inst_ringBufferControl|CurrentState.Data_Delivered~q\ & (!\inst_ringBufferControl|CurrentState.Data_Written~q\ & ((\inst_ringBufferControl|CurrentState.START~q\) # 
-- (\inst_ringBufferControl|NextState~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_ringBufferControl|CurrentState.Data_Delivered~q\,
	datab => \inst_ringBufferControl|CurrentState.Data_Written~q\,
	datac => \inst_ringBufferControl|CurrentState.START~q\,
	datad => \inst_ringBufferControl|NextState~2_combout\,
	combout => \inst_ringBufferControl|Selector0~0_combout\);

-- Location: FF_X35_Y27_N23
\inst_ringBufferControl|CurrentState.START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	d => \inst_ringBufferControl|Selector0~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_ringBufferControl|CurrentState.START~q\);

-- Location: LCCOMB_X35_Y27_N10
\inst_ringBufferControl|selPG~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_ringBufferControl|selPG~0_combout\ = ((\inst_ringBufferControl|CurrentState.Delivering~q\) # (\inst_ringBufferControl|CurrentState.Data_Delivered~q\)) # (!\inst_ringBufferControl|CurrentState.START~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_ringBufferControl|CurrentState.START~q\,
	datab => \inst_ringBufferControl|CurrentState.Delivering~q\,
	datad => \inst_ringBufferControl|CurrentState.Data_Delivered~q\,
	combout => \inst_ringBufferControl|selPG~0_combout\);

-- Location: LCCOMB_X35_Y27_N8
\inst_mac|registry_GET|FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|registry_GET|FFD1|Q~0_combout\ = \inst_ringBufferControl|CurrentState.Data_Delivered~q\ $ (\inst_mac|registry_GET|FFD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Data_Delivered~q\,
	datad => \inst_mac|registry_GET|FFD1|Q~q\,
	combout => \inst_mac|registry_GET|FFD1|Q~0_combout\);

-- Location: FF_X35_Y27_N29
\inst_mac|registry_GET|FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	asdata => \inst_mac|registry_GET|FFD1|Q~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_mac|registry_GET|FFD1|Q~q\);

-- Location: LCCOMB_X35_Y27_N6
\inst_mac|registry_GET|FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|registry_GET|FFD2|Q~0_combout\ = \inst_mac|registry_GET|FFD2|Q~q\ $ (((\inst_mac|registry_GET|FFD1|Q~q\ & \inst_ringBufferControl|CurrentState.Data_Delivered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|registry_GET|FFD2|Q~q\,
	datab => \inst_mac|registry_GET|FFD1|Q~q\,
	datac => \inst_ringBufferControl|CurrentState.Data_Delivered~q\,
	combout => \inst_mac|registry_GET|FFD2|Q~0_combout\);

-- Location: FF_X35_Y27_N31
\inst_mac|registry_GET|FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	asdata => \inst_mac|registry_GET|FFD2|Q~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_mac|registry_GET|FFD2|Q~q\);

-- Location: LCCOMB_X35_Y27_N30
\inst_mac|output[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|output[1]~0_combout\ = (\inst_ringBufferControl|selPG~0_combout\ & (\inst_mac|registry_GET|FFD2|Q~q\)) # (!\inst_ringBufferControl|selPG~0_combout\ & ((\inst_mac|registry_PUT|FFD2|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_ringBufferControl|selPG~0_combout\,
	datac => \inst_mac|registry_GET|FFD2|Q~q\,
	datad => \inst_mac|registry_PUT|FFD2|Q~q\,
	combout => \inst_mac|output[1]~0_combout\);

-- Location: IOIBUF_X36_Y0_N8
\D[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(0),
	o => \D[0]~input_o\);

-- Location: LCCOMB_X35_Y27_N28
\inst_mac|output[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|output[0]~1_combout\ = (\inst_ringBufferControl|selPG~0_combout\ & (\inst_mac|registry_GET|FFD1|Q~q\)) # (!\inst_ringBufferControl|selPG~0_combout\ & ((\inst_mac|registry_PUT|FFD1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_ringBufferControl|selPG~0_combout\,
	datac => \inst_mac|registry_GET|FFD1|Q~q\,
	datad => \inst_mac|registry_PUT|FFD1|Q~q\,
	combout => \inst_mac|output[0]~1_combout\);

-- Location: LCCOMB_X35_Y27_N4
\inst_mac|registry_GET|FFD3|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|registry_GET|FFD3|Q~0_combout\ = \inst_mac|registry_GET|FFD3|Q~q\ $ (((\inst_mac|registry_GET|FFD2|Q~q\ & (\inst_mac|registry_GET|FFD1|Q~q\ & \inst_ringBufferControl|CurrentState.Data_Delivered~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|registry_GET|FFD2|Q~q\,
	datab => \inst_mac|registry_GET|FFD1|Q~q\,
	datac => \inst_ringBufferControl|CurrentState.Data_Delivered~q\,
	datad => \inst_mac|registry_GET|FFD3|Q~q\,
	combout => \inst_mac|registry_GET|FFD3|Q~0_combout\);

-- Location: FF_X35_Y27_N17
\inst_mac|registry_GET|FFD3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	asdata => \inst_mac|registry_GET|FFD3|Q~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_mac|registry_GET|FFD3|Q~q\);

-- Location: LCCOMB_X35_Y27_N14
\inst_mac|instance_adder_4bits_1|FA2|instance_half_adder_2|carry_out\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|instance_adder_4bits_1|FA2|instance_half_adder_2|carry_out~combout\ = (\inst_ringBufferControl|CurrentState.Data_Delivered~q\ & (\inst_mac|registry_GET|FFD1|Q~q\ & (\inst_mac|registry_GET|FFD2|Q~q\ & \inst_mac|registry_GET|FFD3|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_ringBufferControl|CurrentState.Data_Delivered~q\,
	datab => \inst_mac|registry_GET|FFD1|Q~q\,
	datac => \inst_mac|registry_GET|FFD2|Q~q\,
	datad => \inst_mac|registry_GET|FFD3|Q~q\,
	combout => \inst_mac|instance_adder_4bits_1|FA2|instance_half_adder_2|carry_out~combout\);

-- Location: LCCOMB_X35_Y27_N24
\inst_mac|registry_GET|FFD4|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|registry_GET|FFD4|Q~0_combout\ = \inst_mac|instance_adder_4bits_1|FA2|instance_half_adder_2|carry_out~combout\ $ (\inst_mac|registry_GET|FFD4|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|instance_adder_4bits_1|FA2|instance_half_adder_2|carry_out~combout\,
	datac => \inst_mac|registry_GET|FFD4|Q~q\,
	combout => \inst_mac|registry_GET|FFD4|Q~0_combout\);

-- Location: FF_X35_Y27_N25
\inst_mac|registry_GET|FFD4|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MCLK~input_o\,
	d => \inst_mac|registry_GET|FFD4|Q~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_mac|registry_GET|FFD4|Q~q\);

-- Location: LCCOMB_X35_Y27_N18
\inst_mac|output[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|output[3]~2_combout\ = (\inst_ringBufferControl|selPG~0_combout\ & (\inst_mac|registry_GET|FFD4|Q~q\)) # (!\inst_ringBufferControl|selPG~0_combout\ & ((\inst_mac|registry_PUT|FFD4|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_ringBufferControl|selPG~0_combout\,
	datab => \inst_mac|registry_GET|FFD4|Q~q\,
	datad => \inst_mac|registry_PUT|FFD4|Q~q\,
	combout => \inst_mac|output[3]~2_combout\);

-- Location: LCCOMB_X35_Y27_N16
\inst_mac|output[2]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_mac|output[2]~3_combout\ = (\inst_ringBufferControl|selPG~0_combout\ & (\inst_mac|registry_GET|FFD3|Q~q\)) # (!\inst_ringBufferControl|selPG~0_combout\ & ((\inst_mac|registry_PUT|FFD3|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_ringBufferControl|selPG~0_combout\,
	datac => \inst_mac|registry_GET|FFD3|Q~q\,
	datad => \inst_mac|registry_PUT|FFD3|Q~q\,
	combout => \inst_mac|output[2]~3_combout\);

-- Location: LCCOMB_X29_Y38_N10
\ramm|ram~109\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~109_combout\ = (!\inst_mac|output[0]~1_combout\ & (!\inst_mac|output[3]~2_combout\ & (\inst_mac|output[1]~0_combout\ & \inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[3]~2_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~109_combout\);

-- Location: LCCOMB_X29_Y38_N24
\rtl~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~5_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~109_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~109_combout\,
	combout => \rtl~5_combout\);

-- Location: CLKCTRL_G0
\rtl~5clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~5clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~5clkctrl_outclk\);

-- Location: LCCOMB_X35_Y15_N24
\ramm|ram~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~24_combout\ = (GLOBAL(\rtl~5clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~5clkctrl_outclk\) & ((\ramm|ram~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \rtl~5clkctrl_outclk\,
	datad => \ramm|ram~24_combout\,
	combout => \ramm|ram~24_combout\);

-- Location: LCCOMB_X29_Y38_N28
\ramm|ram~110\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~110_combout\ = (!\inst_mac|output[0]~1_combout\ & (!\inst_mac|output[3]~2_combout\ & (!\inst_mac|output[1]~0_combout\ & \inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[3]~2_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~110_combout\);

-- Location: LCCOMB_X29_Y38_N16
\rtl~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~6_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~110_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~110_combout\,
	combout => \rtl~6_combout\);

-- Location: CLKCTRL_G1
\rtl~6clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~6clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~6clkctrl_outclk\);

-- Location: LCCOMB_X35_Y13_N28
\ramm|ram~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~16_combout\ = (GLOBAL(\rtl~6clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~6clkctrl_outclk\) & ((\ramm|ram~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \rtl~6clkctrl_outclk\,
	datad => \ramm|ram~16_combout\,
	combout => \ramm|ram~16_combout\);

-- Location: LCCOMB_X35_Y14_N22
\ramm|ram~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~66_combout\ = (\inst_mac|output[1]~0_combout\ & ((\ramm|ram~24_combout\) # ((\inst_mac|output[0]~1_combout\)))) # (!\inst_mac|output[1]~0_combout\ & (((!\inst_mac|output[0]~1_combout\ & \ramm|ram~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[1]~0_combout\,
	datab => \ramm|ram~24_combout\,
	datac => \inst_mac|output[0]~1_combout\,
	datad => \ramm|ram~16_combout\,
	combout => \ramm|ram~66_combout\);

-- Location: LCCOMB_X35_Y14_N28
\ramm|ram~108\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~108_combout\ = (\inst_mac|output[2]~3_combout\ & (!\inst_mac|output[1]~0_combout\ & (!\inst_mac|output[3]~2_combout\ & \inst_mac|output[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[2]~3_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[0]~1_combout\,
	combout => \ramm|ram~108_combout\);

-- Location: LCCOMB_X35_Y14_N0
\rtl~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~4_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~108_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~108_combout\,
	combout => \rtl~4_combout\);

-- Location: CLKCTRL_G15
\rtl~4clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~4clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~4clkctrl_outclk\);

-- Location: LCCOMB_X35_Y13_N14
\ramm|ram~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~20_combout\ = (GLOBAL(\rtl~4clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~4clkctrl_outclk\) & ((\ramm|ram~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \ramm|ram~20_combout\,
	datad => \rtl~4clkctrl_outclk\,
	combout => \ramm|ram~20_combout\);

-- Location: LCCOMB_X55_Y35_N8
\ramm|ram~111\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~111_combout\ = (\inst_mac|output[0]~1_combout\ & (\inst_mac|output[1]~0_combout\ & (!\inst_mac|output[3]~2_combout\ & \inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~111_combout\);

-- Location: LCCOMB_X55_Y35_N12
\rtl~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~7_combout\ = (\ramm|ram~111_combout\ & \inst_ringBufferControl|CurrentState.Writing~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ramm|ram~111_combout\,
	datad => \inst_ringBufferControl|CurrentState.Writing~q\,
	combout => \rtl~7_combout\);

-- Location: CLKCTRL_G5
\rtl~7clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~7clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~7clkctrl_outclk\);

-- Location: LCCOMB_X35_Y15_N22
\ramm|ram~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~28_combout\ = (GLOBAL(\rtl~7clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~7clkctrl_outclk\) & ((\ramm|ram~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \ramm|ram~28_combout\,
	datad => \rtl~7clkctrl_outclk\,
	combout => \ramm|ram~28_combout\);

-- Location: LCCOMB_X35_Y14_N6
\ramm|ram~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~67_combout\ = (\ramm|ram~66_combout\ & (((\ramm|ram~28_combout\) # (!\inst_mac|output[0]~1_combout\)))) # (!\ramm|ram~66_combout\ & (\ramm|ram~20_combout\ & (\inst_mac|output[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~66_combout\,
	datab => \ramm|ram~20_combout\,
	datac => \inst_mac|output[0]~1_combout\,
	datad => \ramm|ram~28_combout\,
	combout => \ramm|ram~67_combout\);

-- Location: LCCOMB_X55_Y35_N14
\ramm|ram~113\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~113_combout\ = (\inst_mac|output[0]~1_combout\ & (!\inst_mac|output[1]~0_combout\ & (!\inst_mac|output[3]~2_combout\ & !\inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~113_combout\);

-- Location: LCCOMB_X55_Y35_N30
\rtl~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~9_combout\ = (\ramm|ram~113_combout\ & \inst_ringBufferControl|CurrentState.Writing~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ramm|ram~113_combout\,
	datad => \inst_ringBufferControl|CurrentState.Writing~q\,
	combout => \rtl~9_combout\);

-- Location: CLKCTRL_G6
\rtl~9clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~9clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~9clkctrl_outclk\);

-- Location: LCCOMB_X34_Y14_N24
\ramm|ram~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~4_combout\ = (GLOBAL(\rtl~9clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~9clkctrl_outclk\) & ((\ramm|ram~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \rtl~9clkctrl_outclk\,
	datad => \ramm|ram~4_combout\,
	combout => \ramm|ram~4_combout\);

-- Location: LCCOMB_X35_Y29_N12
\ramm|ram~114\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~114_combout\ = (!\inst_mac|output[0]~1_combout\ & (!\inst_mac|output[3]~2_combout\ & (!\inst_mac|output[1]~0_combout\ & !\inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[3]~2_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~114_combout\);

-- Location: LCCOMB_X35_Y29_N24
\rtl~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~10_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~114_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~114_combout\,
	combout => \rtl~10_combout\);

-- Location: CLKCTRL_G11
\rtl~10clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~10clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~10clkctrl_outclk\);

-- Location: LCCOMB_X35_Y14_N20
\ramm|ram~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~0_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\ramm|ram~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datac => \rtl~10clkctrl_outclk\,
	datad => \ramm|ram~0_combout\,
	combout => \ramm|ram~0_combout\);

-- Location: LCCOMB_X35_Y14_N4
\ramm|ram~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~68_combout\ = (\inst_mac|output[1]~0_combout\ & (((\inst_mac|output[0]~1_combout\)))) # (!\inst_mac|output[1]~0_combout\ & ((\inst_mac|output[0]~1_combout\ & (\ramm|ram~4_combout\)) # (!\inst_mac|output[0]~1_combout\ & 
-- ((\ramm|ram~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[1]~0_combout\,
	datab => \ramm|ram~4_combout\,
	datac => \inst_mac|output[0]~1_combout\,
	datad => \ramm|ram~0_combout\,
	combout => \ramm|ram~68_combout\);

-- Location: LCCOMB_X35_Y27_N12
\ramm|ram~115\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~115_combout\ = (!\inst_mac|output[3]~2_combout\ & (\inst_mac|output[1]~0_combout\ & (!\inst_mac|output[2]~3_combout\ & \inst_mac|output[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[3]~2_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \inst_mac|output[2]~3_combout\,
	datad => \inst_mac|output[0]~1_combout\,
	combout => \ramm|ram~115_combout\);

-- Location: LCCOMB_X36_Y27_N28
\rtl~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~11_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~115_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~115_combout\,
	combout => \rtl~11_combout\);

-- Location: CLKCTRL_G10
\rtl~11clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~11clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~11clkctrl_outclk\);

-- Location: LCCOMB_X35_Y16_N20
\ramm|ram~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~12_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\ramm|ram~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datac => \rtl~11clkctrl_outclk\,
	datad => \ramm|ram~12_combout\,
	combout => \ramm|ram~12_combout\);

-- Location: LCCOMB_X34_Y27_N18
\ramm|ram~112\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~112_combout\ = (!\inst_mac|output[2]~3_combout\ & (!\inst_mac|output[3]~2_combout\ & (\inst_mac|output[1]~0_combout\ & !\inst_mac|output[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[2]~3_combout\,
	datab => \inst_mac|output[3]~2_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \inst_mac|output[0]~1_combout\,
	combout => \ramm|ram~112_combout\);

-- Location: LCCOMB_X34_Y27_N0
\rtl~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~8_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~112_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~112_combout\,
	combout => \rtl~8_combout\);

-- Location: CLKCTRL_G17
\rtl~8clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~8clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~8clkctrl_outclk\);

-- Location: LCCOMB_X35_Y14_N24
\ramm|ram~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~8_combout\ = (GLOBAL(\rtl~8clkctrl_outclk\) & ((\D[0]~input_o\))) # (!GLOBAL(\rtl~8clkctrl_outclk\) & (\ramm|ram~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ramm|ram~8_combout\,
	datac => \D[0]~input_o\,
	datad => \rtl~8clkctrl_outclk\,
	combout => \ramm|ram~8_combout\);

-- Location: LCCOMB_X35_Y14_N8
\ramm|ram~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~69_combout\ = (\inst_mac|output[1]~0_combout\ & ((\ramm|ram~68_combout\ & (\ramm|ram~12_combout\)) # (!\ramm|ram~68_combout\ & ((\ramm|ram~8_combout\))))) # (!\inst_mac|output[1]~0_combout\ & (\ramm|ram~68_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[1]~0_combout\,
	datab => \ramm|ram~68_combout\,
	datac => \ramm|ram~12_combout\,
	datad => \ramm|ram~8_combout\,
	combout => \ramm|ram~69_combout\);

-- Location: LCCOMB_X35_Y14_N30
\ramm|ram~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~70_combout\ = (\inst_mac|output[2]~3_combout\ & ((\ramm|ram~67_combout\) # ((\inst_mac|output[3]~2_combout\)))) # (!\inst_mac|output[2]~3_combout\ & (((!\inst_mac|output[3]~2_combout\ & \ramm|ram~69_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~67_combout\,
	datab => \inst_mac|output[2]~3_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \ramm|ram~69_combout\,
	combout => \ramm|ram~70_combout\);

-- Location: LCCOMB_X35_Y29_N18
\ramm|ram~106\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~106_combout\ = (!\inst_mac|output[0]~1_combout\ & (\inst_mac|output[3]~2_combout\ & (!\inst_mac|output[1]~0_combout\ & !\inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[3]~2_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~106_combout\);

-- Location: LCCOMB_X35_Y29_N26
\rtl~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~2_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~106_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~106_combout\,
	combout => \rtl~2_combout\);

-- Location: CLKCTRL_G12
\rtl~2clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~2clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~2clkctrl_outclk\);

-- Location: LCCOMB_X35_Y14_N14
\ramm|ram~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~32_combout\ = (GLOBAL(\rtl~2clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~2clkctrl_outclk\) & ((\ramm|ram~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[0]~input_o\,
	datac => \ramm|ram~32_combout\,
	datad => \rtl~2clkctrl_outclk\,
	combout => \ramm|ram~32_combout\);

-- Location: LCCOMB_X55_Y35_N22
\ramm|ram~105\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~105_combout\ = (\inst_mac|output[0]~1_combout\ & (!\inst_mac|output[1]~0_combout\ & (\inst_mac|output[3]~2_combout\ & !\inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~105_combout\);

-- Location: LCCOMB_X55_Y35_N26
\rtl~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~1_combout\ = (\ramm|ram~105_combout\ & \inst_ringBufferControl|CurrentState.Writing~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ramm|ram~105_combout\,
	datad => \inst_ringBufferControl|CurrentState.Writing~q\,
	combout => \rtl~1_combout\);

-- Location: CLKCTRL_G8
\rtl~1clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~1clkctrl_outclk\);

-- Location: LCCOMB_X34_Y14_N28
\ramm|ram~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~36_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\ramm|ram~36_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \ramm|ram~36_combout\,
	combout => \ramm|ram~36_combout\);

-- Location: LCCOMB_X35_Y14_N26
\ramm|ram~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~64_combout\ = (\inst_mac|output[1]~0_combout\ & (((\inst_mac|output[0]~1_combout\)))) # (!\inst_mac|output[1]~0_combout\ & ((\inst_mac|output[0]~1_combout\ & ((\ramm|ram~36_combout\))) # (!\inst_mac|output[0]~1_combout\ & 
-- (\ramm|ram~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[1]~0_combout\,
	datab => \ramm|ram~32_combout\,
	datac => \inst_mac|output[0]~1_combout\,
	datad => \ramm|ram~36_combout\,
	combout => \ramm|ram~64_combout\);

-- Location: LCCOMB_X35_Y14_N16
\ramm|ram~107\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~107_combout\ = (!\inst_mac|output[2]~3_combout\ & (\inst_mac|output[1]~0_combout\ & (\inst_mac|output[3]~2_combout\ & \inst_mac|output[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[2]~3_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[0]~1_combout\,
	combout => \ramm|ram~107_combout\);

-- Location: LCCOMB_X35_Y14_N10
\rtl~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~3_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~107_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~107_combout\,
	combout => \rtl~3_combout\);

-- Location: CLKCTRL_G18
\rtl~3clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~3clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~3clkctrl_outclk\);

-- Location: LCCOMB_X34_Y14_N22
\ramm|ram~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~44_combout\ = (GLOBAL(\rtl~3clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~3clkctrl_outclk\) & ((\ramm|ram~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \ramm|ram~44_combout\,
	datad => \rtl~3clkctrl_outclk\,
	combout => \ramm|ram~44_combout\);

-- Location: LCCOMB_X55_Y35_N4
\ramm|ram~104\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~104_combout\ = (!\inst_mac|output[0]~1_combout\ & (\inst_mac|output[1]~0_combout\ & (\inst_mac|output[3]~2_combout\ & !\inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~104_combout\);

-- Location: LCCOMB_X55_Y35_N6
\rtl~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~0_combout\ = (\ramm|ram~104_combout\ & \inst_ringBufferControl|CurrentState.Writing~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ramm|ram~104_combout\,
	datad => \inst_ringBufferControl|CurrentState.Writing~q\,
	combout => \rtl~0_combout\);

-- Location: CLKCTRL_G9
\rtl~0clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~0clkctrl_outclk\);

-- Location: LCCOMB_X35_Y13_N4
\ramm|ram~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~40_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\ramm|ram~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \ramm|ram~40_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \ramm|ram~40_combout\);

-- Location: LCCOMB_X35_Y14_N18
\ramm|ram~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~65_combout\ = (\ramm|ram~64_combout\ & ((\ramm|ram~44_combout\) # ((!\inst_mac|output[1]~0_combout\)))) # (!\ramm|ram~64_combout\ & (((\inst_mac|output[1]~0_combout\ & \ramm|ram~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~64_combout\,
	datab => \ramm|ram~44_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \ramm|ram~40_combout\,
	combout => \ramm|ram~65_combout\);

-- Location: LCCOMB_X35_Y27_N26
\ramm|ram~119\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~119_combout\ = (\inst_mac|output[3]~2_combout\ & (\inst_mac|output[1]~0_combout\ & (\inst_mac|output[2]~3_combout\ & \inst_mac|output[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[3]~2_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \inst_mac|output[2]~3_combout\,
	datad => \inst_mac|output[0]~1_combout\,
	combout => \ramm|ram~119_combout\);

-- Location: LCCOMB_X36_Y27_N16
\rtl~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~15_combout\ = (\ramm|ram~119_combout\ & \inst_ringBufferControl|CurrentState.Writing~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~119_combout\,
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	combout => \rtl~15_combout\);

-- Location: CLKCTRL_G16
\rtl~15clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~15clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~15clkctrl_outclk\);

-- Location: LCCOMB_X36_Y16_N8
\ramm|ram~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~60_combout\ = (GLOBAL(\rtl~15clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~15clkctrl_outclk\) & ((\ramm|ram~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \ramm|ram~60_combout\,
	datad => \rtl~15clkctrl_outclk\,
	combout => \ramm|ram~60_combout\);

-- Location: LCCOMB_X29_Y38_N18
\ramm|ram~116\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~116_combout\ = (\inst_mac|output[0]~1_combout\ & (\inst_mac|output[3]~2_combout\ & (!\inst_mac|output[1]~0_combout\ & \inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[3]~2_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~116_combout\);

-- Location: LCCOMB_X29_Y38_N14
\rtl~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~12_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~116_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~116_combout\,
	combout => \rtl~12_combout\);

-- Location: CLKCTRL_G3
\rtl~12clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~12clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~12clkctrl_outclk\);

-- Location: LCCOMB_X36_Y24_N16
\ramm|ram~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~52_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\ramm|ram~52_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \rtl~12clkctrl_outclk\,
	datad => \ramm|ram~52_combout\,
	combout => \ramm|ram~52_combout\);

-- Location: LCCOMB_X29_Y38_N20
\ramm|ram~118\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~118_combout\ = (!\inst_mac|output[0]~1_combout\ & (\inst_mac|output[3]~2_combout\ & (!\inst_mac|output[1]~0_combout\ & \inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[3]~2_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~118_combout\);

-- Location: LCCOMB_X29_Y38_N12
\rtl~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~14_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~118_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~118_combout\,
	combout => \rtl~14_combout\);

-- Location: CLKCTRL_G4
\rtl~14clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~14clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~14clkctrl_outclk\);

-- Location: LCCOMB_X36_Y24_N12
\ramm|ram~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~48_combout\ = (GLOBAL(\rtl~14clkctrl_outclk\) & ((\D[0]~input_o\))) # (!GLOBAL(\rtl~14clkctrl_outclk\) & (\ramm|ram~48_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~48_combout\,
	datab => \D[0]~input_o\,
	datad => \rtl~14clkctrl_outclk\,
	combout => \ramm|ram~48_combout\);

-- Location: LCCOMB_X29_Y38_N2
\ramm|ram~117\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~117_combout\ = (!\inst_mac|output[0]~1_combout\ & (\inst_mac|output[3]~2_combout\ & (\inst_mac|output[1]~0_combout\ & \inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[3]~2_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~117_combout\);

-- Location: LCCOMB_X29_Y38_N22
\rtl~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~13_combout\ = (\inst_ringBufferControl|CurrentState.Writing~q\ & \ramm|ram~117_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_ringBufferControl|CurrentState.Writing~q\,
	datad => \ramm|ram~117_combout\,
	combout => \rtl~13_combout\);

-- Location: CLKCTRL_G2
\rtl~13clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~13clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~13clkctrl_outclk\);

-- Location: LCCOMB_X36_Y24_N10
\ramm|ram~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~56_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\D[0]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\ramm|ram~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[0]~input_o\,
	datac => \rtl~13clkctrl_outclk\,
	datad => \ramm|ram~56_combout\,
	combout => \ramm|ram~56_combout\);

-- Location: LCCOMB_X36_Y24_N8
\ramm|ram~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~71_combout\ = (\inst_mac|output[0]~1_combout\ & (((\inst_mac|output[1]~0_combout\)))) # (!\inst_mac|output[0]~1_combout\ & ((\inst_mac|output[1]~0_combout\ & ((\ramm|ram~56_combout\))) # (!\inst_mac|output[1]~0_combout\ & 
-- (\ramm|ram~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~48_combout\,
	datab => \inst_mac|output[0]~1_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \ramm|ram~56_combout\,
	combout => \ramm|ram~71_combout\);

-- Location: LCCOMB_X36_Y24_N18
\ramm|ram~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~72_combout\ = (\ramm|ram~71_combout\ & ((\ramm|ram~60_combout\) # ((!\inst_mac|output[0]~1_combout\)))) # (!\ramm|ram~71_combout\ & (((\ramm|ram~52_combout\ & \inst_mac|output[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~60_combout\,
	datab => \ramm|ram~52_combout\,
	datac => \ramm|ram~71_combout\,
	datad => \inst_mac|output[0]~1_combout\,
	combout => \ramm|ram~72_combout\);

-- Location: LCCOMB_X35_Y14_N12
\ramm|ram~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~73_combout\ = (\ramm|ram~70_combout\ & (((\ramm|ram~72_combout\) # (!\inst_mac|output[3]~2_combout\)))) # (!\ramm|ram~70_combout\ & (\ramm|ram~65_combout\ & (\inst_mac|output[3]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~70_combout\,
	datab => \ramm|ram~65_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \ramm|ram~72_combout\,
	combout => \ramm|ram~73_combout\);

-- Location: IOIBUF_X29_Y39_N1
\D[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(1),
	o => \D[1]~input_o\);

-- Location: LCCOMB_X30_Y32_N16
\ramm|ram~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~53_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\ramm|ram~53_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[1]~input_o\,
	datac => \rtl~12clkctrl_outclk\,
	datad => \ramm|ram~53_combout\,
	combout => \ramm|ram~53_combout\);

-- Location: LCCOMB_X29_Y32_N24
\ramm|ram~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~21_combout\ = (GLOBAL(\rtl~4clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~4clkctrl_outclk\) & ((\ramm|ram~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datab => \ramm|ram~21_combout\,
	datad => \rtl~4clkctrl_outclk\,
	combout => \ramm|ram~21_combout\);

-- Location: LCCOMB_X31_Y34_N4
\ramm|ram~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~5_combout\ = (GLOBAL(\rtl~9clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~9clkctrl_outclk\) & ((\ramm|ram~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \ramm|ram~5_combout\,
	datad => \rtl~9clkctrl_outclk\,
	combout => \ramm|ram~5_combout\);

-- Location: LCCOMB_X30_Y32_N26
\ramm|ram~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~76_combout\ = (\inst_mac|output[3]~2_combout\ & (((\inst_mac|output[2]~3_combout\)))) # (!\inst_mac|output[3]~2_combout\ & ((\inst_mac|output[2]~3_combout\ & (\ramm|ram~21_combout\)) # (!\inst_mac|output[2]~3_combout\ & 
-- ((\ramm|ram~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[3]~2_combout\,
	datab => \ramm|ram~21_combout\,
	datac => \inst_mac|output[2]~3_combout\,
	datad => \ramm|ram~5_combout\,
	combout => \ramm|ram~76_combout\);

-- Location: LCCOMB_X30_Y33_N30
\ramm|ram~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~37_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\ramm|ram~37_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \ramm|ram~37_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \ramm|ram~37_combout\);

-- Location: LCCOMB_X30_Y32_N8
\ramm|ram~77\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~77_combout\ = (\inst_mac|output[3]~2_combout\ & ((\ramm|ram~76_combout\ & (\ramm|ram~53_combout\)) # (!\ramm|ram~76_combout\ & ((\ramm|ram~37_combout\))))) # (!\inst_mac|output[3]~2_combout\ & (((\ramm|ram~76_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[3]~2_combout\,
	datab => \ramm|ram~53_combout\,
	datac => \ramm|ram~76_combout\,
	datad => \ramm|ram~37_combout\,
	combout => \ramm|ram~77_combout\);

-- Location: LCCOMB_X29_Y32_N22
\ramm|ram~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~49_combout\ = (GLOBAL(\rtl~14clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~14clkctrl_outclk\) & ((\ramm|ram~49_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \ramm|ram~49_combout\,
	datad => \rtl~14clkctrl_outclk\,
	combout => \ramm|ram~49_combout\);

-- Location: LCCOMB_X31_Y34_N18
\ramm|ram~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~1_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\ramm|ram~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \rtl~10clkctrl_outclk\,
	datad => \ramm|ram~1_combout\,
	combout => \ramm|ram~1_combout\);

-- Location: LCCOMB_X30_Y35_N12
\ramm|ram~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~33_combout\ = (GLOBAL(\rtl~2clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~2clkctrl_outclk\) & ((\ramm|ram~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \rtl~2clkctrl_outclk\,
	datad => \ramm|ram~33_combout\,
	combout => \ramm|ram~33_combout\);

-- Location: LCCOMB_X30_Y32_N30
\ramm|ram~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~78_combout\ = (\inst_mac|output[3]~2_combout\ & (((\inst_mac|output[2]~3_combout\) # (\ramm|ram~33_combout\)))) # (!\inst_mac|output[3]~2_combout\ & (\ramm|ram~1_combout\ & (!\inst_mac|output[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[3]~2_combout\,
	datab => \ramm|ram~1_combout\,
	datac => \inst_mac|output[2]~3_combout\,
	datad => \ramm|ram~33_combout\,
	combout => \ramm|ram~78_combout\);

-- Location: LCCOMB_X30_Y31_N14
\ramm|ram~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~17_combout\ = (GLOBAL(\rtl~6clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~6clkctrl_outclk\) & ((\ramm|ram~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \ramm|ram~17_combout\,
	datad => \rtl~6clkctrl_outclk\,
	combout => \ramm|ram~17_combout\);

-- Location: LCCOMB_X30_Y32_N12
\ramm|ram~79\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~79_combout\ = (\inst_mac|output[2]~3_combout\ & ((\ramm|ram~78_combout\ & (\ramm|ram~49_combout\)) # (!\ramm|ram~78_combout\ & ((\ramm|ram~17_combout\))))) # (!\inst_mac|output[2]~3_combout\ & (((\ramm|ram~78_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[2]~3_combout\,
	datab => \ramm|ram~49_combout\,
	datac => \ramm|ram~78_combout\,
	datad => \ramm|ram~17_combout\,
	combout => \ramm|ram~79_combout\);

-- Location: LCCOMB_X30_Y32_N10
\ramm|ram~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~80_combout\ = (\inst_mac|output[1]~0_combout\ & (\inst_mac|output[0]~1_combout\)) # (!\inst_mac|output[1]~0_combout\ & ((\inst_mac|output[0]~1_combout\ & (\ramm|ram~77_combout\)) # (!\inst_mac|output[0]~1_combout\ & ((\ramm|ram~79_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[1]~0_combout\,
	datab => \inst_mac|output[0]~1_combout\,
	datac => \ramm|ram~77_combout\,
	datad => \ramm|ram~79_combout\,
	combout => \ramm|ram~80_combout\);

-- Location: LCCOMB_X30_Y33_N4
\ramm|ram~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~57_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\ramm|ram~57_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \ramm|ram~57_combout\,
	datad => \rtl~13clkctrl_outclk\,
	combout => \ramm|ram~57_combout\);

-- Location: LCCOMB_X30_Y32_N22
\ramm|ram~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~25_combout\ = (GLOBAL(\rtl~5clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~5clkctrl_outclk\) & ((\ramm|ram~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[1]~input_o\,
	datac => \ramm|ram~25_combout\,
	datad => \rtl~5clkctrl_outclk\,
	combout => \ramm|ram~25_combout\);

-- Location: LCCOMB_X30_Y31_N30
\ramm|ram~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~41_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\ramm|ram~41_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \ramm|ram~41_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \ramm|ram~41_combout\);

-- Location: LCCOMB_X30_Y31_N28
\ramm|ram~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~9_combout\ = (GLOBAL(\rtl~8clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~8clkctrl_outclk\) & ((\ramm|ram~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \rtl~8clkctrl_outclk\,
	datad => \ramm|ram~9_combout\,
	combout => \ramm|ram~9_combout\);

-- Location: LCCOMB_X30_Y31_N20
\ramm|ram~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~74_combout\ = (\inst_mac|output[3]~2_combout\ & ((\ramm|ram~41_combout\) # ((\inst_mac|output[2]~3_combout\)))) # (!\inst_mac|output[3]~2_combout\ & (((\ramm|ram~9_combout\ & !\inst_mac|output[2]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~41_combout\,
	datab => \ramm|ram~9_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~74_combout\);

-- Location: LCCOMB_X30_Y32_N28
\ramm|ram~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~75_combout\ = (\inst_mac|output[2]~3_combout\ & ((\ramm|ram~74_combout\ & (\ramm|ram~57_combout\)) # (!\ramm|ram~74_combout\ & ((\ramm|ram~25_combout\))))) # (!\inst_mac|output[2]~3_combout\ & (((\ramm|ram~74_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[2]~3_combout\,
	datab => \ramm|ram~57_combout\,
	datac => \ramm|ram~25_combout\,
	datad => \ramm|ram~74_combout\,
	combout => \ramm|ram~75_combout\);

-- Location: LCCOMB_X29_Y32_N28
\ramm|ram~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~61_combout\ = (GLOBAL(\rtl~15clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~15clkctrl_outclk\) & ((\ramm|ram~61_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \rtl~15clkctrl_outclk\,
	datad => \ramm|ram~61_combout\,
	combout => \ramm|ram~61_combout\);

-- Location: LCCOMB_X30_Y36_N8
\ramm|ram~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~45_combout\ = (GLOBAL(\rtl~3clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~3clkctrl_outclk\) & ((\ramm|ram~45_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[1]~input_o\,
	datac => \ramm|ram~45_combout\,
	datad => \rtl~3clkctrl_outclk\,
	combout => \ramm|ram~45_combout\);

-- Location: LCCOMB_X30_Y32_N14
\ramm|ram~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~29_combout\ = (GLOBAL(\rtl~7clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~7clkctrl_outclk\) & ((\ramm|ram~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[1]~input_o\,
	datac => \ramm|ram~29_combout\,
	datad => \rtl~7clkctrl_outclk\,
	combout => \ramm|ram~29_combout\);

-- Location: LCCOMB_X30_Y35_N30
\ramm|ram~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~13_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\D[1]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\ramm|ram~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[1]~input_o\,
	datac => \ramm|ram~13_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \ramm|ram~13_combout\);

-- Location: LCCOMB_X30_Y32_N24
\ramm|ram~81\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~81_combout\ = (\inst_mac|output[3]~2_combout\ & (((\inst_mac|output[2]~3_combout\)))) # (!\inst_mac|output[3]~2_combout\ & ((\inst_mac|output[2]~3_combout\ & (\ramm|ram~29_combout\)) # (!\inst_mac|output[2]~3_combout\ & 
-- ((\ramm|ram~13_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[3]~2_combout\,
	datab => \ramm|ram~29_combout\,
	datac => \inst_mac|output[2]~3_combout\,
	datad => \ramm|ram~13_combout\,
	combout => \ramm|ram~81_combout\);

-- Location: LCCOMB_X30_Y32_N18
\ramm|ram~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~82_combout\ = (\inst_mac|output[3]~2_combout\ & ((\ramm|ram~81_combout\ & (\ramm|ram~61_combout\)) # (!\ramm|ram~81_combout\ & ((\ramm|ram~45_combout\))))) # (!\inst_mac|output[3]~2_combout\ & (((\ramm|ram~81_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~61_combout\,
	datab => \ramm|ram~45_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \ramm|ram~81_combout\,
	combout => \ramm|ram~82_combout\);

-- Location: LCCOMB_X30_Y32_N20
\ramm|ram~83\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~83_combout\ = (\ramm|ram~80_combout\ & (((\ramm|ram~82_combout\) # (!\inst_mac|output[1]~0_combout\)))) # (!\ramm|ram~80_combout\ & (\ramm|ram~75_combout\ & (\inst_mac|output[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~80_combout\,
	datab => \ramm|ram~75_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \ramm|ram~82_combout\,
	combout => \ramm|ram~83_combout\);

-- Location: IOIBUF_X36_Y39_N29
\D[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(2),
	o => \D[2]~input_o\);

-- Location: LCCOMB_X40_Y32_N22
\ramm|ram~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~62_combout\ = (GLOBAL(\rtl~15clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~15clkctrl_outclk\) & ((\ramm|ram~62_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \ramm|ram~62_combout\,
	datad => \rtl~15clkctrl_outclk\,
	combout => \ramm|ram~62_combout\);

-- Location: LCCOMB_X41_Y35_N28
\ramm|ram~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~50_combout\ = (GLOBAL(\rtl~14clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~14clkctrl_outclk\) & ((\ramm|ram~50_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \rtl~14clkctrl_outclk\,
	datad => \ramm|ram~50_combout\,
	combout => \ramm|ram~50_combout\);

-- Location: LCCOMB_X43_Y32_N28
\ramm|ram~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~54_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\ramm|ram~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \rtl~12clkctrl_outclk\,
	datad => \ramm|ram~54_combout\,
	combout => \ramm|ram~54_combout\);

-- Location: LCCOMB_X41_Y36_N26
\ramm|ram~91\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~91_combout\ = (\inst_mac|output[0]~1_combout\ & (((\inst_mac|output[1]~0_combout\) # (\ramm|ram~54_combout\)))) # (!\inst_mac|output[0]~1_combout\ & (\ramm|ram~50_combout\ & (!\inst_mac|output[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~50_combout\,
	datab => \inst_mac|output[0]~1_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \ramm|ram~54_combout\,
	combout => \ramm|ram~91_combout\);

-- Location: LCCOMB_X41_Y38_N16
\ramm|ram~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~58_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\ramm|ram~58_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \rtl~13clkctrl_outclk\,
	datad => \ramm|ram~58_combout\,
	combout => \ramm|ram~58_combout\);

-- Location: LCCOMB_X41_Y36_N12
\ramm|ram~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~92_combout\ = (\inst_mac|output[1]~0_combout\ & ((\ramm|ram~91_combout\ & (\ramm|ram~62_combout\)) # (!\ramm|ram~91_combout\ & ((\ramm|ram~58_combout\))))) # (!\inst_mac|output[1]~0_combout\ & (((\ramm|ram~91_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[1]~0_combout\,
	datab => \ramm|ram~62_combout\,
	datac => \ramm|ram~91_combout\,
	datad => \ramm|ram~58_combout\,
	combout => \ramm|ram~92_combout\);

-- Location: LCCOMB_X42_Y36_N30
\ramm|ram~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~46_combout\ = (GLOBAL(\rtl~3clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~3clkctrl_outclk\) & ((\ramm|ram~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \ramm|ram~46_combout\,
	datad => \rtl~3clkctrl_outclk\,
	combout => \ramm|ram~46_combout\);

-- Location: LCCOMB_X41_Y36_N20
\ramm|ram~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~38_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\ramm|ram~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[2]~input_o\,
	datab => \ramm|ram~38_combout\,
	datad => \rtl~1clkctrl_outclk\,
	combout => \ramm|ram~38_combout\);

-- Location: LCCOMB_X41_Y35_N10
\ramm|ram~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~34_combout\ = (GLOBAL(\rtl~2clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~2clkctrl_outclk\) & ((\ramm|ram~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \rtl~2clkctrl_outclk\,
	datad => \ramm|ram~34_combout\,
	combout => \ramm|ram~34_combout\);

-- Location: LCCOMB_X41_Y35_N8
\ramm|ram~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~42_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\ramm|ram~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \ramm|ram~42_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \ramm|ram~42_combout\);

-- Location: LCCOMB_X41_Y36_N4
\ramm|ram~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~86_combout\ = (\inst_mac|output[0]~1_combout\ & (((\inst_mac|output[1]~0_combout\)))) # (!\inst_mac|output[0]~1_combout\ & ((\inst_mac|output[1]~0_combout\ & ((\ramm|ram~42_combout\))) # (!\inst_mac|output[1]~0_combout\ & 
-- (\ramm|ram~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~34_combout\,
	datab => \inst_mac|output[0]~1_combout\,
	datac => \inst_mac|output[1]~0_combout\,
	datad => \ramm|ram~42_combout\,
	combout => \ramm|ram~86_combout\);

-- Location: LCCOMB_X41_Y36_N22
\ramm|ram~87\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~87_combout\ = (\inst_mac|output[0]~1_combout\ & ((\ramm|ram~86_combout\ & (\ramm|ram~46_combout\)) # (!\ramm|ram~86_combout\ & ((\ramm|ram~38_combout\))))) # (!\inst_mac|output[0]~1_combout\ & (((\ramm|ram~86_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~46_combout\,
	datab => \ramm|ram~38_combout\,
	datac => \inst_mac|output[0]~1_combout\,
	datad => \ramm|ram~86_combout\,
	combout => \ramm|ram~87_combout\);

-- Location: LCCOMB_X43_Y38_N18
\ramm|ram~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~14_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\ramm|ram~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \rtl~11clkctrl_outclk\,
	datad => \ramm|ram~14_combout\,
	combout => \ramm|ram~14_combout\);

-- Location: LCCOMB_X43_Y34_N16
\ramm|ram~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~6_combout\ = (GLOBAL(\rtl~9clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~9clkctrl_outclk\) & ((\ramm|ram~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \rtl~9clkctrl_outclk\,
	datad => \ramm|ram~6_combout\,
	combout => \ramm|ram~6_combout\);

-- Location: LCCOMB_X43_Y38_N8
\ramm|ram~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~10_combout\ = (GLOBAL(\rtl~8clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~8clkctrl_outclk\) & ((\ramm|ram~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \ramm|ram~10_combout\,
	datad => \rtl~8clkctrl_outclk\,
	combout => \ramm|ram~10_combout\);

-- Location: LCCOMB_X43_Y34_N14
\ramm|ram~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~2_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\ramm|ram~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \ramm|ram~2_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \ramm|ram~2_combout\);

-- Location: LCCOMB_X44_Y35_N28
\ramm|ram~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~88_combout\ = (\inst_mac|output[0]~1_combout\ & (\inst_mac|output[1]~0_combout\)) # (!\inst_mac|output[0]~1_combout\ & ((\inst_mac|output[1]~0_combout\ & (\ramm|ram~10_combout\)) # (!\inst_mac|output[1]~0_combout\ & ((\ramm|ram~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \ramm|ram~10_combout\,
	datad => \ramm|ram~2_combout\,
	combout => \ramm|ram~88_combout\);

-- Location: LCCOMB_X44_Y35_N30
\ramm|ram~89\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~89_combout\ = (\inst_mac|output[0]~1_combout\ & ((\ramm|ram~88_combout\ & (\ramm|ram~14_combout\)) # (!\ramm|ram~88_combout\ & ((\ramm|ram~6_combout\))))) # (!\inst_mac|output[0]~1_combout\ & (((\ramm|ram~88_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[0]~1_combout\,
	datab => \ramm|ram~14_combout\,
	datac => \ramm|ram~6_combout\,
	datad => \ramm|ram~88_combout\,
	combout => \ramm|ram~89_combout\);

-- Location: LCCOMB_X41_Y36_N24
\ramm|ram~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~90_combout\ = (\inst_mac|output[3]~2_combout\ & ((\inst_mac|output[2]~3_combout\) # ((\ramm|ram~87_combout\)))) # (!\inst_mac|output[3]~2_combout\ & (!\inst_mac|output[2]~3_combout\ & ((\ramm|ram~89_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[3]~2_combout\,
	datab => \inst_mac|output[2]~3_combout\,
	datac => \ramm|ram~87_combout\,
	datad => \ramm|ram~89_combout\,
	combout => \ramm|ram~90_combout\);

-- Location: LCCOMB_X42_Y36_N8
\ramm|ram~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~30_combout\ = (GLOBAL(\rtl~7clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~7clkctrl_outclk\) & ((\ramm|ram~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \ramm|ram~30_combout\,
	datad => \rtl~7clkctrl_outclk\,
	combout => \ramm|ram~30_combout\);

-- Location: LCCOMB_X40_Y32_N20
\ramm|ram~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~22_combout\ = (GLOBAL(\rtl~4clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~4clkctrl_outclk\) & ((\ramm|ram~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[2]~input_o\,
	datac => \rtl~4clkctrl_outclk\,
	datad => \ramm|ram~22_combout\,
	combout => \ramm|ram~22_combout\);

-- Location: LCCOMB_X41_Y36_N2
\ramm|ram~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~18_combout\ = (GLOBAL(\rtl~6clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~6clkctrl_outclk\) & ((\ramm|ram~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[2]~input_o\,
	datac => \rtl~6clkctrl_outclk\,
	datad => \ramm|ram~18_combout\,
	combout => \ramm|ram~18_combout\);

-- Location: LCCOMB_X41_Y36_N8
\ramm|ram~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~84_combout\ = (\inst_mac|output[1]~0_combout\ & (((\inst_mac|output[0]~1_combout\)))) # (!\inst_mac|output[1]~0_combout\ & ((\inst_mac|output[0]~1_combout\ & (\ramm|ram~22_combout\)) # (!\inst_mac|output[0]~1_combout\ & 
-- ((\ramm|ram~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[1]~0_combout\,
	datab => \ramm|ram~22_combout\,
	datac => \inst_mac|output[0]~1_combout\,
	datad => \ramm|ram~18_combout\,
	combout => \ramm|ram~84_combout\);

-- Location: LCCOMB_X41_Y36_N16
\ramm|ram~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~26_combout\ = (GLOBAL(\rtl~5clkctrl_outclk\) & (\D[2]~input_o\)) # (!GLOBAL(\rtl~5clkctrl_outclk\) & ((\ramm|ram~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[2]~input_o\,
	datac => \rtl~5clkctrl_outclk\,
	datad => \ramm|ram~26_combout\,
	combout => \ramm|ram~26_combout\);

-- Location: LCCOMB_X41_Y36_N18
\ramm|ram~85\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~85_combout\ = (\inst_mac|output[1]~0_combout\ & ((\ramm|ram~84_combout\ & (\ramm|ram~30_combout\)) # (!\ramm|ram~84_combout\ & ((\ramm|ram~26_combout\))))) # (!\inst_mac|output[1]~0_combout\ & (((\ramm|ram~84_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[1]~0_combout\,
	datab => \ramm|ram~30_combout\,
	datac => \ramm|ram~84_combout\,
	datad => \ramm|ram~26_combout\,
	combout => \ramm|ram~85_combout\);

-- Location: LCCOMB_X41_Y36_N10
\ramm|ram~93\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~93_combout\ = (\ramm|ram~90_combout\ & ((\ramm|ram~92_combout\) # ((!\inst_mac|output[2]~3_combout\)))) # (!\ramm|ram~90_combout\ & (((\inst_mac|output[2]~3_combout\ & \ramm|ram~85_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~92_combout\,
	datab => \ramm|ram~90_combout\,
	datac => \inst_mac|output[2]~3_combout\,
	datad => \ramm|ram~85_combout\,
	combout => \ramm|ram~93_combout\);

-- Location: IOIBUF_X26_Y39_N8
\D[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D(3),
	o => \D[3]~input_o\);

-- Location: LCCOMB_X26_Y34_N14
\ramm|ram~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~3_combout\ = (GLOBAL(\rtl~10clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~10clkctrl_outclk\) & ((\ramm|ram~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \ramm|ram~3_combout\,
	datad => \rtl~10clkctrl_outclk\,
	combout => \ramm|ram~3_combout\);

-- Location: LCCOMB_X26_Y36_N2
\ramm|ram~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~19_combout\ = (GLOBAL(\rtl~6clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~6clkctrl_outclk\) & ((\ramm|ram~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \rtl~6clkctrl_outclk\,
	datad => \ramm|ram~19_combout\,
	combout => \ramm|ram~19_combout\);

-- Location: LCCOMB_X26_Y35_N8
\ramm|ram~98\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~98_combout\ = (\inst_mac|output[3]~2_combout\ & (((\inst_mac|output[2]~3_combout\)))) # (!\inst_mac|output[3]~2_combout\ & ((\inst_mac|output[2]~3_combout\ & ((\ramm|ram~19_combout\))) # (!\inst_mac|output[2]~3_combout\ & 
-- (\ramm|ram~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~3_combout\,
	datab => \ramm|ram~19_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~98_combout\);

-- Location: LCCOMB_X26_Y35_N4
\ramm|ram~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~51_combout\ = (GLOBAL(\rtl~14clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~14clkctrl_outclk\) & ((\ramm|ram~51_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \ramm|ram~51_combout\,
	datad => \rtl~14clkctrl_outclk\,
	combout => \ramm|ram~51_combout\);

-- Location: LCCOMB_X27_Y35_N24
\ramm|ram~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~35_combout\ = (GLOBAL(\rtl~2clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~2clkctrl_outclk\) & ((\ramm|ram~35_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[3]~input_o\,
	datac => \rtl~2clkctrl_outclk\,
	datad => \ramm|ram~35_combout\,
	combout => \ramm|ram~35_combout\);

-- Location: LCCOMB_X26_Y35_N22
\ramm|ram~99\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~99_combout\ = (\inst_mac|output[3]~2_combout\ & ((\ramm|ram~98_combout\ & (\ramm|ram~51_combout\)) # (!\ramm|ram~98_combout\ & ((\ramm|ram~35_combout\))))) # (!\inst_mac|output[3]~2_combout\ & (\ramm|ram~98_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[3]~2_combout\,
	datab => \ramm|ram~98_combout\,
	datac => \ramm|ram~51_combout\,
	datad => \ramm|ram~35_combout\,
	combout => \ramm|ram~99_combout\);

-- Location: LCCOMB_X26_Y35_N10
\ramm|ram~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~43_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\ramm|ram~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \rtl~0clkctrl_outclk\,
	datad => \ramm|ram~43_combout\,
	combout => \ramm|ram~43_combout\);

-- Location: LCCOMB_X26_Y36_N28
\ramm|ram~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~27_combout\ = (GLOBAL(\rtl~5clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~5clkctrl_outclk\) & ((\ramm|ram~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \rtl~5clkctrl_outclk\,
	datad => \ramm|ram~27_combout\,
	combout => \ramm|ram~27_combout\);

-- Location: LCCOMB_X27_Y38_N16
\ramm|ram~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~11_combout\ = (GLOBAL(\rtl~8clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~8clkctrl_outclk\) & ((\ramm|ram~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datab => \ramm|ram~11_combout\,
	datad => \rtl~8clkctrl_outclk\,
	combout => \ramm|ram~11_combout\);

-- Location: LCCOMB_X26_Y35_N28
\ramm|ram~96\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~96_combout\ = (\inst_mac|output[3]~2_combout\ & (((\inst_mac|output[2]~3_combout\)))) # (!\inst_mac|output[3]~2_combout\ & ((\inst_mac|output[2]~3_combout\ & (\ramm|ram~27_combout\)) # (!\inst_mac|output[2]~3_combout\ & 
-- ((\ramm|ram~11_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~27_combout\,
	datab => \ramm|ram~11_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~96_combout\);

-- Location: LCCOMB_X27_Y38_N18
\ramm|ram~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~59_combout\ = (GLOBAL(\rtl~13clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~13clkctrl_outclk\) & ((\ramm|ram~59_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \rtl~13clkctrl_outclk\,
	datad => \ramm|ram~59_combout\,
	combout => \ramm|ram~59_combout\);

-- Location: LCCOMB_X26_Y35_N18
\ramm|ram~97\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~97_combout\ = (\ramm|ram~96_combout\ & (((\ramm|ram~59_combout\) # (!\inst_mac|output[3]~2_combout\)))) # (!\ramm|ram~96_combout\ & (\ramm|ram~43_combout\ & (\inst_mac|output[3]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~43_combout\,
	datab => \ramm|ram~96_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \ramm|ram~59_combout\,
	combout => \ramm|ram~97_combout\);

-- Location: LCCOMB_X26_Y35_N12
\ramm|ram~100\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~100_combout\ = (\inst_mac|output[1]~0_combout\ & (((\inst_mac|output[0]~1_combout\) # (\ramm|ram~97_combout\)))) # (!\inst_mac|output[1]~0_combout\ & (\ramm|ram~99_combout\ & (!\inst_mac|output[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~99_combout\,
	datab => \inst_mac|output[1]~0_combout\,
	datac => \inst_mac|output[0]~1_combout\,
	datad => \ramm|ram~97_combout\,
	combout => \ramm|ram~100_combout\);

-- Location: LCCOMB_X26_Y32_N0
\ramm|ram~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~23_combout\ = (GLOBAL(\rtl~4clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~4clkctrl_outclk\) & ((\ramm|ram~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[3]~input_o\,
	datac => \rtl~4clkctrl_outclk\,
	datad => \ramm|ram~23_combout\,
	combout => \ramm|ram~23_combout\);

-- Location: LCCOMB_X31_Y32_N24
\ramm|ram~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~55_combout\ = (GLOBAL(\rtl~12clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~12clkctrl_outclk\) & ((\ramm|ram~55_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \rtl~12clkctrl_outclk\,
	datad => \ramm|ram~55_combout\,
	combout => \ramm|ram~55_combout\);

-- Location: LCCOMB_X26_Y34_N20
\ramm|ram~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~7_combout\ = (GLOBAL(\rtl~9clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~9clkctrl_outclk\) & ((\ramm|ram~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \rtl~9clkctrl_outclk\,
	datad => \ramm|ram~7_combout\,
	combout => \ramm|ram~7_combout\);

-- Location: LCCOMB_X26_Y33_N16
\ramm|ram~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~39_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\ramm|ram~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[3]~input_o\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \ramm|ram~39_combout\,
	combout => \ramm|ram~39_combout\);

-- Location: LCCOMB_X26_Y33_N28
\ramm|ram~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~94_combout\ = (\inst_mac|output[2]~3_combout\ & (((\inst_mac|output[3]~2_combout\)))) # (!\inst_mac|output[2]~3_combout\ & ((\inst_mac|output[3]~2_combout\ & ((\ramm|ram~39_combout\))) # (!\inst_mac|output[3]~2_combout\ & 
-- (\ramm|ram~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~7_combout\,
	datab => \ramm|ram~39_combout\,
	datac => \inst_mac|output[2]~3_combout\,
	datad => \inst_mac|output[3]~2_combout\,
	combout => \ramm|ram~94_combout\);

-- Location: LCCOMB_X26_Y33_N2
\ramm|ram~95\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~95_combout\ = (\inst_mac|output[2]~3_combout\ & ((\ramm|ram~94_combout\ & ((\ramm|ram~55_combout\))) # (!\ramm|ram~94_combout\ & (\ramm|ram~23_combout\)))) # (!\inst_mac|output[2]~3_combout\ & (((\ramm|ram~94_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[2]~3_combout\,
	datab => \ramm|ram~23_combout\,
	datac => \ramm|ram~55_combout\,
	datad => \ramm|ram~94_combout\,
	combout => \ramm|ram~95_combout\);

-- Location: LCCOMB_X31_Y32_N22
\ramm|ram~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~31_combout\ = (GLOBAL(\rtl~7clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~7clkctrl_outclk\) & ((\ramm|ram~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \ramm|ram~31_combout\,
	datad => \rtl~7clkctrl_outclk\,
	combout => \ramm|ram~31_combout\);

-- Location: LCCOMB_X31_Y32_N4
\ramm|ram~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~63_combout\ = (GLOBAL(\rtl~15clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~15clkctrl_outclk\) & ((\ramm|ram~63_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \ramm|ram~63_combout\,
	datad => \rtl~15clkctrl_outclk\,
	combout => \ramm|ram~63_combout\);

-- Location: LCCOMB_X26_Y36_N8
\ramm|ram~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~47_combout\ = (GLOBAL(\rtl~3clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~3clkctrl_outclk\) & ((\ramm|ram~47_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D[3]~input_o\,
	datac => \ramm|ram~47_combout\,
	datad => \rtl~3clkctrl_outclk\,
	combout => \ramm|ram~47_combout\);

-- Location: LCCOMB_X27_Y35_N22
\ramm|ram~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~15_combout\ = (GLOBAL(\rtl~11clkctrl_outclk\) & (\D[3]~input_o\)) # (!GLOBAL(\rtl~11clkctrl_outclk\) & ((\ramm|ram~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D[3]~input_o\,
	datac => \ramm|ram~15_combout\,
	datad => \rtl~11clkctrl_outclk\,
	combout => \ramm|ram~15_combout\);

-- Location: LCCOMB_X26_Y35_N30
\ramm|ram~101\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~101_combout\ = (\inst_mac|output[3]~2_combout\ & ((\ramm|ram~47_combout\) # ((\inst_mac|output[2]~3_combout\)))) # (!\inst_mac|output[3]~2_combout\ & (((\ramm|ram~15_combout\ & !\inst_mac|output[2]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~47_combout\,
	datab => \ramm|ram~15_combout\,
	datac => \inst_mac|output[3]~2_combout\,
	datad => \inst_mac|output[2]~3_combout\,
	combout => \ramm|ram~101_combout\);

-- Location: LCCOMB_X27_Y32_N4
\ramm|ram~102\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~102_combout\ = (\inst_mac|output[2]~3_combout\ & ((\ramm|ram~101_combout\ & ((\ramm|ram~63_combout\))) # (!\ramm|ram~101_combout\ & (\ramm|ram~31_combout\)))) # (!\inst_mac|output[2]~3_combout\ & (((\ramm|ram~101_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_mac|output[2]~3_combout\,
	datab => \ramm|ram~31_combout\,
	datac => \ramm|ram~63_combout\,
	datad => \ramm|ram~101_combout\,
	combout => \ramm|ram~102_combout\);

-- Location: LCCOMB_X26_Y35_N20
\ramm|ram~103\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ramm|ram~103_combout\ = (\ramm|ram~100_combout\ & (((\ramm|ram~102_combout\) # (!\inst_mac|output[0]~1_combout\)))) # (!\ramm|ram~100_combout\ & (\ramm|ram~95_combout\ & (\inst_mac|output[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ramm|ram~100_combout\,
	datab => \ramm|ram~95_combout\,
	datac => \inst_mac|output[0]~1_combout\,
	datad => \ramm|ram~102_combout\,
	combout => \ramm|ram~103_combout\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_Q(0) <= \Q[0]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(2) <= \Q[2]~output_o\;

ww_Q(3) <= \Q[3]~output_o\;

ww_Wreg <= \Wreg~output_o\;

ww_DAC <= \DAC~output_o\;
END structure;


