----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2021 18:38:39
-- Design Name: 
-- Module Name: system_wrapper_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity system_wrapper_tb is
--  Port ( );
end system_wrapper_tb;

architecture system_wrapper_arq of system_wrapper_tb is
component system_wrapper is
port(
DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    LED_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    buttons_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ck_io0_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    ck_io1_0_tri_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkADC_0 : out STD_LOGIC;
    inADC_0_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    switchs_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end component;

signal DDR_addr_tb : STD_LOGIC_VECTOR ( 14 downto 0 );
signal DDR_ba_tb : STD_LOGIC_VECTOR ( 2 downto 0 );
signal DDR_cas_n_tb : STD_LOGIC;
signal DDR_ck_n_tb :  STD_LOGIC;
signal DDR_ck_p_tb : STD_LOGIC;
signal DDR_cke_tb : STD_LOGIC;
signal DDR_cs_n_tb :  STD_LOGIC;
signal DDR_dm_tb :  STD_LOGIC_VECTOR ( 3 downto 0 );
signal DDR_dq_tb :  STD_LOGIC_VECTOR ( 31 downto 0 );
signal DDR_dqs_n_tb :  STD_LOGIC_VECTOR ( 3 downto 0 );
signal DDR_dqs_p_tb :  STD_LOGIC_VECTOR ( 3 downto 0 );
signal DDR_odt_tb :  STD_LOGIC;
signal DDR_ras_n_tb :  STD_LOGIC;
signal DDR_reset_n_tb :  STD_LOGIC;
signal DDR_we_n_tb :  STD_LOGIC;
signal FIXED_IO_ddr_vrn_tb :  STD_LOGIC;
signal FIXED_IO_ddr_vrp_tb :  STD_LOGIC;
signal FIXED_IO_mio_tb :  STD_LOGIC_VECTOR ( 53 downto 0 );
signal FIXED_IO_ps_clk_tb :  STD_LOGIC;
signal FIXED_IO_ps_porb_tb :  STD_LOGIC;
signal FIXED_IO_ps_srstb_tb :  STD_LOGIC;
signal LED_0_tb :  STD_LOGIC_VECTOR ( 3 downto 0 );
signal buttons_tri_i_tb :  STD_LOGIC_VECTOR ( 3 downto 0 );
signal ck_io0_0_tb :  STD_LOGIC_VECTOR ( 0 to 0 );
signal ck_io1_0_tri_i_tb :  STD_LOGIC_VECTOR ( 0 to 0 );
signal clkADC_0_tb :  STD_LOGIC;
signal inADC_0_tri_i_tb :  STD_LOGIC_VECTOR ( 7 downto 0 );
signal switchs_tri_i_tb : STD_LOGIC_VECTOR ( 1 downto 0 );


begin


DUT: system_wrapper
port map(
    DDR_addr => DDR_addr_tb,
    DDR_ba => DDR_ba_tb,
    DDR_cas_n => DDR_cas_n_tb,
    DDR_ck_n => DDR_ck_n_tb,
    DDR_ck_p => DDR_ck_p_tb,
    DDR_cke => DDR_cke_tb,
    DDR_cs_n => DDR_cs_n_tb,
    DDR_dm => DDR_dm_tb,
    DDR_dq => DDR_dq_tb,
    DDR_dqs_n => DDR_dqs_n_tb,
    DDR_dqs_p => DDR_dqs_p_tb,
    DDR_odt => DDR_odt_tb,
    DDR_ras_n => DDR_ras_n_tb,
    DDR_reset_n => DDR_reset_n_tb,
    DDR_we_n => DDR_we_n_tb,
    FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn_tb,
    FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp_tb,
    FIXED_IO_mio => FIXED_IO_mio_tb,
    FIXED_IO_ps_clk => FIXED_IO_ps_clk_tb,
    FIXED_IO_ps_porb => FIXED_IO_ps_porb_tb,
    FIXED_IO_ps_srstb => FIXED_IO_ps_srstb_tb,
    LED_0 => LED_0_tb,
    buttons_tri_i => buttons_tri_i_tb,
    ck_io0_0 => ck_io0_0_tb,
    ck_io1_0_tri_i => ck_io1_0_tri_i_tb,
    clkADC_0 => clkADC_0_tb,
    inADC_0_tri_i => inADC_0_tri_i_tb,
    switchs_tri_i => switchs_tri_i_tb
);

end;
