// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_CFG_SEQ_SV__
`define __UVME_CVMCU_CHIP_CFG_SEQ_SV__


/**
 * Sets register values to reflect environment configuration.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_cfg_seq_c extends uvme_cvmcu_chip_base_seq_c;

   /// @name Knobs
   /// @{
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_cfg_seq_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_cfg_seq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvme_cvmcu_chip_cfg_seq_c::body()
    */
   virtual task body();
      uvm_status_e    status;
      uvm_reg_data_t  value ;
      // TODO Implement uvme_cvmcu_chip_cfg_seq_c::body()
      //      Ex: cntxt.reg_model.abc.xyz.write(status, cfg.xyz);
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_CFG_SEQ_SV__