// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_VSQR_SV__
`define __UVMA_ADV_TIMER_B_VSQR_SV__


/**
 * Control Plane Sequencer.
 * @ingroup uvma_adv_timer_b_comps
 */
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_adv_timer_b_cfg_c        ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c      ),
   .T_SEQ_ITEM(uvma_adv_timer_b_cp_seq_item_c)
) uvma_adv_timer_b_cp_sqr_c;

/**
 * Data Plane Input Sequencer.
 * @ingroup uvma_adv_timer_b_comps
 */
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_adv_timer_b_cfg_c         ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c       ),
   .T_SEQ_ITEM(uvma_adv_timer_b_dpi_seq_item_c)
) uvma_adv_timer_b_dpi_sqr_c;

/**
 * Data Plane Output Sequencer.
 * @ingroup uvma_adv_timer_b_comps
 */
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_adv_timer_b_cfg_c         ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c       ),
   .T_SEQ_ITEM(uvma_adv_timer_b_dpo_seq_item_c)
) uvma_adv_timer_b_dpo_sqr_c;


/**
 * Virtual Sequencer running  Agent Virtual Sequences extending uvma_adv_timer_b_base_vseq_c.
 * @ingroup uvma_adv_timer_b_comps
 */
class uvma_adv_timer_b_vsqr_c extends uvmx_agent_vsqr_c #(
   .T_CFG     (uvma_adv_timer_b_cfg_c     ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c   ),
   .T_SEQ_ITEM(uvma_adv_timer_b_seq_item_c)
);

   /// @name Components
   /// @{
   uvma_adv_timer_b_cp_sqr_c   cp_sequencer ; ///< Control Plane Sequencer connected to uvma_adv_timer_b_cp_drv_c.
   uvma_adv_timer_b_dpi_sqr_c  dpi_sequencer; ///< Data Plane Input Sequencer connected to uvma_adv_timer_b_dpi_drv_c.
   uvma_adv_timer_b_dpo_sqr_c  dpo_sequencer; ///< Data Plane Output Sequencer connected to uvma_adv_timer_b_dpo_drv_c.
   /// @}

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_adv_timer_b_mon_trn_c)  in_mon_trn_ap ; ///< Output port for Input Monitor Transactions.
   uvm_analysis_port #(uvma_adv_timer_b_mon_trn_c)  out_mon_trn_ap; ///< Output port for Output Monitor Transactions.
   /// @}

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_adv_timer_b_cp_mon_trn_c )  cp_mon_trn_fifo ; ///< Input for Monitor Transactions from uvma_adv_timer_b_cp_mon_c.
   uvm_tlm_analysis_fifo #(uvma_adv_timer_b_dpi_mon_trn_c)  dpi_mon_trn_fifo; ///< Input for Monitor Transactions from uvma_adv_timer_b_dpi_mon_c.
   uvm_tlm_analysis_fifo #(uvma_adv_timer_b_dpo_mon_trn_c)  dpo_mon_trn_fifo; ///< Input for Monitor Transactions from uvma_adv_timer_b_dpo_mon_c.
   /// @}


   `uvm_component_utils(uvma_adv_timer_b_vsqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_vsqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Sequencer components.
    */
   virtual function void create_sequencers();
      cp_sequencer  = uvma_adv_timer_b_cp_sqr_c ::type_id::create("cp_sequencer" , this);
      dpi_sequencer = uvma_adv_timer_b_dpi_sqr_c::type_id::create("dpi_sequencer", this);
      dpo_sequencer = uvma_adv_timer_b_dpo_sqr_c::type_id::create("dpo_sequencer", this);
   endfunction

   /**
    * Creates TLM Ports.
    */
   virtual function void create_ports();
      in_mon_trn_ap  = new("in_mon_trn_ap" , this);
      out_mon_trn_ap = new("out_mon_trn_ap", this);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      cp_mon_trn_fifo  = new("cp_mon_trn_fifo" , this);
      dpi_mon_trn_fifo = new("dpi_mon_trn_fifo", this);
      dpo_mon_trn_fifo = new("dpo_mon_trn_fifo", this);
   endfunction

endclass : uvma_adv_timer_b_vsqr_c


`endif // __UVMA_ADV_TIMER_B_VSQR_SV__