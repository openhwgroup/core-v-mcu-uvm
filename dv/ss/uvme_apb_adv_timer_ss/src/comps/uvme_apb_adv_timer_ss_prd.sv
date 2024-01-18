// Copyright 2024 Datum Technology Corporation
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
      join
   endtask

   /**
    * Prediction thread for register accesses.
    */
   virtual task predict_reg_op(ref uvm_reg_item op);
      uvm_reg        target_reg  ;
      uvm_reg_field  target_field;
      uvm_mem        target_mem  ;
      case (op.element_kind)
         UVM_REG: begin
            // TODO Implement uvme_apb_adv_timer_ss_prd_c::predict_reg_op() for registers
            //      Ex: case (target_reg)
            //             cntxt.reg_model.abc_reg: begin
            //                cntxt.reg_model.xyz_reg.set('h123);
            //             end
            //          endcase
         end
         UVM_FIELD: begin
            // TODO Implement uvme_apb_adv_timer_ss_prd_c::predict_reg_op() for fields
            //      Ex: case (target_reg)
            //             cntxt.reg_model.abc_reg.def_field: begin
            //                cntxt.reg_model.xyz_reg.ghi_field.set('h1);
            //             end
            //          endcase
         end
         UVM_MEM: begin
            // TODO Implement uvme_apb_adv_timer_ss_prd_c::predict_reg_op() for memories
            //      Ex: case (target_mem)
            //             cntxt.reg_model.ram: begin
            //                case (op.offset)
            //                   cntxt.reg_model.abc_reg.def_field: begin
            //                      cntxt.reg_model.xyz_reg.ghi_field.set('h123);
            //                   end
            //                endcase
            //             end
            //          endcase
         end
      endcase
   endtask

endclass


`endif // __UVME_APB_ADV_TIMER_SS_PRD_SV__