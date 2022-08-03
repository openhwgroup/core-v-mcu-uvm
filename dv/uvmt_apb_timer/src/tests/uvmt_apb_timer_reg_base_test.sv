// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_REG_BASE_TEST_SV__
`define __UVMT_APB_TIMER_REG_BASE_TEST_SV__


/**
 * Abstract test from which all other CORE-V MCU APB Timer Sub-System register tests must extend.
 * @ingroup uvmt_apb_timer_tests
 */
class uvmt_apb_timer_reg_base_test_c extends uvmt_apb_timer_base_test_c;

   uvm_reg_block  selected_block; ///< Register block that will be targeted for testing


   `uvm_component_utils_begin(uvmt_apb_timer_reg_base_test_c)
      `uvm_field_object(selected_block, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Configuration for the register model.
    */
   constraint ral_defaults_cons {
      test_cfg.auto_ral_update == 0;
   }


   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_apb_timer_reg_base_test", uvm_component parent=null);

   /**
    * Sets target register block from CLI argument.
    */
   extern virtual function void connect_phase(uvm_phase phase);

endclass : uvmt_apb_timer_reg_base_test_c


function uvmt_apb_timer_reg_base_test_c::new(string name="uvmt_apb_timer_reg_base_test", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvmt_apb_timer_reg_base_test_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);

   if (test_cfg.cli_block_name_override) begin
      test_cfg.selected_reg_block = reg_block.get_block_by_name(test_cfg.cli_block_name_parsed_str);
   end
   else begin
      test_cfg.selected_reg_block = reg_block;
   end

endfunction : connect_phase


`endif // __UVMT_APB_TIMER_REG_BASE_TEST_SV__
