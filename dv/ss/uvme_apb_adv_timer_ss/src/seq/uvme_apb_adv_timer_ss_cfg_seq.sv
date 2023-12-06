// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_CFG_SEQ_SV__
`define __UVME_APB_ADV_TIMER_SS_CFG_SEQ_SV__


/**
 * Sets register values to reflect environment configuration.
 * @ingroup uvme_apb_adv_timer_ss_seq
 */
class uvme_apb_adv_timer_ss_cfg_seq_c extends uvme_apb_adv_timer_ss_base_seq_c;

   /// @name Knobs
   /// @{
   /// @}


   `uvm_object_utils_begin(uvme_apb_adv_timer_ss_cfg_seq_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_cfg_seq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvme_apb_adv_timer_ss_cfg_seq_c::body()
    */
   virtual task body();
      uvm_status_e    status;
      uvm_reg_data_t  value ;
      // TODO Implement uvme_apb_adv_timer_ss_cfg_seq_c::body()
      //      Ex: cntxt.reg_model.abc.xyz.write(status, cfg.xyz);
   endtask

endclass


`endif // __UVME_APB_ADV_TIMER_SS_CFG_SEQ_SV__