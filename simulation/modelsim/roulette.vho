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

-- DATE "04/08/2025 13:22:44"

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

ENTITY 	serial_receiver IS
    PORT (
	SS : IN std_logic;
	SCLK : IN std_logic;
	SDX : IN std_logic;
	Reset : IN std_logic;
	accept : IN std_logic;
	DXval : OUT std_logic;
	Data : OUT std_logic_vector(4 DOWNTO 0)
	);
END serial_receiver;

-- Design Ports Information
-- DXval	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[0]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[1]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[2]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[3]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[4]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- accept	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SS	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SCLK	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SDX	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF serial_receiver IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SS : std_logic;
SIGNAL ww_SCLK : std_logic;
SIGNAL ww_SDX : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_accept : std_logic;
SIGNAL ww_DXval : std_logic;
SIGNAL ww_Data : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \SCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \DXval~output_o\ : std_logic;
SIGNAL \Data[0]~output_o\ : std_logic;
SIGNAL \Data[1]~output_o\ : std_logic;
SIGNAL \Data[2]~output_o\ : std_logic;
SIGNAL \Data[3]~output_o\ : std_logic;
SIGNAL \Data[4]~output_o\ : std_logic;
SIGNAL \SCLK~input_o\ : std_logic;
SIGNAL \SCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \SS~input_o\ : std_logic;
SIGNAL \SDX~input_o\ : std_logic;
SIGNAL \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~0_combout\ : std_logic;
SIGNAL \accept~input_o\ : std_logic;
SIGNAL \Controller|Selector4~0_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Controller|CurrentState.State6~q\ : std_logic;
SIGNAL \Controller|NextState.State1~0_combout\ : std_logic;
SIGNAL \Controller|CurrentState.State1~q\ : std_logic;
SIGNAL \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~q\ : std_logic;
SIGNAL \Counter3bit|instance_registry_3bits|FFD1|Q~0_combout\ : std_logic;
SIGNAL \Counter3bit|instance_registry_3bits|FFD2|Q~0_combout\ : std_logic;
SIGNAL \Counter3bit|instance_registry_3bits|FFD2|Q~q\ : std_logic;
SIGNAL \Counter3bit|instance_registry_3bits|FFD3|Q~0_combout\ : std_logic;
SIGNAL \Counter3bit|instance_registry_3bits|FFD3|Q~q\ : std_logic;
SIGNAL \Controller|Selector1~1_combout\ : std_logic;
SIGNAL \Controller|Selector0~2_combout\ : std_logic;
SIGNAL \Controller|CurrentState.State2~q\ : std_logic;
SIGNAL \Counter3bit|instance_registry_3bits|FFD1|Q~q\ : std_logic;
SIGNAL \Controller|Selector1~2_combout\ : std_logic;
SIGNAL \Controller|Selector1~0_combout\ : std_logic;
SIGNAL \Controller|Selector1~3_combout\ : std_logic;
SIGNAL \Controller|CurrentState.State3~q\ : std_logic;
SIGNAL \Controller|Selector2~0_combout\ : std_logic;
SIGNAL \Controller|Selector2~1_combout\ : std_logic;
SIGNAL \Controller|CurrentState.State4~q\ : std_logic;
SIGNAL \Controller|Selector3~0_combout\ : std_logic;
SIGNAL \Controller|Selector3~1_combout\ : std_logic;
SIGNAL \Controller|CurrentState.State5~q\ : std_logic;
SIGNAL \ShiftReg|FFD0|Q~0_combout\ : std_logic;
SIGNAL \ShiftReg|FFD0|Q~q\ : std_logic;
SIGNAL \ALT_INV_Reset~input_o\ : std_logic;
SIGNAL \ShiftReg|FFD0|ALT_INV_Q~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_SS <= SS;
ww_SCLK <= SCLK;
ww_SDX <= SDX;
ww_Reset <= Reset;
ww_accept <= accept;
DXval <= ww_DXval;
Data <= ww_Data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\SCLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \SCLK~input_o\);
\ALT_INV_Reset~input_o\ <= NOT \Reset~input_o\;
\ShiftReg|FFD0|ALT_INV_Q~q\ <= NOT \ShiftReg|FFD0|Q~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y41_N16
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

-- Location: IOOBUF_X36_Y39_N16
\DXval~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Controller|CurrentState.State5~q\,
	devoe => ww_devoe,
	o => \DXval~output_o\);

-- Location: IOOBUF_X78_Y35_N9
\Data[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \Data[0]~output_o\);

-- Location: IOOBUF_X64_Y54_N2
\Data[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \Data[1]~output_o\);

-- Location: IOOBUF_X66_Y54_N30
\Data[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \Data[2]~output_o\);

-- Location: IOOBUF_X51_Y54_N9
\Data[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \Data[3]~output_o\);

-- Location: IOOBUF_X36_Y39_N23
\Data[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ShiftReg|FFD0|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \Data[4]~output_o\);

-- Location: IOIBUF_X0_Y18_N15
\SCLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SCLK,
	o => \SCLK~input_o\);

