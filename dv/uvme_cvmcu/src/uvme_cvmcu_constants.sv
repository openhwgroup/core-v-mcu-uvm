// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CONSTANTS_SV__
`define __UVME_CVMCU_CONSTANTS_SV__


const longint unsigned  uvme_cvmcu_default_reg_block_base_address = `UVM_REG_ADDR_WIDTH'h0000_0000; ///< Register block base address
const int unsigned      uvme_cvmcu_reg_block_reg_n_bytes          = 4; ///< Width of registers (bytes)

const string  uvme_cvmcu_irq_lines[] = '{
   "RSVD00"      ,
   "RSVD01"      ,
   "RSVD02"      ,
   "CLINT_SW"    ,
   "RSVD04"      ,
   "RSVD05"      ,
   "RSVD06"      ,
   "CLINT_TIMER" ,
   "RSVD08"      ,
   "RSVD09"      ,
   "RSVD10"      ,
   "CLINT_EXT"   ,
   "RSVD12"      ,
   "RSVD13"      ,
   "RSVD14"      ,
   "RSVD15"      ,
   "TIMER_LO"    ,
   "TIMER_HI"    ,
   "REF_CLK_RISE",
   "REF_CLK_FALL",
   "I2C"         ,
   "ADV_TIMER_0" ,
   "ADV_TIMER_1" ,
   "ADV_TIMER_2" ,
   "ADV_TIMER_3" ,
   "EFPGA_0"     ,
   "EFPGA_1"     ,
   "EFPGA_2"     ,
   "EFPGA_3"     ,
   "EFPGA_4"     ,
   "EFPGA_5"     ,
   "ERROR"
};


`endif // __UVME_CVMCU_CONSTANTS_SV__
