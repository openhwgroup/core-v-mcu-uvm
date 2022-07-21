// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_REG_BLOCK_SV__
`define __UVME_APB_TIMER_REG_BLOCK_SV__


/**
 * Top-level object encapsulating APB Timer Register Block.
 */
class uvme_apb_timer_reg_block_c extends uvml_ral_reg_block_c;

   /// @defgroup Objects
   /// @{
   uvme_apb_timer_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_apb_timer_cntxt_c  cntxt; ///< Environment context handle
   /// @}

   /// @defgroup Sub-Blocks
   /// @{
   // TODO Add sub-block(s)
   //      Ex: rand uvme_apb_timer_abc_reg_block_c  abc; ///< Describe me!
   /// @}

   /// @defgroup Registers
   /// @{
   // TODO Add register(s)
   //      Ex: rand uvme_apb_timer_xyz_reg_c  xyz; ///< Describe me!
   /// @}


   `uvm_object_utils_begin(uvme_apb_timer_reg_block_c)
      // TODO Add field macros for sub-block(s) and register(s)
      //      Ex: `uvm_field_object(abc, UVM_DEFAULT)
      //          `uvm_field_object(xyz, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_reg_block", int has_coverage=UVM_NO_COVERAGE);

   /**
    * Creates register and register block instances and associates them with this register block.
    */
   extern virtual function void build();

   /**
    * Associates sub-register blocks and registers with this register block.
    */
   extern virtual function void connect();

   /**
    * Creates sub-block(s).
    */
   extern function void create_blocks();

   /**
    * Creates register(s).
    */
   extern function void create_regs();

   /**
    * Creates register map.
    */
   extern function void create_reg_map();

   /**
    * Adds register(s) to register map.
    */
   extern function void add_regs_to_map();

endclass : uvme_apb_timer_reg_block_c


function uvme_apb_timer_reg_block_c::new(string name="uvme_apb_timer_reg_block", int has_coverage=UVM_NO_COVERAGE);

   super.new(name, has_coverage);

endfunction : new


function void uvme_apb_timer_reg_block_c::build();

   create_blocks  ();
   create_regs    ();
   create_reg_map ();

endfunction: build


function void uvme_apb_timer_reg_block_c::connect();

   add_regs_to_map();
   lock_model     ();

endfunction: connect


function void uvme_apb_timer_reg_block_c::create_blocks();

   // TODO Implement uvme_apb_timer_reg_block_c::create_blocks()
   //      Ex: abc = uvme_apb_timer_abc_reg_block_c::type_id::create("abc");
   //          abc.configure(this);
   //          abc.build();

endfunction : create_blocks


function void uvme_apb_timer_reg_block_c::create_regs();

   // TODO Implement uvme_apb_timer_reg_block_c::create_regs()
   //      Ex:  xyz = uvme_apb_timer_xyz_reg_c::type_id::create("xyz");
   //           xyz.configure(this);
   //           xyz.build();

endfunction : create_regs


function void uvme_apb_timer_reg_block_c::create_reg_map();

   default_map = create_map(
      .name     ("default_map"),
      .base_addr(cfg.reg_block_base_address),
      .n_bytes  (uvme_apb_timer_reg_block_reg_n_bytes),
      .endian   (UVM_LITTLE_ENDIAN)
   );

endfunction : create_reg_map


function void uvme_apb_timer_reg_block_c::add_regs_to_map();

   // TODO Implement uvme_apb_timer_reg_block_c::add_regs_to_map()
   //      Ex: default_map.add_reg(
   //             .rg    (xyz),
   //             .offset(32'h00_00_00_00),
   //             .rights("RW")
   //          );

endfunction : add_regs_to_map


`endif // _UVME_APB_TIMER_REG_BLOCK_SV__
