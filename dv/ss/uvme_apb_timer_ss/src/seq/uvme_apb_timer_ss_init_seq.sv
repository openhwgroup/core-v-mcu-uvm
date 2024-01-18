// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_INIT_SEQ_SV__
`define __UVME_APB_TIMER_SS_INIT_SEQ_SV__


/**
 * Initializes any and all probe signals at start of simulation.
 * @ingroup uvme_apb_timer_ss_seq
 */
class uvme_apb_timer_ss_init_seq_c extends uvme_apb_timer_ss_base_seq_c;

   `uvm_object_utils(uvme_apb_timer_ss_init_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_init_seq");
      super.new(name);
   endfunction

   /**
    * Drives signals to default values.
    */
   virtual task body();
      `uvmx_probe_drv_signal(stoptimer_i, 0)
      `uvmx_probe_drv_signal(event_lo_i, 0)
      `uvmx_probe_drv_signal(event_hi_i, 0)
   endtask

endclass


`endif // __UVME_APB_TIMER_SS_INIT_SEQ_SV__