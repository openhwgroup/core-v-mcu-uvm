// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_UDMA_CTRL_VSQR_SV__
`define __UVME_UDMA_CTRL_VSQR_SV__


/**
 * Component on which all uDMA Controller Block environment (uvme_udma_ctrl_env_c) virtual sequences are run.
 * @ingroup uvme_udma_ctrl_comps
 */
class uvme_udma_ctrl_vsqr_c extends uvml_vsqr_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   /// @defgroup Objects
   /// @{
   uvme_udma_ctrl_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_udma_ctrl_cntxt_c  cntxt; ///< Environment context handle
   /// @}

   /// @defgroup Sequencer handles
   /// @{
   uvma_clk_sqr_c    clk_sequencer  ; ///< Clock agent sequencer
   uvma_reset_sqr_c  reset_sequencer; ///< Reset agent sequencer
   uvma_udma_ctrl_cp_sqr_c      cp_sequencer    ; ///< Control plane agent sequencer
   uvma_udma_ctrl_dp_in_sqr_c   dp_in_sequencer ; ///< Data plane input agent sequencer
   uvma_udma_ctrl_dp_out_sqr_c  dp_out_sequencer; ///< Data plane output agent sequencer
   /// @}


   `uvm_component_utils_begin(uvme_udma_ctrl_vsqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_udma_ctrl_sqr", uvm_component parent=null);

   /**
    * Ensures #cfg & #cntxt handles are not null.
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Uses uvm_config_db to retrieve cfg.
    */
   extern function void get_cfg();

   /**
    * Uses uvm_config_db to retrieve cntxt.
    */
   extern function void get_cntxt();

endclass : uvme_udma_ctrl_vsqr_c


function uvme_udma_ctrl_vsqr_c::new(string name="uvme_udma_ctrl_sqr", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_udma_ctrl_vsqr_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg  ();
   get_cntxt();

endfunction : build_phase


function void uvme_udma_ctrl_vsqr_c::get_cfg();

   void'(uvm_config_db#(uvme_udma_ctrl_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("UDMA_CTRL_VSQR", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvme_udma_ctrl_vsqr_c::get_cntxt();

   void'(uvm_config_db#(uvme_udma_ctrl_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("UDMA_CTRL_VSQR", "Context handle is null")
   end

endfunction : get_cntxt


`endif // __UVME_UDMA_CTRL_VSQR_SV__
