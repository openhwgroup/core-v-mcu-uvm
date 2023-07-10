// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_CONSTANTS_SV__
`define __UVME_CVMCU_CHIP_CONSTANTS_SV__


const uvm_reg_addr_t  uvme_cvmcu_chip_default_reg_block_base_address = 'h0000_0000; ///< Register block base address
const int unsigned    uvme_cvmcu_chip_reg_block_reg_n_bytes          = 4; ///< Width of registers (bytes)

/**
 * First Level IRQ lines.
 */
const int unsigned  uvme_cvmcu_chip_l1_irq_lines[string] = '{
   "CLINT_SW" : 3, ///< CLINT Software Event
   "CLINT_TIMER" : 7, ///< CLINT Timer Event
   "CLINT_EXT" : 11, ///< CLINT External Event
   "TIMER_LO" : 16, ///< CUSTOM FAST Timer_LO Event
   "TIMER_HI" : 17, ///< CUSTOM FAST Timer HI Event
   "REF_CLK_RISE" : 18, ///< CUSTOM FAST Reference Clock Rise Event
   "REF_CLK_FALL" : 19, ///< CUSTOM FAST Reference Clock Fall Event
   "I2C" : 20, ///< CUSTOM FAST I2C Event
   "ADV_TIMER_0" : 21, ///< CUSTOM FAST Advanced-Timer Events0
   "ADV_TIMER_1" : 22, ///< CUSTOM FAST Advanced-Timer Events1
   "ADV_TIMER_2" : 23, ///< CUSTOM FAST Advanced-Timer Events2
   "ADV_TIMER_3" : 24, ///< CUSTOM FAST Advanced-Timer Events3
   "EFPGA_0" : 25, ///< CUSTOM FAST eFPGA Events0
   "EFPGA_1" : 26, ///< CUSTOM FAST eFPGA Events1
   "EFPGA_2" : 27, ///< CUSTOM FAST eFPGA Events2
   "EFPGA_3" : 28, ///< CUSTOM FAST eFPGA Events3
   "EFPGA_4" : 29, ///< CUSTOM FAST eFPGA Events4
   "EFPGA_5" : 30, ///< CUSTOM FAST eFPGA Events5
   "ERROR" : 31 ///< CUSTOM FAST Error Event
};
/**
 * Platform-Specific (Second Level) IRQ lines.
 */
const int unsigned  uvme_cvmcu_chip_l2_irq_lines[string] = '{
   "UART0_0" : 0, ///< UART-0 Event #0
   "UART0_1" : 1, ///< UART-0 Event #1
   "UART0_2" : 2, ///< UART-0 Event #2
   "UART0_3" : 3, ///< UART-0 Event #3
   "UART1_0" : 4, ///< UART-1 Event #0
   "UART1_1" : 5, ///< UART-1 Event #1
   "UART1_2" : 6, ///< UART-1 Event #2
   "UART1_3" : 7, ///< UART-1 Event #3
   "QSPI0_0" : 8, ///< QSPI-0 Event #0
   "QSPI0_1" : 9, ///< QSPI-0 Event #1
   "QSPI0_2" : 10, ///< QSPI-0 Event #2
   "QSPI0_3" : 11, ///< QSPI-0 Event #3
   "QSPI1_0" : 12, ///< QSPI-1 Event #0
   "QSPI1_1" : 13, ///< QSPI-1 Event #1
   "QSPI1_2" : 14, ///< QSPI-1 Event #2
   "QSPI1_3" : 15, ///< QSPI-1 Event #3
   "I2C0_0" : 16, ///< I2C-0 Event #0
   "I2C0_1" : 17, ///< I2C-0 Event #1
   "I2C0_2" : 18, ///< I2C-0 Event #2
   "I2C0_3" : 19, ///< I2C-0 Event #3
   "I2C1_0" : 20, ///< I2C-1 Event #0
   "I2C1_1" : 21, ///< I2C-1 Event #1
   "I2C1_2" : 22, ///< I2C-1 Event #2
   "I2C1_3" : 23, ///< I2C-1 Event #3
   "SDIO_0" : 24, ///< SDIO Event #0
   "SDIO_1" : 25, ///< SDIO Event #1
   "SDIO_2" : 26, ///< SDIO Event #2
   "SDIO_3" : 27, ///< SDIO Event #3
   "CAMERA_0" : 28, ///< Camera Event #0
   "CAMERA_1" : 29, ///< Camera Event #1
   "CAMERA_2" : 30, ///< Camera Event #2
   "CAMERA_3" : 31, ///< Camera Event #3
   "FILTER_0" : 32, ///< Filter Event #0
   "FILTER_1" : 33, ///< Filter Event #1
   "FILTER_2" : 34, ///< Filter Event #2
   "FILTER_3" : 35, ///< Filter Event #3
   "EFPGA_0" : 112, ///< eFPGA Event #0
   "EFPGA_1" : 113, ///< eFPGA Event #1
   "EFPGA_2" : 114, ///< eFPGA Event #2
   "EFPGA_3" : 115, ///< eFPGA Event #3
   "EFPGA_4" : 116, ///< eFPGA Event #4
   "EFPGA_5" : 117, ///< eFPGA Event #5
   "EFPGA_6" : 118, ///< eFPGA Event #6
   "EFPGA_7" : 119, ///< eFPGA Event #7
   "EFPGA_8" : 120, ///< eFPGA Event #8
   "EFPGA_9" : 121, ///< eFPGA Event #9
   "EFPGA_10" : 122, ///< eFPGA Event #10
   "EFPGA_11" : 123, ///< eFPGA Event #11
   "EFPGA_12" : 124, ///< eFPGA Event #12
   "EFPGA_13" : 125, ///< eFPGA Event #13
   "EFPGA_14" : 126, ///< eFPGA Event #14
   "EFPGA_15" : 127, ///< eFPGA Event #15
   "GPIO_0" : 128, ///< GPIO Event #0
   "GPIO_1" : 129, ///< GPIO Event #1
   "GPIO_2" : 130, ///< GPIO Event #2
   "GPIO_3" : 131, ///< GPIO Event #3
   "GPIO_4" : 132, ///< GPIO Event #4
   "GPIO_5" : 133, ///< GPIO Event #5
   "GPIO_6" : 134, ///< GPIO Event #6
   "GPIO_7" : 135, ///< GPIO Event #7
   "GPIO_8" : 136, ///< GPIO Event #8
   "GPIO_9" : 137, ///< GPIO Event #9
   "GPIO_10" : 138, ///< GPIO Event #10
   "GPIO_11" : 139, ///< GPIO Event #11
   "GPIO_12" : 140, ///< GPIO Event #12
   "GPIO_13" : 141, ///< GPIO Event #13
   "GPIO_14" : 142, ///< GPIO Event #14
   "GPIO_15" : 143, ///< GPIO Event #15
   "GPIO_16" : 144, ///< GPIO Event #16
   "GPIO_17" : 145, ///< GPIO Event #17
   "GPIO_18" : 146, ///< GPIO Event #18
   "GPIO_19" : 147, ///< GPIO Event #19
   "GPIO_20" : 148, ///< GPIO Event #20
   "GPIO_21" : 149, ///< GPIO Event #21
   "GPIO_22" : 150, ///< GPIO Event #22
   "GPIO_23" : 151, ///< GPIO Event #23
   "GPIO_24" : 152, ///< GPIO Event #24
   "GPIO_25" : 153, ///< GPIO Event #25
   "GPIO_26" : 154, ///< GPIO Event #26
   "GPIO_27" : 155, ///< GPIO Event #27
   "GPIO_28" : 156, ///< GPIO Event #28
   "GPIO_29" : 157, ///< GPIO Event #29
   "GPIO_30" : 158, ///< GPIO Event #30
   "GPIO_31" : 159, ///< GPIO Event #31
   "APB_SW_0" : 160, ///< APB Software Event #0
   "APB_SW_1" : 161, ///< APB Software Event #1
   "APB_SW_2" : 162, ///< APB Software Event #2
   "APB_SW_3" : 163, ///< APB Software Event #3
   "APB_SW_4" : 164, ///< APB Software Event #4
   "APB_SW_5" : 165, ///< APB Software Event #5
   "APB_SW_6" : 166, ///< APB Software Event #6
   "APB_SW_7" : 167, ///< APB Software Event #7
   "REF_CLK_RISE" : 168 ///< Reference Clock Rise Event
};


`endif // __UVME_CVMCU_CHIP_CONSTANTS_SV__