// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_INIT_VSEQ_SV__
`define __UVME_APB_TIMER_SS_INIT_VSEQ_SV__


/**
 * Sequence initializing APB simple timer unit Sub-System probe input signals.
 * @ingroup uvme_apb_timer_ss_seq
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
      `uvmx_probe_drv_signal(stoptimer_i, 0)
      `uvmx_probe_drv_signal(event_lo_i, 0)
      `uvmx_probe_drv_signal(event_hi_i, 0)
   endtask

endclass : uvme_apb_timer_ss_init_vseq_c


`endif // __UVME_APB_TIMER_SS_INIT_VSEQ_SV__