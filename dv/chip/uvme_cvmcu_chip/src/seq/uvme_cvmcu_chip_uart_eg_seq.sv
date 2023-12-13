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
      cntxt.probe_vif.assign_uarts();
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
      uvma_uart_mon_trn_c  trn;
      bit  data[$];
      for (int unsigned ii=0; ii<num_items; ii++) begin
         item = uvma_uart_seq_item_c::type_id::create("item");
         item.cfg = cfg.uart0_agent_cfg;
         item.cntxt = cntxt.uart0_agent_cntxt;
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
         p_sequencer.udma_uart0_egress_exp_ap.write(trn);
         `uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Finished item #%0d of %0d", (ii+1), num_items), UVM_HIGH)
      end
      // TODO Drive the register model to output data[$]
   endtask

   /**
    * Generates transactions for UART1.
    */
   task uart1();
      uvma_uart_seq_item_c  item;
      uvma_uart_mon_trn_c  trn;
      bit  data[$];
      for (int unsigned ii=0; ii<num_items; ii++) begin
         item = uvma_uart_seq_item_c::type_id::create("item");
         item.cfg = cfg.uart1_agent_cfg;
         item.cntxt = cntxt.uart1_agent_cntxt;
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
         p_sequencer.udma_uart1_egress_exp_ap.write(trn);
         `uvm_info("CVMCU_CHIP_UART_EG_SEQ", $sformatf("Finished item #%0d of %0d", (ii+1), num_items), UVM_HIGH)
      end
      // TODO Drive the register model to output data[$]
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_UART_EG_SEQ_SV__
