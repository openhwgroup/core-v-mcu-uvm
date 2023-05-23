// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_CTRL_REG_BLOCK_SV__
`define __UVME_CVMCU_CHIP_UDMA_CTRL_REG_BLOCK_SV__




/**
 * Top-Level Register Block for uvme_cvmcu_chip_udma_ctrl.
 * @ingroup uvme_cvmcu_chip_udma_ctrl_reg
 */
class uvme_cvmcu_chip_udma_ctrl_reg_block_c extends uvmx_reg_block_c;


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_ctrl_reg_block_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_ctrl_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates address maps.
    */
   virtual function void create_maps();
      // Create default register map (default_map)
      default_map = create_map(
         .name     ("default_map"),
         .base_addr(`UVM_REG_ADDR_WIDTH'h0),
         .n_bytes  (4),
         .endian   (UVM_LITTLE_ENDIAN)
      );
   endfunction

endclass : uvme_cvmcu_chip_udma_ctrl_reg_block_c


`endif // __UVME_CVMCU_CHIP_UDMA_CTRL_REG_BLOCK_SV__