-- Location: CLKCTRL_G3
\SCLK~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \SCLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \SCLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X34_Y39_N22
\SS~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SS,
	o => \SS~input_o\);

-- Location: IOIBUF_X36_Y39_N29
\SDX~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SDX,
	o => \SDX~input_o\);

-- Location: LCCOMB_X45_Y28_N8
\ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~0_combout\ = \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~q\ $ (\SDX~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~q\,
	datad => \SDX~input_o\,
	combout => \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~0_combout\);

-- Location: IOIBUF_X34_Y39_N8
\accept~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_accept,
	o => \accept~input_o\);

-- Location: LCCOMB_X45_Y28_N20
\Controller|Selector4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector4~0_combout\ = (!\SS~input_o\ & (\accept~input_o\ & ((\Controller|CurrentState.State6~q\) # (\Controller|CurrentState.State5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS~input_o\,
	datab => \accept~input_o\,
	datac => \Controller|CurrentState.State6~q\,
	datad => \Controller|CurrentState.State5~q\,
	combout => \Controller|Selector4~0_combout\);

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

-- Location: FF_X45_Y28_N21
\Controller|CurrentState.State6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \Controller|Selector4~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controller|CurrentState.State6~q\);

-- Location: LCCOMB_X45_Y28_N0
\Controller|NextState.State1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|NextState.State1~0_combout\ = (!\SS~input_o\ & ((\accept~input_o\) # (!\Controller|CurrentState.State6~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS~input_o\,
	datab => \accept~input_o\,
	datad => \Controller|CurrentState.State6~q\,
	combout => \Controller|NextState.State1~0_combout\);

-- Location: FF_X45_Y28_N1
\Controller|CurrentState.State1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \Controller|NextState.State1~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controller|CurrentState.State1~q\);

-- Location: FF_X45_Y28_N9
\ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~0_combout\,
	clrn => \Controller|CurrentState.State1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~q\);

-- Location: LCCOMB_X45_Y28_N12
\Counter3bit|instance_registry_3bits|FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Counter3bit|instance_registry_3bits|FFD1|Q~0_combout\ = !\Counter3bit|instance_registry_3bits|FFD1|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	combout => \Counter3bit|instance_registry_3bits|FFD1|Q~0_combout\);

