// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_INIT_VSEQ_SV__
`define __UVME_APB_TIMER_SS_INIT_VSEQ_SV__


/**
 * Sequence initializing APB simple timer unit Sub-System probe input signals.
 */
class uvme_apb_timer_ss_init_vseq_c extends uvme_apb_timer_ss_base_vseq_c;

   `uvm_object_utils(uvme_apb_timer_ss_init_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_init_vseq");
      super.new(name);
   endfunction

   /**
    * Drives signals to default values.
    */
   virtual task body();
      cntxt.probe_vif.sys_clk_mp.sys_clk_cb.stoptimer_i <= 0;
      cntxt.probe_vif.sys_clk_mp.sys_clk_cb.event_lo_i <= 0;
      cntxt.probe_vif.sys_clk_mp.sys_clk_cb.event_hi_i <= 0;
   endtask

endclass : uvme_apb_timer_ss_init_vseq_c


`endif // __UVME_APB_TIMER_SS_INIT_VSEQ_SV__