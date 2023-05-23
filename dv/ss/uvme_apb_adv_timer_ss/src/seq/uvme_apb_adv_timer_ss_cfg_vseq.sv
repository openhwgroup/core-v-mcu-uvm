// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_CFG_VSEQ_SV__
`define __UVME_APB_ADV_TIMER_SS_CFG_VSEQ_SV__


/**
 * Sequence configuring registers of the APB Advanced Timer Sub-System DUT.
 */
class uvme_apb_adv_timer_ss_cfg_vseq_c extends uvme_apb_adv_timer_ss_base_vseq_c;

   /// @name Knobs
   /// @{
   /// @}


   `uvm_object_utils_begin(uvme_apb_adv_timer_ss_cfg_vseq_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_cfg_vseq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvme_apb_adv_timer_ss_cfg_vseq_c::body()
    */
   virtual task body();
      uvm_status_e    status;
      uvm_reg_data_t  value ;
      // TODO Implement uvme_apb_adv_timer_ss_cfg_vseq_c::body()
      //      Ex: cntxt.reg_model.abc.xyz.write(status, cfg.xyz);
   endtask

endclass : uvme_apb_adv_timer_ss_cfg_vseq_c


`endif // __UVME_APB_ADV_TIMER_SS_CFG_VSEQ_SV__