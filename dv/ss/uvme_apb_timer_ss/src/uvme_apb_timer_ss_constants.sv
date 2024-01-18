// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_CONSTANTS_SV__
`define __UVME_APB_TIMER_SS_CONSTANTS_SV__


const uvm_reg_addr_t  uvme_apb_timer_ss_default_reg_block_base_address = 'h0000_0000; ///< Register block base address
const int unsigned    uvme_apb_timer_ss_reg_block_reg_n_bytes          = 4; ///< Width of registers (bytes)

/**
 * Events IRQ lines.
 */
const int unsigned  uvme_apb_timer_ss_events_irq_lines[string] = '{
   "LOW" : 0, ///< Low
   "HIGH" : 1 ///< High
};


`endif // __UVME_APB_TIMER_SS_CONSTANTS_SV__