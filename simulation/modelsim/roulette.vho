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

-- DATE "05/13/2025 19:14:47"

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

ENTITY 	SLCDC IS
    PORT (
	LCDSel : IN std_logic;
	SCLK : IN std_logic;
	SDX : IN std_logic;
	MClk : IN std_logic;
	Reset : IN std_logic;
	accept : IN std_logic;
	Wrl : BUFFER std_logic;
	Dout : BUFFER std_logic_vector(4 DOWNTO 0)
	);
END SLCDC;

-- Design Ports Information
-- Wrl	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[0]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[1]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[2]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[3]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[4]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MClk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SCLK	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LCDSel	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SDX	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- accept	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SLCDC IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LCDSel : std_logic;
SIGNAL ww_SCLK : std_logic;
SIGNAL ww_SDX : std_logic;
SIGNAL ww_MClk : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_accept : std_logic;
SIGNAL ww_Wrl : std_logic;
SIGNAL ww_Dout : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \SCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \MClk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \Wrl~output_o\ : std_logic;
SIGNAL \Dout[0]~output_o\ : std_logic;
SIGNAL \Dout[1]~output_o\ : std_logic;
SIGNAL \Dout[2]~output_o\ : std_logic;
SIGNAL \Dout[3]~output_o\ : std_logic;
SIGNAL \Dout[4]~output_o\ : std_logic;
SIGNAL \MClk~input_o\ : std_logic;
SIGNAL \MClk~inputclkctrl_outclk\ : std_logic;
SIGNAL \accept~input_o\ : std_logic;
SIGNAL \LCDSel~input_o\ : std_logic;
SIGNAL \SCLK~input_o\ : std_logic;
SIGNAL \SCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \SDX~input_o\ : std_logic;
SIGNAL \ReceiverInst|ParityCheck|FlipFlop|Q~0_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector2~0_combout\ : std_logic;
SIGNAL \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~0_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\ : std_logic;
SIGNAL \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~0_combout\ : std_logic;
SIGNAL \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\ : std_logic;
SIGNAL \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~0_combout\ : std_logic;
SIGNAL \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\ : std_logic;
SIGNAL \ReceiverInst|Controller|wr~0_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector1~0_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|CurrentState.State2~q\ : std_logic;
SIGNAL \ReceiverInst|Controller|NextState~2_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector2~1_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector2~2_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|CurrentState.State3~q\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector0~1_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|NextState.State5~0_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|CurrentState.State5~q\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector0~0_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector0~2_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector0~3_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|CurrentState.State1~q\ : std_logic;
SIGNAL \ReceiverInst|ParityCheck|FlipFlop|Q~q\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector3~0_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|Selector3~1_combout\ : std_logic;
SIGNAL \ReceiverInst|Controller|CurrentState.State4~q\ : std_logic;
SIGNAL \DispatcherInst|control_unit|Selector0~0_combout\ : std_logic;
SIGNAL \DispatcherInst|control_unit|currentState.WaitingDval~q\ : std_logic;
SIGNAL \DispatcherInst|control_unit|counter[3]~1_combout\ : std_logic;
SIGNAL \DispatcherInst|control_unit|counter[1]~0_combout\ : std_logic;
SIGNAL \DispatcherInst|control_unit|LessThan0~0_combout\ : std_logic;
SIGNAL \DispatcherInst|control_unit|counter[0]~3_combout\ : std_logic;
SIGNAL \DispatcherInst|control_unit|Add0~0_combout\ : std_logic;
SIGNAL \DispatcherInst|control_unit|counter[2]~2_combout\ : std_logic;
SIGNAL \DispatcherInst|control_unit|Selector1~0_combout\ : std_logic;
SIGNAL \DispatcherInst|control_unit|Selector1~1_combout\ : std_logic;
SIGNAL \DispatcherInst|control_unit|currentState.ReceivingDval~q\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD0|Q~feeder_combout\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD0|Q~q\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD1|Q~feeder_combout\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD1|Q~q\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD2|Q~feeder_combout\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD2|Q~q\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD3|Q~feeder_combout\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD3|Q~q\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD4|Q~feeder_combout\ : std_logic;
SIGNAL \ReceiverInst|ShiftReg|FFD4|Q~q\ : std_logic;
SIGNAL \DispatcherInst|control_unit|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Reset~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_LCDSel <= LCDSel;
ww_SCLK <= SCLK;
ww_SDX <= SDX;
ww_MClk <= MClk;
ww_Reset <= Reset;
ww_accept <= accept;
Wrl <= ww_Wrl;
Dout <= ww_Dout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\SCLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \SCLK~input_o\);

