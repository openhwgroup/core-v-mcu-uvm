// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_REG_HW_RESET_TEST_SV__
`define __UVMT_APB_ADV_TIMER_REG_HW_RESET_TEST_SV__


/**
 * Test ensuring that the reset values specified for registers in the RAL matches what is in the APB Advanced Timer Sub-System DUT.
 */
class uvmt_apb_adv_timer_reg_hw_reset_test_c extends uvmt_apb_adv_timer_reg_base_test_c;

   rand uvme_apb_adv_timer_reg_hw_reset_vseq_c  hw_reset_vseq; ///< Virtual sequence to be run


   `uvm_component_utils(uvmt_apb_adv_timer_reg_hw_reset_test_c)


   /**
    * By default, we only test a single register block.
    */
   constraint defaults_cons {
      soft hw_reset_vseq.single_block_mode == 1;
   }


   /**
    * Creates hw_reset_vseq.
    */
   extern function new(string name="uvmt_apb_adv_timer_reg_hw_reset_test", uvm_component parent=null);

   /**
    * Runs hw_reset_vseq on vsequencer.
    */
   extern virtual task configure_phase(uvm_phase phase);

endclass : uvmt_apb_adv_timer_reg_hw_reset_test_c


function uvmt_apb_adv_timer_reg_hw_reset_test_c::new(string name="uvmt_apb_adv_timer_reg_hw_reset_test", uvm_component parent=null);

   super.new(name, parent);
   hw_reset_vseq = uvme_apb_adv_timer_reg_hw_reset_vseq_c::type_id::create("hw_reset_vseq");

endfunction : new


task uvmt_apb_adv_timer_reg_hw_reset_test_c::configure_phase(uvm_phase phase);

   super.configure_phase(phase);

   `uvm_info("TEST", $sformatf("Starting hw_reset virtual sequence:\n%s", hw_reset_vseq.sprint()), UVM_NONE)
   hw_reset_vseq.single_block = test_cfg.selected_reg_block;
   hw_reset_vseq.start(vsequencer);
   `uvm_info("TEST", "Finished hw_reset virtual sequence", UVM_NONE)

endtask : configure_phase


`endif // __UVMT_APB_ADV_TIMER_REG_HW_RESET_TEST_SV__
