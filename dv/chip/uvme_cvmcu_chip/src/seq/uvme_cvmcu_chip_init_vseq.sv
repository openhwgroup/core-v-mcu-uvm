// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_INIT_VSEQ_SV__
`define __UVME_CVMCU_CHIP_INIT_VSEQ_SV__


/**
 * Sequence initializing CORE-V-MCU Chip probe input signals.
 */
class uvme_cvmcu_chip_init_vseq_c extends uvme_cvmcu_chip_base_vseq_c;

   `uvm_object_utils(uvme_cvmcu_chip_init_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_init_vseq");
      super.new(name);
   endfunction

   /**
    * Drives signals to default values.
    */
   virtual task body();
      cntxt.probe_vif.sys_clk_mp.sys_clk_cb.bootsel_i <= 1;
      cntxt.probe_vif.sys_clk_mp.sys_clk_cb.stm_i <= 0;
   endtask

endclass : uvme_cvmcu_chip_init_vseq_c


`endif // __UVME_CVMCU_CHIP_INIT_VSEQ_SV__