\MClk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \MClk~input_o\);

\Reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Reset~input_o\);
\ALT_INV_Reset~inputclkctrl_outclk\ <= NOT \Reset~inputclkctrl_outclk\;
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

-- Location: IOOBUF_X16_Y0_N23
\Wrl~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DispatcherInst|control_unit|currentState.ReceivingDval~q\,
	devoe => ww_devoe,
	o => \Wrl~output_o\);

-- Location: IOOBUF_X20_Y0_N23
\Dout[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ReceiverInst|ShiftReg|FFD4|Q~q\,
	devoe => ww_devoe,
	o => \Dout[0]~output_o\);

-- Location: IOOBUF_X18_Y0_N30
\Dout[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ReceiverInst|ShiftReg|FFD3|Q~q\,
	devoe => ww_devoe,
	o => \Dout[1]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\Dout[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ReceiverInst|ShiftReg|FFD2|Q~q\,
	devoe => ww_devoe,
	o => \Dout[2]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\Dout[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ReceiverInst|ShiftReg|FFD1|Q~q\,
	devoe => ww_devoe,
	o => \Dout[3]~output_o\);

-- Location: IOOBUF_X20_Y0_N30
\Dout[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ReceiverInst|ShiftReg|FFD0|Q~q\,
	devoe => ww_devoe,
	o => \Dout[4]~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\MClk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MClk,
	o => \MClk~input_o\);

-- Location: CLKCTRL_G19
\MClk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \MClk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \MClk~inputclkctrl_outclk\);

-- Location: IOIBUF_X16_Y0_N15
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

-- Location: IOIBUF_X18_Y0_N8
\LCDSel~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LCDSel,
	o => \LCDSel~input_o\);

-- Location: IOIBUF_X31_Y0_N1
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

-- Location: CLKCTRL_G18
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

-- Location: IOIBUF_X18_Y0_N22
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

-- Location: LCCOMB_X18_Y2_N22
\ReceiverInst|ParityCheck|FlipFlop|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|ParityCheck|FlipFlop|Q~0_combout\ = \SDX~input_o\ $ (\ReceiverInst|ParityCheck|FlipFlop|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SDX~input_o\,
	datac => \ReceiverInst|ParityCheck|FlipFlop|Q~q\,
	combout => \ReceiverInst|ParityCheck|FlipFlop|Q~0_combout\);

-- Location: LCCOMB_X18_Y2_N16
\ReceiverInst|Controller|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector2~0_combout\ = (!\LCDSel~input_o\ & \ReceiverInst|Controller|CurrentState.State2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCDSel~input_o\,
	datad => \ReceiverInst|Controller|CurrentState.State2~q\,
	combout => \ReceiverInst|Controller|Selector2~0_combout\);

-- Location: LCCOMB_X18_Y2_N18
\ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~0_combout\ = (\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\ & ((\ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\ & ((!\ReceiverInst|Controller|Selector2~0_combout\))) # 
-- (!\ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\ & (!\ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\ & \ReceiverInst|Controller|Selector2~0_combout\)))) # (!\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\ & 
-- (((\ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	datab => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datac => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	datad => \ReceiverInst|Controller|Selector2~0_combout\,
	combout => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~0_combout\);

-- Location: IOIBUF_X31_Y0_N22
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

-- Location: CLKCTRL_G17
\Reset~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset~inputclkctrl_outclk\);

-- Location: FF_X18_Y2_N19
\ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\);

