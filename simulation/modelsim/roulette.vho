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

-- DATE "03/18/2025 08:59:20"

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

ENTITY 	Key_decode IS
    PORT (
	Kack : IN std_logic;
	Liness : IN std_logic_vector(3 DOWNTO 0);
	CLK : IN std_logic;
	Reset : IN std_logic;
	Colss : BUFFER std_logic_vector(3 DOWNTO 0);
	Kout : BUFFER std_logic_vector(3 DOWNTO 0);
	Kval : BUFFER std_logic
	);
END Key_decode;

-- Design Ports Information
-- Colss[0]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Colss[1]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Colss[2]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Colss[3]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kout[0]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kout[1]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kout[2]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kout[3]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kval	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Liness[3]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Liness[1]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Liness[2]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kack	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Liness[0]	=>  Location: PIN_W5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Key_decode IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Kack : std_logic;
SIGNAL ww_Liness : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_CLK : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_Colss : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Kout : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Kval : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \keycontrols|CurrentState.State_Scan_Lines~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \Colss[0]~output_o\ : std_logic;
SIGNAL \Colss[1]~output_o\ : std_logic;
SIGNAL \Colss[2]~output_o\ : std_logic;
SIGNAL \Colss[3]~output_o\ : std_logic;
SIGNAL \Kout[0]~output_o\ : std_logic;
SIGNAL \Kout[1]~output_o\ : std_logic;
SIGNAL \Kout[2]~output_o\ : std_logic;
SIGNAL \Kout[3]~output_o\ : std_logic;
SIGNAL \Kval~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \Liness[0]~input_o\ : std_logic;
SIGNAL \Liness[1]~input_o\ : std_logic;
SIGNAL \Liness[3]~input_o\ : std_logic;
SIGNAL \Liness[2]~input_o\ : std_logic;
SIGNAL \keycontrols|Selector0~9_combout\ : std_logic;
SIGNAL \Kack~input_o\ : std_logic;
SIGNAL \keyscan|Penc|PencPartial3|GS~0_combout\ : std_logic;
SIGNAL \keyscan|Penc|PencPartial3|GS~1_combout\ : std_logic;
SIGNAL \keycontrols|NextState.State_Scan_Lines~4_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \keycontrols|CurrentState.State_Scan_Lines~q\ : std_logic;
SIGNAL \keycontrols|Selector1~0_combout\ : std_logic;
SIGNAL \keycontrols|CurrentState.State_Val~feeder_combout\ : std_logic;
SIGNAL \keycontrols|CurrentState.State_Val~q\ : std_logic;
SIGNAL \keycontrols|Selector2~0_combout\ : std_logic;
SIGNAL \keycontrols|CurrentState.State_Ack_Waiting~q\ : std_logic;
SIGNAL \keycontrols|Selector0~8_combout\ : std_logic;
SIGNAL \keycontrols|CurrentState.State_Scan_Columns~q\ : std_logic;
SIGNAL \keyscan|Contador|instance_registry_2bits|FFD1|Q~0_combout\ : std_logic;
SIGNAL \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\ : std_logic;
SIGNAL \keyscan|Contador|instance_registry_2bits|FFD2|Q~0_combout\ : std_logic;
SIGNAL \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\ : std_logic;
SIGNAL \keyscan|Decoder|Y[2]~0_combout\ : std_logic;
SIGNAL \keyscan|Decoder|Y[2]~1_combout\ : std_logic;
SIGNAL \keyscan|Decoder|Y[2]~2_combout\ : std_logic;
SIGNAL \keycontrols|CurrentState.State_Scan_Lines~clkctrl_outclk\ : std_logic;
SIGNAL \keyscan|Penc|Mux2x1|result~0_combout\ : std_logic;
SIGNAL \keyscan|Reg|FFD1|Q~q\ : std_logic;
SIGNAL \keyscan|Penc|PencPartial1|GS~0_combout\ : std_logic;
SIGNAL \keyscan|Reg|FFD2|Q~q\ : std_logic;
SIGNAL \keyscan|Decoder|Y\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Reset~input_o\ : std_logic;
SIGNAL \keyscan|Decoder|ALT_INV_Y[2]~2_combout\ : std_logic;
SIGNAL \keyscan|Decoder|ALT_INV_Y[2]~1_combout\ : std_logic;
SIGNAL \keyscan|Decoder|ALT_INV_Y[2]~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_Kack <= Kack;
ww_Liness <= Liness;
ww_CLK <= CLK;
ww_Reset <= Reset;
Colss <= ww_Colss;
Kout <= ww_Kout;
Kval <= ww_Kval;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\keycontrols|CurrentState.State_Scan_Lines~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \keycontrols|CurrentState.State_Scan_Lines~q\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
\ALT_INV_Reset~input_o\ <= NOT \Reset~input_o\;
\keyscan|Decoder|ALT_INV_Y[2]~2_combout\ <= NOT \keyscan|Decoder|Y[2]~2_combout\;
\keyscan|Decoder|ALT_INV_Y[2]~1_combout\ <= NOT \keyscan|Decoder|Y[2]~1_combout\;
\keyscan|Decoder|ALT_INV_Y[2]~0_combout\ <= NOT \keyscan|Decoder|Y[2]~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y52_N4
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