-- Location: LCCOMB_X45_Y28_N4
\Counter3bit|instance_registry_3bits|FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Counter3bit|instance_registry_3bits|FFD2|Q~0_combout\ = \Counter3bit|instance_registry_3bits|FFD2|Q~q\ $ (((\Controller|CurrentState.State2~q\ & \Counter3bit|instance_registry_3bits|FFD1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Controller|CurrentState.State2~q\,
	datac => \Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	datad => \Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	combout => \Counter3bit|instance_registry_3bits|FFD2|Q~0_combout\);

-- Location: FF_X45_Y28_N5
\Counter3bit|instance_registry_3bits|FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \Counter3bit|instance_registry_3bits|FFD2|Q~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Counter3bit|instance_registry_3bits|FFD2|Q~q\);

-- Location: LCCOMB_X45_Y28_N26
\Counter3bit|instance_registry_3bits|FFD3|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Counter3bit|instance_registry_3bits|FFD3|Q~0_combout\ = \Counter3bit|instance_registry_3bits|FFD3|Q~q\ $ (((\Counter3bit|instance_registry_3bits|FFD1|Q~q\ & (\Counter3bit|instance_registry_3bits|FFD2|Q~q\ & \Controller|CurrentState.State2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	datab => \Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	datac => \Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datad => \Controller|CurrentState.State2~q\,
	combout => \Counter3bit|instance_registry_3bits|FFD3|Q~0_combout\);

-- Location: FF_X45_Y28_N27
\Counter3bit|instance_registry_3bits|FFD3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \Counter3bit|instance_registry_3bits|FFD3|Q~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Counter3bit|instance_registry_3bits|FFD3|Q~q\);

-- Location: LCCOMB_X45_Y28_N28
\Controller|Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector1~1_combout\ = (\Counter3bit|instance_registry_3bits|FFD3|Q~q\ & (\Counter3bit|instance_registry_3bits|FFD2|Q~q\ & !\Counter3bit|instance_registry_3bits|FFD1|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datac => \Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	datad => \Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	combout => \Controller|Selector1~1_combout\);

-- Location: LCCOMB_X45_Y28_N24
\Controller|Selector0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector0~2_combout\ = (!\SS~input_o\ & (((\Controller|CurrentState.State2~q\ & !\Controller|Selector1~1_combout\)) # (!\Controller|CurrentState.State1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS~input_o\,
	datab => \Controller|CurrentState.State1~q\,
	datac => \Controller|CurrentState.State2~q\,
	datad => \Controller|Selector1~1_combout\,
	combout => \Controller|Selector0~2_combout\);

-- Location: FF_X45_Y28_N25
\Controller|CurrentState.State2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \Controller|Selector0~2_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controller|CurrentState.State2~q\);

-- Location: FF_X45_Y28_N13
\Counter3bit|instance_registry_3bits|FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \Counter3bit|instance_registry_3bits|FFD1|Q~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \Controller|CurrentState.State2~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Counter3bit|instance_registry_3bits|FFD1|Q~q\);

-- Location: LCCOMB_X45_Y28_N30
\Controller|Selector1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector1~2_combout\ = (!\SS~input_o\ & ((\Counter3bit|instance_registry_3bits|FFD2|Q~q\) # ((!\Counter3bit|instance_registry_3bits|FFD1|Q~q\) # (!\Counter3bit|instance_registry_3bits|FFD3|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS~input_o\,
	datab => \Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	datac => \Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datad => \Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	combout => \Controller|Selector1~2_combout\);

-- Location: LCCOMB_X45_Y28_N14
\Controller|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector1~0_combout\ = (!\SS~input_o\ & \Controller|CurrentState.State2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SS~input_o\,
	datad => \Controller|CurrentState.State2~q\,
	combout => \Controller|Selector1~0_combout\);

-- Location: LCCOMB_X45_Y28_N18
\Controller|Selector1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector1~3_combout\ = (\Controller|Selector1~2_combout\ & ((\Controller|CurrentState.State3~q\) # ((\Controller|Selector1~0_combout\ & \Controller|Selector1~1_combout\)))) # (!\Controller|Selector1~2_combout\ & 
-- (\Controller|Selector1~0_combout\ & ((\Controller|Selector1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Controller|Selector1~2_combout\,
	datab => \Controller|Selector1~0_combout\,
	datac => \Controller|CurrentState.State3~q\,
	datad => \Controller|Selector1~1_combout\,
	combout => \Controller|Selector1~3_combout\);

-- Location: FF_X45_Y28_N19
\Controller|CurrentState.State3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \Controller|Selector1~3_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controller|CurrentState.State3~q\);

-- Location: LCCOMB_X45_Y28_N10
\Controller|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector2~0_combout\ = (\Counter3bit|instance_registry_3bits|FFD1|Q~q\ & (!\Counter3bit|instance_registry_3bits|FFD2|Q~q\ & (\Counter3bit|instance_registry_3bits|FFD3|Q~q\ & \Controller|CurrentState.State3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	datab => \Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	datac => \Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datad => \Controller|CurrentState.State3~q\,
	combout => \Controller|Selector2~0_combout\);

-- Location: LCCOMB_X45_Y28_N22
\Controller|Selector2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector2~1_combout\ = (!\SS~input_o\ & ((\Controller|Selector2~0_combout\) # ((\ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~q\ & \Controller|CurrentState.State4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS~input_o\,
	datab => \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~q\,
	datac => \Controller|CurrentState.State4~q\,
	datad => \Controller|Selector2~0_combout\,
	combout => \Controller|Selector2~1_combout\);

-- Location: FF_X45_Y28_N23
\Controller|CurrentState.State4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \Controller|Selector2~1_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controller|CurrentState.State4~q\);

-- Location: LCCOMB_X45_Y28_N6
\Controller|Selector3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector3~0_combout\ = (\Controller|CurrentState.State4~q\ & (((!\accept~input_o\ & \Controller|CurrentState.State5~q\)) # (!\ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~q\))) # (!\Controller|CurrentState.State4~q\ & 
-- (!\accept~input_o\ & ((\Controller|CurrentState.State5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Controller|CurrentState.State4~q\,
	datab => \accept~input_o\,
	datac => \ParityCheck|CounterUp|instance_registry_3bits|FFD1|Q~q\,
	datad => \Controller|CurrentState.State5~q\,
	combout => \Controller|Selector3~0_combout\);

-- Location: LCCOMB_X45_Y28_N16
\Controller|Selector3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Controller|Selector3~1_combout\ = (!\SS~input_o\ & \Controller|Selector3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SS~input_o\,
	datad => \Controller|Selector3~0_combout\,
	combout => \Controller|Selector3~1_combout\);

-- Location: FF_X45_Y28_N17
\Controller|CurrentState.State5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \Controller|Selector3~1_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Controller|CurrentState.State5~q\);

-- Location: LCCOMB_X44_Y28_N8
\ShiftReg|FFD0|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ShiftReg|FFD0|Q~0_combout\ = !\SDX~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SDX~input_o\,
	combout => \ShiftReg|FFD0|Q~0_combout\);

-- Location: FF_X44_Y28_N9
\ShiftReg|FFD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ShiftReg|FFD0|Q~0_combout\,
	ena => \Controller|CurrentState.State2~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ShiftReg|FFD0|Q~q\);

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

ww_DXval <= \DXval~output_o\;

ww_Data(0) <= \Data[0]~output_o\;

ww_Data(1) <= \Data[1]~output_o\;

ww_Data(2) <= \Data[2]~output_o\;

ww_Data(3) <= \Data[3]~output_o\;

ww_Data(4) <= \Data[4]~output_o\;
END structure;