-- Location: LCCOMB_X18_Y2_N14
\ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~0_combout\ = \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\ $ (((\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\ & 
-- (\ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\ & \ReceiverInst|Controller|Selector2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	datab => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	datac => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datad => \ReceiverInst|Controller|Selector2~0_combout\,
	combout => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~0_combout\);

-- Location: FF_X18_Y2_N15
\ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\);

-- Location: LCCOMB_X18_Y2_N8
\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~0_combout\ = (\ReceiverInst|Controller|Selector2~0_combout\ & (((\ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\ & !\ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\)) # 
-- (!\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\))) # (!\ReceiverInst|Controller|Selector2~0_combout\ & (((\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ReceiverInst|Controller|Selector2~0_combout\,
	datab => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datac => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	datad => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	combout => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~0_combout\);

-- Location: FF_X18_Y2_N9
\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\);

-- Location: LCCOMB_X18_Y2_N4
\ReceiverInst|Controller|wr~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|wr~0_combout\ = (\ReceiverInst|Controller|Selector2~0_combout\ & (((\ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\) # (!\ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\)) # 
-- (!\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	datab => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	datac => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datad => \ReceiverInst|Controller|Selector2~0_combout\,
	combout => \ReceiverInst|Controller|wr~0_combout\);

-- Location: LCCOMB_X18_Y2_N6
\ReceiverInst|Controller|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector1~0_combout\ = (\ReceiverInst|Controller|wr~0_combout\) # ((!\LCDSel~input_o\ & !\ReceiverInst|Controller|CurrentState.State1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCDSel~input_o\,
	datac => \ReceiverInst|Controller|wr~0_combout\,
	datad => \ReceiverInst|Controller|CurrentState.State1~q\,
	combout => \ReceiverInst|Controller|Selector1~0_combout\);

-- Location: FF_X18_Y2_N7
\ReceiverInst|Controller|CurrentState.State2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \ReceiverInst|Controller|Selector1~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|Controller|CurrentState.State2~q\);

-- Location: LCCOMB_X18_Y2_N10
\ReceiverInst|Controller|NextState~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|NextState~2_combout\ = (\ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\ & (!\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\ & \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datac => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	datad => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	combout => \ReceiverInst|Controller|NextState~2_combout\);

-- Location: LCCOMB_X18_Y2_N0
\ReceiverInst|Controller|Selector2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector2~1_combout\ = (\ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\ & (!\ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\ & (\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\ & 
-- \ReceiverInst|Controller|Selector2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datab => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	datac => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	datad => \ReceiverInst|Controller|Selector2~0_combout\,
	combout => \ReceiverInst|Controller|Selector2~1_combout\);

-- Location: LCCOMB_X18_Y2_N28
\ReceiverInst|Controller|Selector2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector2~2_combout\ = (\ReceiverInst|Controller|Selector2~1_combout\) # ((!\ReceiverInst|Controller|NextState~2_combout\ & (!\LCDSel~input_o\ & \ReceiverInst|Controller|CurrentState.State3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ReceiverInst|Controller|NextState~2_combout\,
	datab => \LCDSel~input_o\,
	datac => \ReceiverInst|Controller|CurrentState.State3~q\,
	datad => \ReceiverInst|Controller|Selector2~1_combout\,
	combout => \ReceiverInst|Controller|Selector2~2_combout\);

-- Location: FF_X18_Y2_N29
\ReceiverInst|Controller|CurrentState.State3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \ReceiverInst|Controller|Selector2~2_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|Controller|CurrentState.State3~q\);

-- Location: LCCOMB_X18_Y2_N26
\ReceiverInst|Controller|Selector0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector0~1_combout\ = (\LCDSel~input_o\ & ((\ReceiverInst|Controller|CurrentState.State2~q\) # ((\ReceiverInst|Controller|CurrentState.State3~q\) # (!\ReceiverInst|Controller|CurrentState.State1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCDSel~input_o\,
	datab => \ReceiverInst|Controller|CurrentState.State2~q\,
	datac => \ReceiverInst|Controller|CurrentState.State1~q\,
	datad => \ReceiverInst|Controller|CurrentState.State3~q\,
	combout => \ReceiverInst|Controller|Selector0~1_combout\);

-- Location: LCCOMB_X17_Y2_N10
\ReceiverInst|Controller|NextState.State5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|NextState.State5~0_combout\ = (\accept~input_o\ & ((\ReceiverInst|Controller|CurrentState.State4~q\) # (\ReceiverInst|Controller|CurrentState.State5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ReceiverInst|Controller|CurrentState.State4~q\,
	datac => \ReceiverInst|Controller|CurrentState.State5~q\,
	datad => \accept~input_o\,
	combout => \ReceiverInst|Controller|NextState.State5~0_combout\);

-- Location: FF_X17_Y2_N11
\ReceiverInst|Controller|CurrentState.State5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \ReceiverInst|Controller|NextState.State5~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|Controller|CurrentState.State5~q\);

-- Location: LCCOMB_X17_Y2_N4
\ReceiverInst|Controller|Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector0~0_combout\ = (!\accept~input_o\ & \ReceiverInst|Controller|CurrentState.State5~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \accept~input_o\,
	datad => \ReceiverInst|Controller|CurrentState.State5~q\,
	combout => \ReceiverInst|Controller|Selector0~0_combout\);

-- Location: LCCOMB_X18_Y2_N24
\ReceiverInst|Controller|Selector0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector0~2_combout\ = (!\ReceiverInst|ParityCheck|FlipFlop|Q~q\ & (!\ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\ & (\ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\ & 
-- \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ReceiverInst|ParityCheck|FlipFlop|Q~q\,
	datab => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD1|Q~q\,
	datac => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD3|Q~q\,
	datad => \ReceiverInst|Counter3bit|instance_registry_3bits|FFD2|Q~q\,
	combout => \ReceiverInst|Controller|Selector0~2_combout\);

-- Location: LCCOMB_X18_Y2_N30
\ReceiverInst|Controller|Selector0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector0~3_combout\ = (!\ReceiverInst|Controller|Selector0~1_combout\ & (!\ReceiverInst|Controller|Selector0~0_combout\ & ((!\ReceiverInst|Controller|Selector0~2_combout\) # (!\ReceiverInst|Controller|CurrentState.State3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ReceiverInst|Controller|Selector0~1_combout\,
	datab => \ReceiverInst|Controller|CurrentState.State3~q\,
	datac => \ReceiverInst|Controller|Selector0~0_combout\,
	datad => \ReceiverInst|Controller|Selector0~2_combout\,
	combout => \ReceiverInst|Controller|Selector0~3_combout\);

-- Location: FF_X18_Y2_N31
\ReceiverInst|Controller|CurrentState.State1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \ReceiverInst|Controller|Selector0~3_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|Controller|CurrentState.State1~q\);

-- Location: FF_X18_Y2_N23
\ReceiverInst|ParityCheck|FlipFlop|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ReceiverInst|ParityCheck|FlipFlop|Q~0_combout\,
	clrn => \ReceiverInst|Controller|CurrentState.State1~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|ParityCheck|FlipFlop|Q~q\);

-- Location: LCCOMB_X18_Y2_N20
\ReceiverInst|Controller|Selector3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector3~0_combout\ = (!\LCDSel~input_o\ & (\ReceiverInst|ParityCheck|FlipFlop|Q~q\ & \ReceiverInst|Controller|CurrentState.State3~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCDSel~input_o\,
	datac => \ReceiverInst|ParityCheck|FlipFlop|Q~q\,
	datad => \ReceiverInst|Controller|CurrentState.State3~q\,
	combout => \ReceiverInst|Controller|Selector3~0_combout\);

-- Location: LCCOMB_X18_Y2_N12
\ReceiverInst|Controller|Selector3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|Controller|Selector3~1_combout\ = (\accept~input_o\ & (\ReceiverInst|Controller|Selector3~0_combout\ & ((\ReceiverInst|Controller|NextState~2_combout\)))) # (!\accept~input_o\ & ((\ReceiverInst|Controller|CurrentState.State4~q\) # 
-- ((\ReceiverInst|Controller|Selector3~0_combout\ & \ReceiverInst|Controller|NextState~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accept~input_o\,
	datab => \ReceiverInst|Controller|Selector3~0_combout\,
	datac => \ReceiverInst|Controller|CurrentState.State4~q\,
	datad => \ReceiverInst|Controller|NextState~2_combout\,
	combout => \ReceiverInst|Controller|Selector3~1_combout\);

-- Location: FF_X18_Y2_N13
\ReceiverInst|Controller|CurrentState.State4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \ReceiverInst|Controller|Selector3~1_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|Controller|CurrentState.State4~q\);

-- Location: LCCOMB_X17_Y2_N0
\DispatcherInst|control_unit|Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DispatcherInst|control_unit|Selector0~0_combout\ = (\DispatcherInst|control_unit|currentState.ReceivingDval~q\) # (\ReceiverInst|Controller|CurrentState.State4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DispatcherInst|control_unit|currentState.ReceivingDval~q\,
	datac => \ReceiverInst|Controller|CurrentState.State4~q\,
	combout => \DispatcherInst|control_unit|Selector0~0_combout\);

-- Location: FF_X17_Y2_N1
\DispatcherInst|control_unit|currentState.WaitingDval\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \DispatcherInst|control_unit|Selector0~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispatcherInst|control_unit|currentState.WaitingDval~q\);

-- Location: LCCOMB_X17_Y2_N28
\DispatcherInst|control_unit|counter[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DispatcherInst|control_unit|counter[3]~1_combout\ = (\DispatcherInst|control_unit|currentState.ReceivingDval~q\ & ((\DispatcherInst|control_unit|counter\(3)) # ((\DispatcherInst|control_unit|counter\(2) & \DispatcherInst|control_unit|Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispatcherInst|control_unit|counter\(2),
	datab => \DispatcherInst|control_unit|currentState.ReceivingDval~q\,
	datac => \DispatcherInst|control_unit|counter\(3),
	datad => \DispatcherInst|control_unit|Add0~0_combout\,
	combout => \DispatcherInst|control_unit|counter[3]~1_combout\);

-- Location: FF_X17_Y2_N29
\DispatcherInst|control_unit|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \DispatcherInst|control_unit|counter[3]~1_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispatcherInst|control_unit|counter\(3));

-- Location: LCCOMB_X17_Y2_N18
\DispatcherInst|control_unit|counter[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DispatcherInst|control_unit|counter[1]~0_combout\ = (\DispatcherInst|control_unit|currentState.ReceivingDval~q\ & (\DispatcherInst|control_unit|counter\(1) $ (((\DispatcherInst|control_unit|counter\(0) & 
-- !\DispatcherInst|control_unit|LessThan0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispatcherInst|control_unit|currentState.ReceivingDval~q\,
	datab => \DispatcherInst|control_unit|counter\(0),
	datac => \DispatcherInst|control_unit|counter\(1),
	datad => \DispatcherInst|control_unit|LessThan0~0_combout\,
	combout => \DispatcherInst|control_unit|counter[1]~0_combout\);

-- Location: FF_X17_Y2_N19
\DispatcherInst|control_unit|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \DispatcherInst|control_unit|counter[1]~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispatcherInst|control_unit|counter\(1));

-- Location: LCCOMB_X17_Y2_N2
\DispatcherInst|control_unit|LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DispatcherInst|control_unit|LessThan0~0_combout\ = (\DispatcherInst|control_unit|counter\(2) & (\DispatcherInst|control_unit|counter\(3) & ((\DispatcherInst|control_unit|counter\(0)) # (\DispatcherInst|control_unit|counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispatcherInst|control_unit|counter\(2),
	datab => \DispatcherInst|control_unit|counter\(3),
	datac => \DispatcherInst|control_unit|counter\(0),
	datad => \DispatcherInst|control_unit|counter\(1),
	combout => \DispatcherInst|control_unit|LessThan0~0_combout\);

-- Location: LCCOMB_X17_Y2_N8
\DispatcherInst|control_unit|counter[0]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DispatcherInst|control_unit|counter[0]~3_combout\ = (\DispatcherInst|control_unit|currentState.ReceivingDval~q\ & (\DispatcherInst|control_unit|counter\(0) $ (!\DispatcherInst|control_unit|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DispatcherInst|control_unit|currentState.ReceivingDval~q\,
	datac => \DispatcherInst|control_unit|counter\(0),
	datad => \DispatcherInst|control_unit|LessThan0~0_combout\,
	combout => \DispatcherInst|control_unit|counter[0]~3_combout\);

-- Location: FF_X17_Y2_N9
\DispatcherInst|control_unit|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \DispatcherInst|control_unit|counter[0]~3_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispatcherInst|control_unit|counter\(0));

-- Location: LCCOMB_X17_Y2_N20
\DispatcherInst|control_unit|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DispatcherInst|control_unit|Add0~0_combout\ = (\DispatcherInst|control_unit|counter\(0) & \DispatcherInst|control_unit|counter\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DispatcherInst|control_unit|counter\(0),
	datad => \DispatcherInst|control_unit|counter\(1),
	combout => \DispatcherInst|control_unit|Add0~0_combout\);

-- Location: LCCOMB_X17_Y2_N26
\DispatcherInst|control_unit|counter[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DispatcherInst|control_unit|counter[2]~2_combout\ = (\DispatcherInst|control_unit|currentState.ReceivingDval~q\ & (\DispatcherInst|control_unit|counter\(2) $ (((\DispatcherInst|control_unit|Add0~0_combout\ & 
-- !\DispatcherInst|control_unit|LessThan0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispatcherInst|control_unit|currentState.ReceivingDval~q\,
	datab => \DispatcherInst|control_unit|Add0~0_combout\,
	datac => \DispatcherInst|control_unit|counter\(2),
	datad => \DispatcherInst|control_unit|LessThan0~0_combout\,
	combout => \DispatcherInst|control_unit|counter[2]~2_combout\);

-- Location: FF_X17_Y2_N27
\DispatcherInst|control_unit|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \DispatcherInst|control_unit|counter[2]~2_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispatcherInst|control_unit|counter\(2));

-- Location: LCCOMB_X17_Y2_N6
\DispatcherInst|control_unit|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DispatcherInst|control_unit|Selector1~0_combout\ = (((\DispatcherInst|control_unit|counter\(1)) # (!\DispatcherInst|control_unit|counter\(0))) # (!\DispatcherInst|control_unit|counter\(3))) # (!\DispatcherInst|control_unit|counter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispatcherInst|control_unit|counter\(2),
	datab => \DispatcherInst|control_unit|counter\(3),
	datac => \DispatcherInst|control_unit|counter\(0),
	datad => \DispatcherInst|control_unit|counter\(1),
	combout => \DispatcherInst|control_unit|Selector1~0_combout\);

-- Location: LCCOMB_X17_Y2_N16
\DispatcherInst|control_unit|Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DispatcherInst|control_unit|Selector1~1_combout\ = (\DispatcherInst|control_unit|currentState.WaitingDval~q\ & (((\DispatcherInst|control_unit|currentState.ReceivingDval~q\ & \DispatcherInst|control_unit|Selector1~0_combout\)))) # 
-- (!\DispatcherInst|control_unit|currentState.WaitingDval~q\ & ((\ReceiverInst|Controller|CurrentState.State4~q\) # ((\DispatcherInst|control_unit|currentState.ReceivingDval~q\ & \DispatcherInst|control_unit|Selector1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispatcherInst|control_unit|currentState.WaitingDval~q\,
	datab => \ReceiverInst|Controller|CurrentState.State4~q\,
	datac => \DispatcherInst|control_unit|currentState.ReceivingDval~q\,
	datad => \DispatcherInst|control_unit|Selector1~0_combout\,
	combout => \DispatcherInst|control_unit|Selector1~1_combout\);

-- Location: FF_X17_Y2_N17
\DispatcherInst|control_unit|currentState.ReceivingDval\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MClk~inputclkctrl_outclk\,
	d => \DispatcherInst|control_unit|Selector1~1_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispatcherInst|control_unit|currentState.ReceivingDval~q\);

-- Location: LCCOMB_X19_Y2_N28
\ReceiverInst|ShiftReg|FFD0|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|ShiftReg|FFD0|Q~feeder_combout\ = \SDX~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SDX~input_o\,
	combout => \ReceiverInst|ShiftReg|FFD0|Q~feeder_combout\);

-- Location: FF_X19_Y2_N29
\ReceiverInst|ShiftReg|FFD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ReceiverInst|ShiftReg|FFD0|Q~feeder_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	ena => \ReceiverInst|Controller|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|ShiftReg|FFD0|Q~q\);

-- Location: LCCOMB_X19_Y2_N6
\ReceiverInst|ShiftReg|FFD1|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|ShiftReg|FFD1|Q~feeder_combout\ = \ReceiverInst|ShiftReg|FFD0|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ReceiverInst|ShiftReg|FFD0|Q~q\,
	combout => \ReceiverInst|ShiftReg|FFD1|Q~feeder_combout\);

-- Location: FF_X19_Y2_N7
\ReceiverInst|ShiftReg|FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ReceiverInst|ShiftReg|FFD1|Q~feeder_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	ena => \ReceiverInst|Controller|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|ShiftReg|FFD1|Q~q\);

-- Location: LCCOMB_X19_Y2_N16
\ReceiverInst|ShiftReg|FFD2|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|ShiftReg|FFD2|Q~feeder_combout\ = \ReceiverInst|ShiftReg|FFD1|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ReceiverInst|ShiftReg|FFD1|Q~q\,
	combout => \ReceiverInst|ShiftReg|FFD2|Q~feeder_combout\);

-- Location: FF_X19_Y2_N17
\ReceiverInst|ShiftReg|FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ReceiverInst|ShiftReg|FFD2|Q~feeder_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	ena => \ReceiverInst|Controller|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|ShiftReg|FFD2|Q~q\);

-- Location: LCCOMB_X19_Y2_N18
\ReceiverInst|ShiftReg|FFD3|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|ShiftReg|FFD3|Q~feeder_combout\ = \ReceiverInst|ShiftReg|FFD2|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ReceiverInst|ShiftReg|FFD2|Q~q\,
	combout => \ReceiverInst|ShiftReg|FFD3|Q~feeder_combout\);

-- Location: FF_X19_Y2_N19
\ReceiverInst|ShiftReg|FFD3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ReceiverInst|ShiftReg|FFD3|Q~feeder_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	ena => \ReceiverInst|Controller|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|ShiftReg|FFD3|Q~q\);

-- Location: LCCOMB_X19_Y2_N12
\ReceiverInst|ShiftReg|FFD4|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ReceiverInst|ShiftReg|FFD4|Q~feeder_combout\ = \ReceiverInst|ShiftReg|FFD3|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ReceiverInst|ShiftReg|FFD3|Q~q\,
	combout => \ReceiverInst|ShiftReg|FFD4|Q~feeder_combout\);

-- Location: FF_X19_Y2_N13
\ReceiverInst|ShiftReg|FFD4|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SCLK~inputclkctrl_outclk\,
	d => \ReceiverInst|ShiftReg|FFD4|Q~feeder_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	ena => \ReceiverInst|Controller|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ReceiverInst|ShiftReg|FFD4|Q~q\);

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

ww_Wrl <= \Wrl~output_o\;

ww_Dout(0) <= \Dout[0]~output_o\;

ww_Dout(1) <= \Dout[1]~output_o\;

ww_Dout(2) <= \Dout[2]~output_o\;

ww_Dout(3) <= \Dout[3]~output_o\;

ww_Dout(4) <= \Dout[4]~output_o\;
END structure;


