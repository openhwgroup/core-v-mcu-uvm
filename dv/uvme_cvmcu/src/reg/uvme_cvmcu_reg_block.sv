// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_REG_BLOCK_SV__
`define __UVME_CVMCU_REG_BLOCK_SV__


/**
 * Top-level object encapsulating CORE-V MCU Register Block.
 * @ingroup uvme_cvmcu_reg
 */
class uvme_cvmcu_reg_block_c extends uvmx_reg_block_c;

   /// @name Sub-Blocks
   /// @{
   // TODO Add sub-block(s)
   //      Ex: rand uvme_cvmcu_abc_reg_block_c  abc; ///< Describe me!
   /// @}

   /// @name Registers
   /// @{
   // TODO Add register(s)
   //      Ex: rand uvme_cvmcu_xyz_reg_c  xyz; ///< Describe me!
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_reg_block_c)
      // TODO Add field macros for sub-block(s) and register(s)
      //      Ex: `uvm_field_object(abc, UVM_DEFAULT)
      //          `uvm_field_object(xyz, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates sub-block(s).
    */
   virtual function void create_blocks();
      // TODO Implement uvme_cvmcu_reg_block_c::create_blocks()
      //      Ex: abc = uvme_cvmcu_abc_reg_block_c::type_id::create("abc");
      //          abc.configure(this);
      //          abc.build();
   endfunction

   /**
    * Creates register(s).
    */
   virtual function void create_regs();
      // TODO Implement uvme_cvmcu_reg_block_c::create_regs()
      //      Ex:  xyz = uvme_cvmcu_xyz_reg_c::type_id::create("xyz");
      //           xyz.configure(this);
      //           xyz.build();
   endfunction

   /**
    * Creates register map.
    */
   virtual function void create_reg_map();
      default_map = create_map(
         .name     ("default_map"),
         .base_addr(0),
         .n_bytes  (uvme_cvmcu_reg_block_reg_n_bytes),
         .endian   (UVM_LITTLE_ENDIAN)
      );
   endfunction

   /**
    * Adds register(s) to register map.
    */
   virtual function void add_regs_to_map();
      // TODO Implement uvme_cvmcu_reg_block_c::add_regs_to_map()
      //      Ex: default_map.add_reg(
      //             .rg    (xyz),
      //             .offset(32'h00_00_00_00),
      //             .rights("RW")
      //          );
   endfunction

endclass : uvme_cvmcu_reg_block_c


`endif // _UVME_CVMCU_REG_BLOCK_SV__