-- Location: IOOBUF_X38_Y0_N9
\Colss[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyscan|Decoder|ALT_INV_Y[2]~0_combout\,
	devoe => ww_devoe,
	o => \Colss[0]~output_o\);

-- Location: IOOBUF_X38_Y0_N16
\Colss[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyscan|Decoder|ALT_INV_Y[2]~1_combout\,
	devoe => ww_devoe,
	o => \Colss[1]~output_o\);

-- Location: IOOBUF_X34_Y0_N23
\Colss[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyscan|Decoder|ALT_INV_Y[2]~2_combout\,
	devoe => ww_devoe,
	o => \Colss[2]~output_o\);

-- Location: IOOBUF_X31_Y0_N16
\Colss[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyscan|Decoder|Y\(0),
	devoe => ww_devoe,
	o => \Colss[3]~output_o\);

-- Location: IOOBUF_X46_Y54_N2
\Kout[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyscan|Reg|FFD1|Q~q\,
	devoe => ww_devoe,
	o => \Kout[0]~output_o\);

-- Location: IOOBUF_X46_Y54_N23
\Kout[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyscan|Reg|FFD2|Q~q\,
	devoe => ww_devoe,
	o => \Kout[1]~output_o\);

-- Location: IOOBUF_X51_Y54_N16
\Kout[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\,
	devoe => ww_devoe,
	o => \Kout[2]~output_o\);

-- Location: IOOBUF_X46_Y54_N9
\Kout[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\,
	devoe => ww_devoe,
	o => \Kout[3]~output_o\);

-- Location: IOOBUF_X46_Y0_N2
\Kval~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keycontrols|CurrentState.State_Val~q\,
	devoe => ww_devoe,
	o => \Kval~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\CLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G19
\CLK~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X14_Y0_N1
\Liness[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Liness(0),
	o => \Liness[0]~input_o\);

