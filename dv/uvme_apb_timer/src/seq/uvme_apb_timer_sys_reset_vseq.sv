// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SYS_RESET_VSEQ_SV__
`define __UVME_APB_TIMER_SYS_RESET_VSEQ_SV__


/**
 * Virtual sequence responsible for asserting reset for the APB Timer Sub-System environment.
 */
class uvme_apb_timer_sys_reset_vseq_c extends uvme_apb_timer_base_vseq_c;

   /// @defgroup Knobs
   /// @{
   rand int unsigned  duration_min; ///< Lower bound for reset pulse duration
   rand int unsigned  duration_max; ///< Upper bound for reset pulse duration
   /// @}


   `uvm_object_utils_begin(uvme_apb_timer_sys_reset_vseq_c)
      `uvm_field_int(duration_min, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(duration_max, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Sets safe defaults for knobs.
    */
   constraint defaults_cons {
      soft duration_min ==  10;
      soft duration_max == 100;
   }


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_sys_reset_vseq_c");

   /**
    * Sends single reset pulse.
    */
   extern virtual task body();

endclass : uvme_apb_timer_sys_reset_vseq_c


function uvme_apb_timer_sys_reset_vseq_c::new(string name="uvme_apb_timer_sys_reset_vseq_c");

   super.new(name);

endfunction : new


task uvme_apb_timer_sys_reset_vseq_c::body();

   uvma_reset_seq_item_c  reset_req;

   `uvm_do_on_with(reset_req, p_sequencer.sys_reset_sequencer, {
      duration >= duration_min;
      duration <= duration_max;
   })

endtask : body


`endif // __UVME_APB_TIMER_SYS_RESET_VSEQ_SV__
