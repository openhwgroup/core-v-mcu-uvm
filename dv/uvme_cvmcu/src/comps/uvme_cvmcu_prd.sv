// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_PRD_SV__
`define __UVME_CVMCU_PRD_SV__


/**
 * Component implementing transaction-based model of CORE-V MCU.
 * @ingroup uvme_cvmcu_comps
 */
class uvme_cvmcu_prd_c extends uvmx_prd_c #(
   .T_CFG  (uvme_cvmcu_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_cntxt_c)
);

   /// @name TLM
   /// @{
   uvm_tlm_analysis_fifo #(uvma_obi_mon_trn_c)  obi_data_fifo; ///< Queue of obi transactions
   // TODO Add TLM outputs to uvme_cvmcu_prd_c
   //      Ex: uvm_analysis_port #(uvml_eth_pkt_mon_trn_c)  pkt_out_ap; ///< Describe me!
   /// @}


   `uvm_component_utils(uvme_cvmcu_prd_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_prd", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      obi_data_fifo = new("obi_data_fifo", this);
   endfunction

   /**
    * Creates Analysis Ports.
    */
   virtual function void create_ports();
      // TODO Create Output TLM objects for uvme_cvmcu_prd_c
      //      Ex: pkt_out_ap = new("pkt_out_ap", this);
   endfunction

   /**
    *
    */
   virtual task predict();
      fork
         process_obi();
      join
   endtask

   /**
    *
    */
   virtual task process_obi();
      uvma_obi_mon_trn_c  obi_trn   ;
      uvm_reg             target_reg;
      forever begin
         obi_data_fifo.get(obi_trn);
         target_reg = cntxt.reg_model.default_map.get_reg_by_offset(obi_trn.address-cfg.reg_block_base_address);
         // TODO Implement uvme_cvmcu_prd_c::process_obi()
         //      Ex: case (target_reg)
         //             cntxt.reg_model.abc_reg: begin
         //                if (obi_trn.access == UVMA_OBI_ACCESS_WRITE) begin
         //                   cntxt.reg_model.xyz_reg.set(obi_trn.data);
         //                end
         //             end
         //          endcase
      end
   endtask

endclass : uvme_cvmcu_prd_c


`endif // __UVME_CVMCU_PRD_SV__
