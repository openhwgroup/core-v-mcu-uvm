// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_REG_BASE_VSEQ_SV__
`define __UVME_APB_ADV_TIMER_REG_BASE_VSEQ_SV__


/**
 * Abstract virtual sequence from which all other APB Advanced Timer Sub-System register virtual sequences must extend.
 * @ingroup uvme_apb_adv_timer_seq
 */
class uvme_apb_adv_timer_reg_base_vseq_c extends uvmx_reg_seq_c #(
   .T_SEQ(uvme_apb_adv_timer_base_vseq_c)
);

   /// @name Fields
   /// @{
   /// @}


   `uvm_object_utils_begin(uvme_apb_adv_timer_reg_base_vseq_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_reg_base_vseq");
      super.new(name);
   endfunction

endclass : uvme_apb_adv_timer_reg_base_vseq_c


`endif // __UVME_APB_ADV_TIMER_REG_BASE_VSEQ_SV__