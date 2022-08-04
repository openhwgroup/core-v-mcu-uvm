// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_REG_BASE_VSEQ_SV__
`define __UVME_APB_ADV_TIMER_REG_BASE_VSEQ_SV__


/**
 * Abstract virtual sequence from which all other CORE-V MCU APB Advanced Timer Sub-System register virtual sequences must extend.
 * @ingroup uvme_apb_adv_timer_seq
 */
class uvme_apb_adv_timer_reg_base_vseq_c extends uvme_apb_adv_timer_base_vseq_c;

   /// @defgroup Knobs
   /// @{
   string         ignore_list   [$]; ///<
   rand bit       single_block_mode; ///< Enables/disables testing multiple register blocks
   uvm_reg_block  single_block     ; ///< If testing only one block, this is its handle
   /// @}


   `uvm_object_utils_begin(uvme_apb_adv_timer_reg_base_vseq_c)
      `uvm_field_int   (single_block_mode, UVM_DEFAULT)
      `uvm_field_object(single_block     , UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_adv_timer_reg_base_vseq");

   /**
    * Executes run_single_block() or run_all_blocks(), depending on #single_block_mode.
    */
   extern virtual task body();

   /**
    * TODO Describe uvme_apb_adv_timer_reg_base_vseq_c::add_to_ignore_list()
    */
   extern virtual function void add_to_ignore_list();

   /**
    * TODO Describe uvme_apb_adv_timer_reg_base_vseq_c::process_ignore_list()
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

endclass : uvme_apb_adv_timer_reg_base_vseq_c


function uvme_apb_adv_timer_reg_base_vseq_c::new(string name="uvme_apb_adv_timer_reg_base_vseq");

   super.new(name);

endfunction : new


task uvme_apb_adv_timer_reg_base_vseq_c::body();

   add_to_ignore_list ();
   process_ignore_list();
   if (single_block_mode) begin
      run_single_block();
   end
   else begin
      run_all_blocks();
   end

endtask : body


function void uvme_apb_adv_timer_reg_base_vseq_c::add_to_ignore_list();

   `uvm_fatal("VSEQ", "Call to pure virtual function")

endfunction : add_to_ignore_list


function void uvme_apb_adv_timer_reg_base_vseq_c::process_ignore_list();

   foreach (ignore_list[ii]) begin
      uvm_resource_db#(bit)::set({"REG::", cfg.apb_adv_timer_reg_block.get_full_name(), ".", ignore_list[ii]}, "NO_REG_TESTS", 1, this);
   end

endfunction : process_ignore_list


task uvme_apb_adv_timer_reg_base_vseq_c::run_single_block();

   `uvm_fatal("VSEQ", "Call to pure virtual task")

endtask : run_single_block


task uvme_apb_adv_timer_reg_base_vseq_c::run_all_blocks();

   `uvm_fatal("VSEQ", "Call to pure virtual task")

endtask : run_all_blocks


`endif // __UVME_APB_ADV_TIMER_REG_BASE_VSEQ_SV__
