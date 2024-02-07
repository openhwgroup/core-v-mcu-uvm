// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_UDMA_UART_SEQ_SV__
`define __UVME_CVMCU_CHIP_UDMA_UART_SEQ_SV__


/**
 * Gathers UART transactions received by uDMA and sends them to the predictor.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_udma_uart_seq_c extends uvme_cvmcu_chip_base_seq_c;

   `uvm_object_utils(uvme_cvmcu_chip_udma_uart_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_uart_seq");
      super.new(name);
   endfunction

   /**
    * Forks off UART0 and UART1 processing.
    */
   virtual task body();
      wait (cntxt.reset_state == UVMX_POST_RESET);
      fork
         uart0_rx();
         uart1_rx();
      join
   endtask

   /**
    * Re-constitutes UART0 transactions from memory.
    */
   task uart0_rx();
      uvma_uart_mon_trn_c  trn;
      uvm_reg_data_t       data_valid;
      uvm_reg_addr_t       address;
      uvm_reg_data_t       num_bytes;
      uvm_reg_data_t       r_data;
      bit                  data[];
      bit                  data_q[$];
      if (cfg.uart0_agent_cfg.enabled) begin
         forever begin
            trn = uvma_uart_mon_trn_c::type_id::create("trn");
            trn.cfg   = cfg  .uart0_agent_cfg  ;
            trn.cntxt = cntxt.uart0_agent_cntxt;
            // 1. Enable UART0 Rx
            `uvmx_set_field(uart0.rx_cfg.en, 1)
            `uvmx_update_reg_obj(uart0.rx_cfg, trn)
            // 2. Wait for UART0 Rx Interrupt
            cntxt.irq_l2_agent_cntxt.wait_for_assert("UART0_0");
            trn.from(cntxt.irq_l2_agent_cntxt.new_irq);
            // 3. Get number of bytes to read
            `uvmx_mirror_reg_obj(uart0.rx_size, trn)
            `uvmx_get_field(num_bytes, uart0.rx_size.size)
            // 4. Get address to read from
            `uvmx_mirror_reg_obj(uart0.rx_saddr, trn)
            `uvmx_get_field(address, uart0.rx_saddr)
            // 5. Read all the bytes from RAM and store the bits into a queue
            data_q.delete();
            for (int unsigned ii=0; ii<num_bytes; ii++) begin
               `uvmx_read_mem_obj(r_data, ram_b0, address+ii, trn)
               for (int unsigned jj=0; jj<8; jj++) begin
                  if (data_q.size() < cfg.uart0_agent_cfg.frame_size) begin
                     data_q.push_back(r_data[jj]);
                  end
               end
            end
            // 6. Convert from a queue to an array
            data = new[cfg.uart0_agent_cfg.frame_size];
            foreach (data_q[ii]) begin
               data[ii] = data_q[ii];
            end
            // 7. Unpack UART transaction from bit array
            void'(trn.unpack(data));
            // 8. Send transaction to predictor
            p_sequencer.udma_uart0_ingress_act_ap.write(trn);
         end
      end
   endtask

   /**
    * Re-constitutes UART1 transactions from memory.
    */
   task uart1_rx();
      uvma_uart_mon_trn_c  trn;
      uvm_reg_data_t       data_valid;
      uvm_reg_addr_t       address;
      uvm_reg_data_t       num_bytes;
      uvm_reg_data_t       r_data;
      bit                  data[];
      bit                  data_q[$];
      if (cfg.uart1_agent_cfg.enabled) begin
         forever begin
            trn = uvma_uart_mon_trn_c::type_id::create("trn");
            trn.cfg   = cfg  .uart1_agent_cfg  ;
            trn.cntxt = cntxt.uart1_agent_cntxt;
            // 1. Enable UART1 Rx
            `uvmx_set_field(uart1.rx_cfg.en, 1)
            `uvmx_update_reg_obj(uart1.rx_cfg, trn)
            // 2. Wait for UART1 Rx Interrupt
            cntxt.irq_l2_agent_cntxt.wait_for_assert("UART1_0");
            trn.from(cntxt.irq_l2_agent_cntxt.new_irq);
            // 3. Get number of bytes to read
            `uvmx_mirror_reg_obj(uart1.rx_size, trn)
            `uvmx_get_field(num_bytes, uart1.rx_size.size)
            // 4. Get address to read from
            `uvmx_mirror_reg_obj(uart1.rx_saddr, trn)
            `uvmx_get_field(address, uart1.rx_saddr)
            // 5. Read all the bytes from RAM and store the bits into a queue
            data_q.delete();
            for (int unsigned ii=0; ii<num_bytes; ii++) begin
               `uvmx_read_mem_obj(r_data, ram_b0, address+ii, trn)
               for (int unsigned jj=0; jj<8; jj++) begin
                  if (data_q.size() < cfg.uart1_agent_cfg.frame_size) begin
                     data_q.push_back(r_data[jj]);
                  end
               end
            end
            // 6. Convert from a queue to an array
            data = new[cfg.uart1_agent_cfg.frame_size];
            foreach (data_q[ii]) begin
               data[ii] = data_q[ii];
            end
            // 7. Unpack UART transaction from bit array
            void'(trn.unpack(data));
            // 8. Send transaction to predictor
            p_sequencer.udma_uart1_ingress_act_ap.write(trn);
         end
      end
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_UDMA_UART_SEQ_SV__
