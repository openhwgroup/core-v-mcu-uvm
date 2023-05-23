// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_PRD_SV__
`define __UVME_APB_ADV_TIMER_SS_PRD_SV__


/**
 * Component implementing transaction-based model of APB Advanced Timer Sub-System.
 * @ingroup uvme_apb_adv_timer_ss_comps
 */
class uvme_apb_adv_timer_ss_prd_c extends uvmx_ss_prd_c #(
   .T_CFG  (uvme_apb_adv_timer_ss_cfg_c  ),
   .T_CNTXT(uvme_apb_adv_timer_ss_cntxt_c)
);

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_apb_mon_trn_c)  proc_reg_fifo; ///< Queue of input apb transactions from Processor access agent
   /// @}

   /// @name Analysis ports
   /// @{
   /// @}


   `uvm_component_utils(uvme_apb_adv_timer_ss_prd_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_prd", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      proc_reg_fifo = new("proc_reg_fifo", this);
   endfunction

   /**
    * Creates analysis ports.
    */
   virtual function void create_ports();
   endfunction

   /**
    * Executes prediction threads.
    */
   virtual task predict();
      fork
         predict_proc_reg();
      join
   endtask

   /**
    * Prediction thread for Processor access register accesses.
    */
   virtual task predict_proc_reg();
      uvma_apb_mon_trn_c  apb_trn;
      uvm_reg  target_reg;
      forever begin
         `uvmx_prd_get(proc_reg_fifo, apb_trn)
         target_reg = `uvmx_prd_get_reg(default_map, apb_trn.address);
         // TODO Implement uvme_apb_adv_timer_ss_prd_c::process_proc_reg()
         //      Ex: case (target_reg)
         //             cntxt.reg_model.abc_reg: begin
         //                cntxt.reg_model.xyz_reg.set(apb_trn.data);
         //             end
         //          endcase
      end
   endtask

endclass : uvme_apb_adv_timer_ss_prd_c


`endif // __UVME_APB_ADV_TIMER_SS_PRD_SV__