// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_IDLE_SEQ_SV__
`define __UVMA_CVMCU_IO_IDLE_SEQ_SV__


/**
 * Sequence generating 'idle' Sequence Items at all times.
 * @ingroup uvma_cvmcu_io_seq
 */
class uvma_cvmcu_io_idle_seq_c extends uvma_cvmcu_io_base_seq_c;

   `uvm_object_utils(uvma_cvmcu_io_idle_seq_c)
   `uvmx_idle_seq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_idle_seq");
      super.new(name);
   endfunction

   /**
    * Calls proper `x_idle()` task.
    */
   virtual task idle();
      case (cfg.drv_mode)
         UVMA_CVMCU_IO_DRV_MODE_BOARD: board_idle();
         UVMA_CVMCU_IO_DRV_MODE_CHIP: chip_idle();
      endcase
   endtask

   /**
    * Infinite loop generating idle BOARD Sequence Items.
    */
   task board_idle();
      uvma_cvmcu_io_board_padi_seq_item_c  board_padi_seq_item;
      uvma_cvmcu_io_board_pado_seq_item_c  board_pado_seq_item;
      if (cfg.drv_idle_random) begin
         fork
            forever begin
               `uvmx_create_on(board_padi_seq_item, board_padi_sequencer)
               `uvmx_rand_send_idle_with(board_padi_seq_item, {
                  // TODO Implement random idles for BOARD PADI
                  //      Ex: req == 0;
               })
            end
            forever begin
               `uvmx_create_on(board_pado_seq_item, board_pado_sequencer)
               `uvmx_rand_send_idle_with(board_pado_seq_item, {
                  // TODO Implement random idles for BOARD PADO
                  //      Ex: req == 0;
               })
            end
         join
      end
      else begin
         fork
            forever begin
               `uvmx_create_on(board_padi_seq_item, board_padi_sequencer)
               // TODO Implement zero'd idles for BOARD PADI
               //      Ex: board_padi_seq_item.reqpar = 0;
               `uvmx_send_idle(board_padi_seq_item)
            end
            forever begin
               `uvmx_create_on(board_pado_seq_item, board_pado_sequencer)
               // TODO Implement zero'd idles for BOARD PADO
               //      Ex: board_pado_seq_item.reqpar = 0;
               `uvmx_send_idle(board_pado_seq_item)
            end
         join
      end
   endtask

   /**
    * Infinite loop generating idle CHIP Sequence Items.
    */
   task chip_idle();
      uvma_cvmcu_io_chip_padi_seq_item_c  chip_padi_seq_item;
      uvma_cvmcu_io_chip_pado_seq_item_c  chip_pado_seq_item;
      if (cfg.drv_idle_random) begin
         fork
            forever begin
               `uvmx_create_on(chip_padi_seq_item, chip_padi_sequencer)
               `uvmx_rand_send_idle_with(chip_padi_seq_item, {
                  // TODO Implement random idles for CHIP PADI
                  //      Ex: req == 0;
               })
            end
            forever begin
               `uvmx_create_on(chip_pado_seq_item, chip_pado_sequencer)
               `uvmx_rand_send_idle_with(chip_pado_seq_item, {
                  // TODO Implement random idles for CHIP PADO
                  //      Ex: req == 0;
               })
            end
         join
      end
      else begin
         fork
            forever begin
               `uvmx_create_on(chip_padi_seq_item, chip_padi_sequencer)
               // TODO Implement zero'd idles for CHIP PADI
               //      Ex: chip_padi_seq_item.reqpar = 0;
               `uvmx_send_idle(chip_padi_seq_item)
            end
            forever begin
               `uvmx_create_on(chip_pado_seq_item, chip_pado_sequencer)
               // TODO Implement zero'd idles for CHIP PADO
               //      Ex: chip_pado_seq_item.reqpar = 0;
               `uvmx_send_idle(chip_pado_seq_item)
            end
         join
      end
   endtask

endclass


`endif // __UVMA_CVMCU_IO_IDLE_SEQ_SV__