// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_SEQ_ITEM_SV__
`define __UVMA_CVMCU_IO_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU IO Sequences.
 * Analog of uvma_cvmcu_io_mon_trn_c
 * @ingroup uvma_cvmcu_io_seq_item
 */
class uvma_cvmcu_io_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}

   /// @name Metadata
   /// @{
   uvma_cvmcu_io_direction_enum  direction; ///< Directionality of this transaction
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_seq_item_c)
      `uvm_field_enum(uvma_cvmcu_io_direction_enum, direction, UVM_DEFAULT + UVM_NOCOMPARE + UVM_NOPACK)
   `uvm_object_utils_end


   /**
    * Describes data space.
    */
   constraint data_cons {
   }

   /**
    * Describes metadata space.
    */
   constraint metadata_cons {
   }

   /**
    * TODO Implement or remove uvma_cvmcu_io_seq_item_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_seq_item");
      super.new(name);
   endfunction


   /**
    * Performs randomization steps not possible or practical with constraints.
    */
   virtual function void post_randomize_work();
      if (cfg.drv_mode == UVMA_CVMCU_IO_DRV_MODE_BOARD) begin
         direction = UVMA_CVMCU_IO_DIRECTION_IG;
      end
      else begin
         direction = UVMA_CVMCU_IO_DIRECTION_EG;
      end
   endfunction

   /**
    * Copies data from a monitor transaction instance.
    */
   virtual function void do_copy(uvm_object rhs);
      uvma_cvmcu_io_mon_trn_c  trn;
      super.do_copy(rhs);
      if ($cast(trn, rhs)) begin
         direction = trn.direction;
      end
   endfunction

   /**
    * TODO Implement or remove uvma_cvmcu_io_seq_item_c::do_print()
    */
   virtual function void do_print(uvm_printer printer);
      super.do_print(printer);
      // Print dependent on configuration and/or fields
      // Ex: if (cfg.enable_abc) begin
      //        printer.print_field("abc", abc, 8);
      //     end
   endfunction

   /**
    * Describes sequence item for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string  val_str;
   endfunction

endclass


`endif // __UVMA_CVMCU_IO_SEQ_ITEM_SV__