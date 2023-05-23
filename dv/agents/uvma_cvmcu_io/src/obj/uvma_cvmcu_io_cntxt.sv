// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_CNTXT_SV__
`define __UVMA_CVMCU_IO_CNTXT_SV__


/**
 * Object encapsulating all state variables for all CORE-V-MCU IO agent (uvma_cvmcu_io_agent_c) components.
 * @ingroup uvma_cvmcu_io_obj
 */
class uvma_cvmcu_io_cntxt_c extends uvmx_agent_cntxt_c #(
   .T_VIF(virtual uvma_cvmcu_io_if)
);

   /// @name Integrals
   /// @{
   /// @}

   /// @name Objects
   /// @{
   // TODO Add state variables
   //      Ex: uvma_cvmcu_io_word_b_t  drv_data_q[$]; ///< TODO Describe uvma_cvmcu_io_cntxt_c::drv_data_q
   //          uvma_cvmcu_io_board_padi_mon_trn_c  mon_board_padi_q[$]; ///< TODO Describe uvma_cvmcu_io_cntxt_c::mon_board_padi_q
   //          uvma_cvmcu_io_chip_pado_mon_trn_c  mon_chip_pado_q[$]; ///< TODO Describe uvma_cvmcu_io_cntxt_c::mon_chip_pado_q
      /// @}

   /// @name Virtual Sequences
   /// @{
   uvm_sequence_base  board_drv_vseq; ///< BOARD Driver Virtual Sequence instance.
   uvm_sequence_base  chip_drv_vseq; ///< CHIP Driver Virtual Sequence instance.
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
         `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_cntxt");
      super.new(name);
   endfunction

   /**
    * Builds objects.
    */
   virtual function void create_objects();
         endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void reset();
      // TODO Reset state variables
      //       Ex: drv_data_q.delete();
      //          mon_board_padi_q.delete();
      //          mon_board_pado_q.delete();
      //          mon_chip_padi_q.delete();
      //          mon_chip_pado_q.delete();
      
   endfunction

endclass : uvma_cvmcu_io_cntxt_c


`endif // __UVMA_CVMCU_IO_CNTXT_SV__