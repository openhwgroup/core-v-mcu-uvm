// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add a new sequence to the APB Advanced Timer Sub-System environment.


`ifndef __UVME_APB_ADV_TIMER_MY_SEQ_SV__
`define __UVME_APB_ADV_TIMER_MY_SEQ_SV__


/**
 * Sample sequence that runs 5 fully random items by default.
 */
class uvme_apb_adv_timer_my_seq_c extends uvme_apb_adv_timer_base_vseq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of sequence items to be generated.
   /// @}


   `uvm_object_utils_begin(uvme_apb_adv_timer_my_seq_c)
      `uvm_field_int(num_items, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default values for random fields.
    */
   constraint defaults_cons {
      soft num_items == 5;
   }


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_adv_timer_my_seq");

   /**
    * Generates #num_items of fully random reqs.
    */
   extern virtual task body();

endclass : uvme_apb_adv_timer_my_seq_c


function uvme_apb_adv_timer_my_seq_c::new(string name="uvme_apb_adv_timer_my_seq");

   super.new(name);

endfunction : new


task uvme_apb_adv_timer_my_seq_c::body();

   repeat (num_items) begin
      `uvm_do_on(req, p_sequencer.apb_sequencer)
   end

endtask : body


`endif // __UVME_APB_ADV_TIMER_MY_SEQ_SV__