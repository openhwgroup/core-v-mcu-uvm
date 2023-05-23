// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_DPO_MON_TRN_SV__
`define __UVMA_TPRESCALER_B_DPO_MON_TRN_SV__


/**
 * Control Plane monitor transaction sampled by uvma_tprescaler_b_dpo_mon_c.
 * @ingroup uvma_tprescaler_b_obj
 */
class uvma_tprescaler_b_dpo_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_tprescaler_b_cfg_c  ),
   .T_CNTXT(uvma_tprescaler_b_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}

   /// @name Metadata
   /// @{
   uvma_tprescaler_b_counter_value_o_l_t  counter_value_o ; ///< 
   logic                                  target_reached_o; ///< 
   /// @}


   `uvm_object_utils_begin(uvma_tprescaler_b_dpo_mon_trn_c)
      `uvm_field_int(counter_value_o, UVM_DEFAULT)
      `uvm_field_int(target_reached_o, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_dpo_mon_trn");
      super.new(name);
   endfunction

   /**
    * Describes transaction for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string counter_value_o_str;
      string target_reached_o_str;
      counter_value_o_str = $sformatf("%h", counter_value_o);
      target_reached_o_str = $sformatf("%b", target_reached_o);
      `uvmx_metadata_field("counter_value_o", counter_value_o_str)
      `uvmx_metadata_field("target_reached_o", target_reached_o_str)
   endfunction

endclass : uvma_tprescaler_b_dpo_mon_trn_c


`endif // __UVMA_TPRESCALER_B_DPO_MON_TRN_SV__