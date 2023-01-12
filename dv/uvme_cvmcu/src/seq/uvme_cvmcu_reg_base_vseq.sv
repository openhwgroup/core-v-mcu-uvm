// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_REG_BASE_VSEQ_SV__
`define __UVME_CVMCU_REG_BASE_VSEQ_SV__


/**
 * Abstract virtual sequence from which all other CORE-V MCU Sub-System register virtual sequences must extend.
 * @ingroup uvme_cvmcu_seq
 */
class uvme_cvmcu_reg_base_vseq_c extends uvmx_reg_seq_c #(
   .T_SEQ(uvme_cvmcu_base_vseq_c)
);

   /// @name Fields
   /// @{
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_reg_base_vseq_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_reg_base_vseq");
      super.new(name);
   endfunction

endclass : uvme_cvmcu_reg_base_vseq_c


`endif // __UVME_CVMCU_REG_BASE_VSEQ_SV__