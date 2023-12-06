// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_INIT_SEQ_SV__
`define __UVME_CVMCU_CHIP_INIT_SEQ_SV__


/**
 * Initializes any and all probe signals at start of simulation.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_init_seq_c extends uvme_cvmcu_chip_base_seq_c;

   `uvm_object_utils(uvme_cvmcu_chip_init_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_init_seq");
      super.new(name);
   endfunction

   /**
    * Drives signals to default values.
    */
   virtual task body();
      `uvmx_probe_drv_signal(bootsel_i, 1)
      `uvmx_probe_drv_signal(stm_i, 0)
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_INIT_SEQ_SV__