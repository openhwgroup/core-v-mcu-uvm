// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_RESET_SEQ_SV__
`define __UVME_CVMCU_CHIP_RESET_SEQ_SV__


/**
 * Resets register values to reflect environment configuration.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_reset_seq_c extends uvme_cvmcu_chip_base_seq_c;

   `uvm_object_utils_begin(uvme_cvmcu_chip_reset_seq_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_reset_seq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvme_cvmcu_chip_reset_seq_c::body()
    */
   virtual task body();
      pre_reset ();
      in_reset  ();
      post_reset();
   endtask

   /**
    * TODO Describe uvme_cvmcu_chip_reset_seq_c::pre_reset()
    */
   virtual task pre_reset();
      if (cfg.uart0_agent_cfg.enabled) begin
         `uvmx_set_field(udma_ctrl.periph_reset.uart0, 1)
      end
      if (cfg.uart1_agent_cfg.enabled) begin
         `uvmx_set_field(udma_ctrl.periph_reset.uart1, 1)
      end
   endtask

   /**
    * TODO Describe uvme_cvmcu_chip_reset_seq_c::in_reset()
    */
   virtual task in_reset();
      `uvmx_update_reg(udma_ctrl.periph_reset)
   endtask

   /**
    * TODO Describe uvme_cvmcu_chip_reset_seq_c::post_reset()
    */
   virtual task post_reset();
      if (cfg.uart0_agent_cfg.enabled) begin
         `uvmx_set_field(udma_ctrl.periph_reset.uart0, 0)
      end
      if (cfg.uart1_agent_cfg.enabled) begin
         `uvmx_set_field(udma_ctrl.periph_reset.uart1, 0)
      end
      `uvmx_update_reg(udma_ctrl.periph_reset)
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_RESET_SEQ_SV__
