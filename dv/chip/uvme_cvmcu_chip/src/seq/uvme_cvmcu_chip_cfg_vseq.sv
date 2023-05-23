// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_CFG_VSEQ_SV__
`define __UVME_CVMCU_CHIP_CFG_VSEQ_SV__


/**
 * Sequence configuring registers of the CORE-V-MCU Chip DUT.
 */
class uvme_cvmcu_chip_cfg_vseq_c extends uvme_cvmcu_chip_base_vseq_c;

   /// @name Knobs
   /// @{
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_cfg_vseq_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_cfg_vseq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvme_cvmcu_chip_cfg_vseq_c::body()
    */
   virtual task body();
      uvm_status_e    status;
      uvm_reg_data_t  value ;
      // TODO Implement uvme_cvmcu_chip_cfg_vseq_c::body()
      //      Ex: cntxt.reg_model.abc.xyz.write(status, cfg.xyz);
   endtask

endclass : uvme_cvmcu_chip_cfg_vseq_c


`endif // __UVME_CVMCU_CHIP_CFG_VSEQ_SV__