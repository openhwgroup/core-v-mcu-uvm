// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_VSQR_SV__
`define __UVME_CVMCU_INTR_ST_VSQR_SV__


/**
 * Component on which all CORE-V MCU Interrupt UVM Agent Self-Test Environment virtual sequences are run.
 * @ingroup uvma_cvmcu_intr_st_comps
 */
class uvme_cvmcu_intr_st_vsqr_c extends uvml_vsqr_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   /// @defgroup Objects
   /// @{
   uvme_cvmcu_intr_st_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_cvmcu_intr_st_cntxt_c  cntxt; ///< Environment context handle
   /// @}

   /// @defgroup Components
   /// @{
   uvma_cvmcu_intr_sqr_c  active_sequencer ; ///< Sequencer handle for active agent
   uvma_cvmcu_intr_sqr_c  passive_sequencer; ///< Sequencer handle for passive agent
   /// @}


   `uvm_component_utils_begin(uvme_cvmcu_intr_st_vsqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_intr_st_sqr", uvm_component parent=null);

   /**
    * Ensures cfg & cntxt handles are not null.
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

endclass : uvme_cvmcu_intr_st_vsqr_c


function uvme_cvmcu_intr_st_vsqr_c::new(string name="uvme_cvmcu_intr_st_sqr", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_cvmcu_intr_st_vsqr_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg  ();
   get_cntxt();

endfunction : build_phase


function void uvme_cvmcu_intr_st_vsqr_c::get_cfg();

   void'(uvm_config_db#(uvme_cvmcu_intr_st_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CVMCU_INTR_ST_VSQR", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvme_cvmcu_intr_st_vsqr_c::get_cntxt();

   void'(uvm_config_db#(uvme_cvmcu_intr_st_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CVMCU_INTR_ST_VSQR", "Context handle is null")
   end

endfunction : get_cntxt


`endif // __UVME_CVMCU_INTR_ST_VSQR_SV__
