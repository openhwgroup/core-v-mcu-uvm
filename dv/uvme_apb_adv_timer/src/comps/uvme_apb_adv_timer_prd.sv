// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_PRD_SV__
`define __UVME_APB_ADV_TIMER_PRD_SV__


/**
 * Component implementing transaction-based model of APB Advanced Timer Sub-System.
 * @ingroup uvme_apb_adv_timer_comps
 */
class uvme_apb_adv_timer_prd_c extends uvmx_prd_c #(
   .T_CFG  (uvme_apb_adv_timer_cfg_c  ),
   .T_CNTXT(uvme_apb_adv_timer_cntxt_c)
);

   /// @name TLM
   /// @{
   uvm_tlm_analysis_fifo #(uvma_apb_mon_trn_c)  apb_fifo; ///< Queue of apb transactions
   // TODO Add TLM outputs to uvme_apb_adv_timer_prd_c
   //      Ex: uvm_analysis_port #(uvml_eth_pkt_mon_trn_c)  pkt_out_ap; ///< Describe me!
   /// @}


   `uvm_component_utils(uvme_apb_adv_timer_prd_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_prd", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      apb_fifo = new("apb_fifo", this);
   endfunction

   /**
    * Creates Analysis Ports.
    */
   virtual function void create_ports();
      // TODO Create Output TLM objects for uvme_apb_adv_timer_prd_c
      //      Ex: pkt_out_ap = new("pkt_out_ap", this);
   endfunction

   /**
    *
    */
   virtual task predict();
      fork
         process_apb();
      join
   endtask

   /**
    *
    */
   virtual task process_apb();
      uvma_apb_mon_trn_c  apb_trn;
      uvm_reg  target_reg;
      forever begin
         apb_fifo.get(apb_trn);
         target_reg = cntxt.reg_model.default_map.get_reg_by_offset(apb_trn.address-cfg.reg_block_base_address);
         // TODO Implement uvme_apb_adv_timer_prd_c::process_apb()
         //      Ex: case (target_reg)
         //             cntxt.reg_model.abc_reg: begin
         //                cntxt.reg_model.def_reg.set(apb_trn.data);
         //             end
         //          endcase
      end
   endtask

endclass : uvme_apb_adv_timer_prd_c


`endif // __UVME_APB_ADV_TIMER_PRD_SV__