-- Location: IOIBUF_X51_Y0_N22
\Liness[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Liness(1),
	o => \Liness[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N22
\Liness[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Liness(3),
	o => \Liness[3]~input_o\);

-- Location: IOIBUF_X46_Y0_N8
\Liness[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Liness(2),
	o => \Liness[2]~input_o\);

-- Location: LCCOMB_X45_Y4_N22
\keycontrols|Selector0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keycontrols|Selector0~9_combout\ = (\Liness[0]~input_o\ & (\Liness[1]~input_o\ & (\Liness[3]~input_o\ & \Liness[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Liness[0]~input_o\,
	datab => \Liness[1]~input_o\,
	datac => \Liness[3]~input_o\,
	datad => \Liness[2]~input_o\,
	combout => \keycontrols|Selector0~9_combout\);

-- Location: IOIBUF_X51_Y54_N29
\Kack~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Kack,
	o => \Kack~input_o\);

-- Location: LCCOMB_X45_Y4_N26
\keyscan|Penc|PencPartial3|GS~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Penc|PencPartial3|GS~0_combout\ = (\Liness[0]~input_o\ & (\Liness[1]~input_o\ & (\Liness[3]~input_o\ & \Liness[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Liness[0]~input_o\,
	datab => \Liness[1]~input_o\,
	datac => \Liness[3]~input_o\,
	datad => \Liness[2]~input_o\,
	combout => \keyscan|Penc|PencPartial3|GS~0_combout\);

-- Location: LCCOMB_X45_Y4_N4
\keyscan|Penc|PencPartial3|GS~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Penc|PencPartial3|GS~1_combout\ = (\Liness[1]~input_o\ & \Liness[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Liness[1]~input_o\,
	datad => \Liness[0]~input_o\,
	combout => \keyscan|Penc|PencPartial3|GS~1_combout\);

-- Location: LCCOMB_X45_Y4_N6
\keycontrols|NextState.State_Scan_Lines~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keycontrols|NextState.State_Scan_Lines~4_combout\ = (!\keycontrols|CurrentState.State_Scan_Columns~q\ & (((!\Liness[2]~input_o\) # (!\keyscan|Penc|PencPartial3|GS~1_combout\)) # (!\Liness[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Liness[3]~input_o\,
	datab => \keyscan|Penc|PencPartial3|GS~1_combout\,
	datac => \keycontrols|CurrentState.State_Scan_Columns~q\,
	datad => \Liness[2]~input_o\,
	combout => \keycontrols|NextState.State_Scan_Lines~4_combout\);

-- Location: IOIBUF_X69_Y54_N1
\Reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: FF_X45_Y4_N7
\keycontrols|CurrentState.State_Scan_Lines\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \keycontrols|NextState.State_Scan_Lines~4_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keycontrols|CurrentState.State_Scan_Lines~q\);

-- Location: LCCOMB_X45_Y4_N16
\keycontrols|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keycontrols|Selector1~0_combout\ = (\keycontrols|CurrentState.State_Scan_Lines~q\) # ((\keycontrols|CurrentState.State_Val~q\ & ((!\Kack~input_o\) # (!\keyscan|Penc|PencPartial3|GS~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyscan|Penc|PencPartial3|GS~0_combout\,
	datab => \Kack~input_o\,
	datac => \keycontrols|CurrentState.State_Scan_Lines~q\,
	datad => \keycontrols|CurrentState.State_Val~q\,
	combout => \keycontrols|Selector1~0_combout\);

-- Location: LCCOMB_X45_Y4_N12
\keycontrols|CurrentState.State_Val~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keycontrols|CurrentState.State_Val~feeder_combout\ = \keycontrols|Selector1~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \keycontrols|Selector1~0_combout\,
	combout => \keycontrols|CurrentState.State_Val~feeder_combout\);

-- Location: FF_X45_Y4_N13
\keycontrols|CurrentState.State_Val\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \keycontrols|CurrentState.State_Val~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keycontrols|CurrentState.State_Val~q\);

-- Location: LCCOMB_X45_Y4_N10
\keycontrols|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keycontrols|Selector2~0_combout\ = (\Kack~input_o\ & ((\keycontrols|CurrentState.State_Ack_Waiting~q\) # ((\keyscan|Penc|PencPartial3|GS~0_combout\ & \keycontrols|CurrentState.State_Val~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyscan|Penc|PencPartial3|GS~0_combout\,
	datab => \Kack~input_o\,
	datac => \keycontrols|CurrentState.State_Ack_Waiting~q\,
	datad => \keycontrols|CurrentState.State_Val~q\,
	combout => \keycontrols|Selector2~0_combout\);

-- Location: FF_X45_Y4_N11
\keycontrols|CurrentState.State_Ack_Waiting\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \keycontrols|Selector2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keycontrols|CurrentState.State_Ack_Waiting~q\);

-- Location: LCCOMB_X45_Y4_N14
\keycontrols|Selector0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keycontrols|Selector0~8_combout\ = (\keycontrols|Selector0~9_combout\ & (\keycontrols|CurrentState.State_Scan_Columns~q\ & ((\Kack~input_o\) # (!\keycontrols|CurrentState.State_Ack_Waiting~q\)))) # (!\keycontrols|Selector0~9_combout\ & ((\Kack~input_o\) 
-- # ((!\keycontrols|CurrentState.State_Ack_Waiting~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keycontrols|Selector0~9_combout\,
	datab => \Kack~input_o\,
	datac => \keycontrols|CurrentState.State_Scan_Columns~q\,
	datad => \keycontrols|CurrentState.State_Ack_Waiting~q\,
	combout => \keycontrols|Selector0~8_combout\);

-- Location: FF_X45_Y4_N15
\keycontrols|CurrentState.State_Scan_Columns\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \keycontrols|Selector0~8_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keycontrols|CurrentState.State_Scan_Columns~q\);

-- Location: LCCOMB_X45_Y4_N0
\keyscan|Contador|instance_registry_2bits|FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Contador|instance_registry_2bits|FFD1|Q~0_combout\ = \keycontrols|CurrentState.State_Scan_Columns~q\ $ (!\keyscan|Contador|instance_registry_2bits|FFD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keycontrols|CurrentState.State_Scan_Columns~q\,
	datac => \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\,
	combout => \keyscan|Contador|instance_registry_2bits|FFD1|Q~0_combout\);

-- Location: FF_X45_Y4_N1
\keyscan|Contador|instance_registry_2bits|FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \keyscan|Contador|instance_registry_2bits|FFD1|Q~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\);

-- Location: LCCOMB_X45_Y4_N24
\keyscan|Contador|instance_registry_2bits|FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Contador|instance_registry_2bits|FFD2|Q~0_combout\ = \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\ $ (((!\keycontrols|CurrentState.State_Scan_Columns~q\ & \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keycontrols|CurrentState.State_Scan_Columns~q\,
	datac => \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\,
	datad => \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\,
	combout => \keyscan|Contador|instance_registry_2bits|FFD2|Q~0_combout\);

-- Location: FF_X45_Y4_N25
\keyscan|Contador|instance_registry_2bits|FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \keyscan|Contador|instance_registry_2bits|FFD2|Q~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\);

-- Location: LCCOMB_X45_Y4_N30
\keyscan|Decoder|Y[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Decoder|Y[2]~0_combout\ = (\keyscan|Contador|instance_registry_2bits|FFD1|Q~q\ & \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\,
	datad => \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\,
	combout => \keyscan|Decoder|Y[2]~0_combout\);

-- Location: LCCOMB_X45_Y4_N28
\keyscan|Decoder|Y[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Decoder|Y[2]~1_combout\ = (!\keyscan|Contador|instance_registry_2bits|FFD1|Q~q\ & \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\,
	datad => \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\,
	combout => \keyscan|Decoder|Y[2]~1_combout\);

-- Location: LCCOMB_X45_Y4_N2
\keyscan|Decoder|Y[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Decoder|Y[2]~2_combout\ = (\keyscan|Contador|instance_registry_2bits|FFD1|Q~q\ & !\keyscan|Contador|instance_registry_2bits|FFD2|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\,
	datad => \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\,
	combout => \keyscan|Decoder|Y[2]~2_combout\);

-- Location: LCCOMB_X45_Y4_N18
\keyscan|Decoder|Y[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Decoder|Y\(0) = (\keyscan|Contador|instance_registry_2bits|FFD1|Q~q\) # (\keyscan|Contador|instance_registry_2bits|FFD2|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keyscan|Contador|instance_registry_2bits|FFD1|Q~q\,
	datad => \keyscan|Contador|instance_registry_2bits|FFD2|Q~q\,
	combout => \keyscan|Decoder|Y\(0));

-- Location: CLKCTRL_G15
\keycontrols|CurrentState.State_Scan_Lines~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \keycontrols|CurrentState.State_Scan_Lines~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \keycontrols|CurrentState.State_Scan_Lines~clkctrl_outclk\);

-- Location: LCCOMB_X45_Y4_N20
\keyscan|Penc|Mux2x1|result~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Penc|Mux2x1|result~0_combout\ = (\Liness[3]~input_o\ & ((\Liness[1]~input_o\) # (!\Liness[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Liness[3]~input_o\,
	datac => \Liness[1]~input_o\,
	datad => \Liness[2]~input_o\,
	combout => \keyscan|Penc|Mux2x1|result~0_combout\);

-- Location: FF_X45_Y4_N21
\keyscan|Reg|FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \keycontrols|CurrentState.State_Scan_Lines~clkctrl_outclk\,
	d => \keyscan|Penc|Mux2x1|result~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyscan|Reg|FFD1|Q~q\);

-- Location: LCCOMB_X45_Y4_N8
\keyscan|Penc|PencPartial1|GS~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \keyscan|Penc|PencPartial1|GS~0_combout\ = (\Liness[3]~input_o\ & \Liness[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Liness[3]~input_o\,
	datad => \Liness[2]~input_o\,
	combout => \keyscan|Penc|PencPartial1|GS~0_combout\);

-- Location: FF_X45_Y4_N9
\keyscan|Reg|FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \keycontrols|CurrentState.State_Scan_Lines~clkctrl_outclk\,
	d => \keyscan|Penc|PencPartial1|GS~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyscan|Reg|FFD2|Q~q\);

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

ww_Colss(0) <= \Colss[0]~output_o\;

ww_Colss(1) <= \Colss[1]~output_o\;

ww_Colss(2) <= \Colss[2]~output_o\;

ww_Colss(3) <= \Colss[3]~output_o\;

ww_Kout(0) <= \Kout[0]~output_o\;

ww_Kout(1) <= \Kout[1]~output_o\;

ww_Kout(2) <= \Kout[2]~output_o\;

ww_Kout(3) <= \Kout[3]~output_o\;

ww_Kval <= \Kval~output_o\;
END structure;


