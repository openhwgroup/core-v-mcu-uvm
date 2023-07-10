// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_CONSTANTS_SV__
`define __UVME_APB_ADV_TIMER_SS_CONSTANTS_SV__


const uvm_reg_addr_t  uvme_apb_adv_timer_ss_default_reg_block_base_address = 'h0000_0000; ///< Register block base address
const int unsigned    uvme_apb_adv_timer_ss_reg_block_reg_n_bytes          = 4; ///< Width of registers (bytes)

/**
 * Events IRQ lines.
 */
const int unsigned  uvme_apb_adv_timer_ss_events_irq_lines[string] = '{
   "EVENT_0" : 0, ///< Event #0
   "EVENT_1" : 1, ///< Event #1
   "EVENT_2" : 2, ///< Event #2
   "EVENT_3" : 3 ///< Event #3
};


`endif // __UVME_APB_ADV_TIMER_SS_CONSTANTS_SV__