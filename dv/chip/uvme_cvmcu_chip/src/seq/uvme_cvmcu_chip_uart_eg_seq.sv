// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_UART_EG_SEQ_SV__
`define __UVME_CVMCU_CHIP_UART_EG_SEQ_SV__


/**
 * Sequence for test 'uart_eg'.
 * @ingroup uvme_cvmcu_chip_seq_functional
 */
class uvme_cvmcu_chip_uart_eg_seq_c extends uvme_cvmcu_chip_base_seq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of transactions generated.
   rand int unsigned  min_gap; ///< Minimum cycles between transactions.
   rand int unsigned  max_gap; ///< Maximum cycles between transactions.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_uart_eg_seq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Describes randomization space for knobs.
    */
   constraint space_cons {
      num_items inside {[1:'d1000]};
      min_gap inside {[0:'d100]};
      max_gap inside {[0:'d100]};
   }

   /**
    * TODO Implement or remove uvme_cvmcu_chip_uart_eg_seq_c::rules_cons
    */
   constraint rules_cons {
      min_gap <= max_gap;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_uart_eg_seq");
      super.new(name);
   endfunction

   /**
    * TODO Implement or remove uvme_cvmcu_chip_uart_eg_seq_c::post_randomize_work()
    */
   virtual function void post_randomize_work();
   endfunction

   /**
    * TODO Describe uvme_cvmcu_chip_uart_eg_seq_c::body()
    */
   virtual task body();
      setup_dut();
      fork
         uart0();
         uart1();
      join
   endtask

   /**
    * Drive registers to setup UART0 and UART1
    */
   task setup_dut();
      // Configuration fields for the UART agents
      // rand int unsigned  baud_rate; ///< BAUD rate
      // rand int unsigned  frame_size; ///< Number of data bits in a frame
      // rand int unsigned  num_stop_bits; ///< Number of STOP bits in a frame
      // rand bit  enable_parity_bit; ///< Enables adding a parity bit at the end of frame.
      // rand uvma_uart_parity_enum  parity_type; ///< When parity is enabled, specifies ODD/EVEN parity.
      // reg_model.ABC.DEF.write();
   endtask

   /**
    * Generates transactions for UART0.
    */
   task uart0();
      uvma_uart_seq_item_c  item;
      uvma_uart_mon_trn_c  trn;
      int unsigned  gap_size;
      bit  data[$];
      for (int unsigned ii=0; ii<num_items; ii++) begin
         gap_size = $urandom_range(min_gap, max_gap);
         //`uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Waiting %0d gap cycle(s) before item %0d/%0d", gap_size, (ii+1), num_items), UVM_HIGH)
         //clk(gap_size);
         //`uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Starting item #%0d of %0d with gap size %0d", (ii+1), num_items, gap_size), UVM_MEDIUM)
         item = uvma_uart_seq_item_c::type_id::create("item");
         item.cfg = cfg.uart0_agent_cfg;
         item.cntxt = cfg.uart0_agent_cntxt;
         if (!item.randomize()) begin
            `uvm_fatal("CVMCU_CHIP_UART_EG_SEQ", "Failed to randomize UART item")
         end
         foreach (item.data[ii]) begin
            data.push_back(item.data[ii]);
         end
         if (cfg.uart0_agent_cfg.enable_parity_bit) begin
            data.push_back(item.parity);
         end
         trn = uvma_uart_mon_trn_c::type_id::create("trn");
         trn.copy(item);
         udma_uart0_egress_exp_ap.write(trn);
         `uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Finished item #%0d of %0d with gap size %0d", (ii+1), num_items, gap_size), UVM_HIGH)
      end
      // TODO Drive the register model to output data[$]
   endtask

   /**
    * Generates transactions for UART1.
    */
   task uart1();
      uvma_uart_seq_item_c  item;
      uvma_uart_mon_trn_c  trn;
      int unsigned  gap_size;
      bit  data[$];
      for (int unsigned ii=0; ii<num_items; ii++) begin
         gap_size = $urandom_range(min_gap, max_gap);
         //`uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Waiting %0d gap cycle(s) before item %0d/%0d", gap_size, (ii+1), num_items), UVM_HIGH)
         //clk(gap_size);
         //`uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Starting item #%0d of %0d with gap size %0d", (ii+1), num_items, gap_size), UVM_MEDIUM)
         item = uvma_uart_seq_item_c::type_id::create("item");
         item.cfg = cfg.uart1_agent_cfg;
         item.cntxt = cfg.uart1_agent_cntxt;
         if (!item.randomize()) begin
            `uvm_fatal("CVMCU_CHIP_UART_EG_SEQ", "Failed to randomize UART item")
         end
         foreach (item.data[ii]) begin
            data.push_back(item.data[ii]);
         end
         if (cfg.uart1_agent_cfg.enable_parity_bit) begin
            data.push_back(item.parity);
         end
         trn = uvma_uart_mon_trn_c::type_id::create("trn");
         trn.copy(item);
         udma_uart1_egress_exp_ap.write(trn);
         `uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Finished item #%0d of %0d with gap size %0d", (ii+1), num_items, gap_size), UVM_HIGH)
      end
      // TODO Drive the register model to output data[$]
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_UART_EG_SEQ_SV__
