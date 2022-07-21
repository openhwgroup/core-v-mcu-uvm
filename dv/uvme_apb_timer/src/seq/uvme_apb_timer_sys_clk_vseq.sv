// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SYS_CLK_VSEQ_SV__
`define __UVME_APB_TIMER_SYS_CLK_VSEQ_SV__


/**
 * Virtual sequence responsible for starting clock(s) for the APB Timer Sub-System environment.
 */
class uvme_apb_timer_sys_clk_vseq_c extends uvme_apb_timer_base_vseq_c;

   `uvm_object_utils(uvme_apb_timer_sys_clk_vseq_c)

   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_sys_clk_vseq_c");

   /**
    * Start clock generation with frequency set in #cfg.
    */
   extern virtual task body();

endclass : uvme_apb_timer_sys_clk_vseq_c


function uvme_apb_timer_sys_clk_vseq_c::new(string name="uvme_apb_timer_sys_clk_vseq_c");

   super.new(name);

endfunction : new


task uvme_apb_timer_sys_clk_vseq_c::body();

   uvma_clk_seq_item_c  clk_req;

   `uvm_do_on_with(clk_req, p_sequencer.sys_clk_sequencer, {
      action         == UVMA_CLK_SEQ_ITEM_ACTION_START;
      new_frequency  == cfg.sys_clk_frequency;
      new_duty_cycle == 50;
   })

endtask : body


`endif // __UVME_APB_TIMER_${sys_clk_agent_name_uppercase}_VSEQ_SV__
