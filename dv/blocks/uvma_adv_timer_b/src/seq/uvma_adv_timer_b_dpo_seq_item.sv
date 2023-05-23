// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_DPO_SEQ_ITEM_SV__
`define __UVMA_ADV_TIMER_B_DPO_SEQ_ITEM_SV__


/**
 * Sequence Item providing stimulus for the Data Plane Output driver (uvma_adv_timer_b_dpo_drv_c).
 * @ingroup uvma_adv_timer_b_seq
 */
class uvma_adv_timer_b_dpo_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_adv_timer_b_cfg_c  ),
   .T_CNTXT(uvma_adv_timer_b_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}

   /// @name Metadata
   /// @{
   uvma_adv_timer_b_num_bits_l_t  counter_o; ///< 
   uvma_adv_timer_b_pwm_o_l_t     pwm_o    ; ///< 
   uvma_adv_timer_b_status_o_l_t  status_o ; ///< 
   /// @}


   `uvm_object_utils_begin(uvma_adv_timer_b_dpo_seq_item_c)
      `uvm_field_int(counter_o, UVM_DEFAULT)
      `uvm_field_int(pwm_o, UVM_DEFAULT)
      `uvm_field_int(status_o, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_dpo_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes transaction for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string counter_o_str;
      string pwm_o_str;
      string status_o_str;
      counter_o_str = $sformatf("%h", counter_o);
      pwm_o_str = $sformatf("%h", pwm_o);
      status_o_str = $sformatf("%h", status_o);
      `uvmx_metadata_field("counter_o", counter_o_str)
      `uvmx_metadata_field("pwm_o", pwm_o_str)
      `uvmx_metadata_field("status_o", status_o_str)
   endfunction

endclass : uvma_adv_timer_b_dpo_seq_item_c


`endif // __UVMA_ADV_TIMER_B_DPO_SEQ_ITEM_SV__