// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_SYS_CLK_VSEQ_SV__
`define __UVME_CVMCU_SYS_CLK_VSEQ_SV__



/**
 * Virtual sequence responsible for starting clocks for the CORE-V MCU DUT.
 */
class uvme_cvmcu_sys_clk_vseq_c extends uvme_cvmcu_base_vseq_c;

   `uvm_object_utils_begin(uvme_cvmcu_sys_clk_vseq_c)
   `uvm_object_utils_end

   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_sys_clk_vseq_c");

   /**
    * TODO Describe uvme_cvmcu_sys_clk_vseq_c::body()
    */
   extern virtual task body();

endclass : uvme_cvmcu_sys_clk_vseq_c


function uvme_cvmcu_sys_clk_vseq_c::new(string name="uvme_cvmcu_sys_clk_vseq_c");

   super.new(name);

endfunction : new


task uvme_cvmcu_sys_clk_vseq_c::body();

   uvma_clk_seq_item_c  req;

   `uvm_do_on_with(req, p_sequencer.sys_clk_sequencer, {
      action == UVMA_CLK_SEQ_ITEM_ACTION_START;
      new_frequency == cfg.sys_clk_period;
   })

endtask : body


`endif // __UVME_CVMCU_SYS_CLK_VSEQ_SV__
