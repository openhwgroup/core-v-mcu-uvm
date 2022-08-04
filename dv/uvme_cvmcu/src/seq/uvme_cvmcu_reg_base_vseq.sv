// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_REG_BASE_VSEQ_SV__
`define __UVME_CVMCU_REG_BASE_VSEQ_SV__


/**
 * Abstract object from which all other CORE-V MCU register-oriented virtual sequences must extend.
 */
class uvme_cvmcu_reg_base_vseq_c extends uvme_cvmcu_base_vseq_c;

   /// @defgroup Knobs
   /// @{
   string         ignore_list   [$]; ///<
   rand bit       single_block_mode; ///< Enables/disables testing multiple register blocks
   uvm_reg_block  single_block     ; ///< If testing only one block, this is its handle
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_reg_base_vseq_c)
      `uvm_field_int   (single_block_mode, UVM_DEFAULT)
      `uvm_field_object(single_block     , UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_reg_base_vseq");

   /**
    * Executes run_single_block() or run_all_blocks(), depending on
    * single_block_mode.
    */
   extern virtual task body();

   /**
    * TODO Describe uvme_cvmcu_reg_base_vseq_c::add_to_ignore_list()
    */
   extern virtual function void add_to_ignore_list();

   /**
    * TODO Describe uvme_cvmcu_reg_base_vseq_c::process_ignore_list()
    */
   extern function void process_ignore_list();

   /**
    * Pure virtual task
    */
   extern virtual task run_single_block();

   /**
    * Pure virtual task
    */
   extern virtual task run_all_blocks();

endclass : uvme_cvmcu_reg_base_vseq_c


function uvme_cvmcu_reg_base_vseq_c::new(string name="uvme_cvmcu_reg_base_vseq");

   super.new(name);

endfunction : new


task uvme_cvmcu_reg_base_vseq_c::body();

   add_to_ignore_list ();
   process_ignore_list();
   if (single_block_mode) begin
      run_single_block();
   end
   else begin
      run_all_blocks();
   end

endtask : body


function void uvme_cvmcu_reg_base_vseq_c::add_to_ignore_list();

   `uvm_fatal("VSEQ", "Call to pure virtual function")

endfunction : add_to_ignore_list


function void uvme_cvmcu_reg_base_vseq_c::process_ignore_list();

   foreach (ignore_list[ii]) begin
      uvm_resource_db#(bit)::set({"REG::", cfg.cvmcu_reg_block.get_full_name(), ".", ignore_list[ii]}, "NO_REG_TESTS", 1, this);
   end

endfunction : process_ignore_list


task uvme_cvmcu_reg_base_vseq_c::run_single_block();

   `uvm_fatal("VSEQ", "Call to pure virtual task")

endtask : run_single_block


task uvme_cvmcu_reg_base_vseq_c::run_all_blocks();

   `uvm_fatal("VSEQ", "Call to pure virtual task")

endtask : run_all_blocks


`endif // __UVME_CVMCU_REG_BASE_VSEQ_SV__
