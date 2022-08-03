// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_INTR_SQR_SV__
`define __UVMA_CVMCU_INTR_SQR_SV__


/**
 * Component running CORE-V MCU Interrupt sequences of uvma_cvmcu_intr_seq_item_c requests (and responses).
 * Provides sequence items for uvma_cvmcu_intr_drv_c.
 * @ingroup uvma_cvmcu_intr_comps
 */
class uvma_cvmcu_intr_sqr_c extends uvml_sqr_c #(
   .REQ(uvma_cvmcu_intr_seq_item_c),
   .RSP(uvma_cvmcu_intr_seq_item_c)
);

   /// @defgroup Objects
   /// @{
   uvma_cvmcu_intr_cfg_c    cfg  ; ///< Agent configuration handle
   uvma_cvmcu_intr_cntxt_c  cntxt; ///< Agent context handle
   /// @}


   `uvm_component_utils_begin(uvma_cvmcu_intr_sqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_cvmcu_intr_sqr", uvm_component parent=null);

   /**
    * Ensures #cfg & #cntxt handles are not null
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

endclass : uvma_cvmcu_intr_sqr_c


function uvma_cvmcu_intr_sqr_c::new(string name="uvma_cvmcu_intr_sqr", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvma_cvmcu_intr_sqr_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg  ();
   get_cntxt();

endfunction : build_phase


function void uvma_cvmcu_intr_sqr_c::get_cfg();

   void'(uvm_config_db#(uvma_cvmcu_intr_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CVMCU_INTR_SQR", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvma_cvmcu_intr_sqr_c::get_cntxt();

   void'(uvm_config_db#(uvma_cvmcu_intr_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CVMCU_INTR_SQR", "Context handle is null")
   end

endfunction : get_cntxt


`endif // __UVMA_CVMCU_INTR_SQR_SV__
