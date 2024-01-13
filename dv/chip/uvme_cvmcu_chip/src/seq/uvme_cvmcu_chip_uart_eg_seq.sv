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
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_uart_eg_seq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Describes randomization space for knobs.
    */
   constraint space_cons {
      num_items inside {[1:'d1000]};
   }

   /**
    * TODO Implement or remove uvme_cvmcu_chip_uart_eg_seq_c::rules_cons
    */
   constraint rules_cons {
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
      fork
         uart0();
         uart1();
      join
   endtask

   /**
    * Generates transactions for UART0.
    */
   task uart0();
      uvma_uart_seq_item_c  item;
      uvma_uart_mon_trn_c   trn;
      byte unsigned  data[];
      int unsigned   num_bits, bit_count;
      if (cfg.uart0_agent_cfg.enabled) begin
         for (int unsigned ii=0; ii<num_items; ii++) begin
            `uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Starting UART0 item #%0d of %0d", (ii+1), num_items), UVM_MEDIUM)
            // 1. Create random UART item
            item = uvma_uart_seq_item_c::type_id::create("item");
            trn = uvma_uart_mon_trn_c::type_id::create("trn");
            item.cfg = cfg.uart0_agent_cfg;
            item.cntxt = cntxt.uart0_agent_cntxt;
            if (!item.randomize()) begin
               `uvm_fatal("CVMCU_CHIP_UART_EG_SEQ", "Failed to randomize UART0 item")
            end
            // 2. Serialize item into bytes
            num_bits = item.pack_bytes(data);
            // 3. Write transaction to memory
            `uvmx_set_field(uart0.tx_size.size , data.size())
            `uvmx_update_reg_obj(uart0.tx_size, trn)
            for (int unsigned ii=0; ii<data.size(); ii++) begin
               `uvmx_write_mem_obj(ram, cntxt.uart0_tx_buffer_addr+ii, data[ii], trn)
            end
            // 4. Enable UART0
            `uvmx_set_field(uart0.tx_cfg.en, 1)
            `uvmx_update_reg_obj(uart0.tx_cfg, trn)
            // 5. Wait for UART0 Tx interrupt
            cntxt.irq_l2_agent_cntxt.wait_for_assert("UART0_1");
            // 6. Send transaction to predictor
            trn.copy(item);
            p_sequencer.udma_uart0_egress_exp_ap.write(trn);
            `uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Finished UART0 item #%0d of %0d", (ii+1), num_items), UVM_HIGH)
         end
      end
   endtask

   /**
    * Generates transactions for UART1.
    */
   task uart1();
      uvma_uart_seq_item_c  item;
      uvma_uart_mon_trn_c   trn;
      byte unsigned  data[];
      int unsigned   num_bits, bit_count;
      if (cfg.uart1_agent_cfg.enabled) begin
         for (int unsigned ii=0; ii<num_items; ii++) begin
            `uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Starting UART1 item #%0d of %0d", (ii+1), num_items), UVM_MEDIUM)
            // 1. Create random UART item
            item = uvma_uart_seq_item_c::type_id::create("item");
            trn = uvma_uart_mon_trn_c::type_id::create("trn");
            item.cfg = cfg.uart1_agent_cfg;
            item.cntxt = cntxt.uart1_agent_cntxt;
            if (!item.randomize()) begin
               `uvm_fatal("CVMCU_CHIP_UART_EG_SEQ", "Failed to randomize UART1 item")
            end
            // 2. Serialize item into bytes
            num_bits = item.pack_bytes(data);
            // 3. Write transaction to memory
            `uvmx_set_field(uart1.tx_size.size , data.size())
            `uvmx_update_reg_obj(uart1.tx_size, trn)
            for (int unsigned ii=0; ii<data.size(); ii++) begin
               `uvmx_write_mem_obj(ram, cntxt.uart1_tx_buffer_addr+ii, data[ii], trn)
            end
            // 4. Enable UART1
            `uvmx_set_field(uart1.tx_cfg.en, 1)
            `uvmx_update_reg_obj(uart1.tx_cfg, trn)
            // 5. Wait for UART1 Tx interrupt
            cntxt.irq_l2_agent_cntxt.wait_for_assert("UART1_1");
            // 6. Send transaction to predictor
            trn.copy(item);
            p_sequencer.udma_uart1_egress_exp_ap.write(trn);
            `uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Finished UART1 item #%0d of %0d", (ii+1), num_items), UVM_HIGH)
         end
      end
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_UART_EG_SEQ_SV__
