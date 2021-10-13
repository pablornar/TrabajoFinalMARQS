# Arty Z7 Pin Assignments
############################
# On-board led             #
############################
#set_property -dict { PACKAGE_PIN R14    IOSTANDARD LVCMOS33 } [get_ports { led_0[0] }]; #IO_L6N_T0_VREF_34 Sch=LED0
#set_property -dict { PACKAGE_PIN P14    IOSTANDARD LVCMOS33 } [get_ports { led_0[1] }]; #IO_L6P_T0_34 Sch=LED1
#set_property -dict { PACKAGE_PIN N16    IOSTANDARD LVCMOS33 } [get_ports { led_0[2] }]; #IO_L21N_T3_DQS_AD14N_35 Sch=LED2
#set_property -dict { PACKAGE_PIN M14    IOSTANDARD LVCMOS33 } [get_ports { led_0[3] }]; #IO_L23P_T3_35 Sch=LED3
set_property PACKAGE_PIN R14 [get_ports {LED_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_0[0]}]
set_property PACKAGE_PIN P14 [get_ports {LED_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_0[1]}]
set_property PACKAGE_PIN N16 [get_ports {LED_0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_0[2]}]
set_property PACKAGE_PIN M14 [get_ports {LED_0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_0[3]}]

## ChipKit Outer Digital Header
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {ck_io0_0[0]}]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {ck_io1_0_tri_i[0]}]
#set_property PACKAGE_PIN T14 [get_ports {ck_io0_0[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ck_io0_0[0]}]
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { inputdata_0[0] }]; #IO_L2N_T0_34            Sch=CK_IO1
#set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { inputdata_0[1] }]; #IO_L3P_T0_DQS_PUDC_B_34 Sch=CK_IO2
#set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { inputdata_0[2] }]; #IO_L3N_T0_DQS_34        Sch=CK_IO3
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { inputdata_0[3] }]; #IO_L10P_T1_34           Sch=CK_IO4
#set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { inputdata_0[4] }]; #IO_L5N_T0_34            Sch=CK_IO5
#set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { inputdata_0[5] }]; #IO_L19P_T3_34           Sch=CK_IO6
#set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { inputdata_0[6] }]; #IO_L9N_T1_DQS_34        Sch=CK_IO7
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { inputdata_0[7] }]; #IO_L21P_T3_DQS_34       Sch=CK_IO8

set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { clkADC_0 }]; #IO_L21P_T3_DQS_34       Sch=CK_IO8

set_property -dict { PACKAGE_PIN W10   IOSTANDARD LVCMOS33 } [get_ports { inADC_0_tri_i[0] }]; #IO_L16P_T2_13       Sch=CK_IO34
set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33 } [get_ports { inADC_0_tri_i[1] }]; #IO_L22N_T3_13       Sch=CK_IO35
set_property -dict { PACKAGE_PIN Y6    IOSTANDARD LVCMOS33 } [get_ports { inADC_0_tri_i[2] }]; #IO_L13N_T2_MRCC_13  Sch=CK_IO36
set_property -dict { PACKAGE_PIN Y7    IOSTANDARD LVCMOS33 } [get_ports { inADC_0_tri_i[3] }]; #IO_L13P_T2_MRCC_13  Sch=cCK_IO37
set_property -dict { PACKAGE_PIN W8    IOSTANDARD LVCMOS33 } [get_ports { inADC_0_tri_i[4] }]; #IO_L15N_T2_DQS_13   Sch=CK_IO38
set_property -dict { PACKAGE_PIN Y8    IOSTANDARD LVCMOS33 } [get_ports { inADC_0_tri_i[5] }]; #IO_L14N_T2_SRCC_13  Sch=CK_IO39
set_property -dict { PACKAGE_PIN W9    IOSTANDARD LVCMOS33 } [get_ports { inADC_0_tri_i[6] }]; #IO_L16N_T2_13       Sch=CK_IO40
set_property -dict { PACKAGE_PIN Y9    IOSTANDARD LVCMOS33 } [get_ports { inADC_0_tri_i[7] }]; #IO_L14P_T2_SRCC_13  Sch=CK_IO41
