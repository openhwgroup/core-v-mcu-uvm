// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_PRD_SV__
`define __UVME_CVMCU_CHIP_PRD_SV__


/**
 * Component implementing transaction-based model of CORE-V-MCU Chip.
 * @ingroup uvme_cvmcu_chip_comps
 */
class uvme_cvmcu_chip_prd_c extends uvmx_chip_prd_c #(
   .T_CFG  (uvme_cvmcu_chip_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_chip_cntxt_c)
);

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_obi_mon_trn_c)  data_obi_reg_fifo; ///< Queue of input obi transactions from Data memory OBI agent
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi0_ingress_fifo; ///< Queue of input spi transactions from QSPI slave 0 agent
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi1_ingress_fifo; ///< Queue of input spi transactions from QSPI slave 1 agent
   uvm_tlm_analysis_fifo #(uvma_cvmcu_cpi_mon_trn_c)  udma_camera_fifo; ///< Queue of input cvmcu_cpi transactions from Camera Parallel Interface transmitter agent
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c0_ingress_fifo; ///< Queue of input i2c transactions from I2C slave 0 agent
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c1_ingress_fifo; ///< Queue of input i2c transactions from I2C slave 1 agent
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart0_ingress_fifo; ///< Queue of input uart transactions from UART 0 agent
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart1_ingress_fifo; ///< Queue of input uart transactions from UART 1 agent
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  apb_i2c_ingress_fifo; ///< Queue of input i2c transactions from I2C master agent
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c)  core_event_fifo; ///< Queue of input cvmcu_event transactions from Event agent
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c)  sys_event_fifo; ///< Queue of input cvmcu_event transactions from Event agent
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_mon_trn_c)  mon_dbg_fifo; ///< Queue of input cvmcu_dbg transactions from Debug agent
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi0_egress_fifo; ///< Queue of input spi transactions from udma_qspi0_egress (uvme_cvmcu_chip_vsqr_c)
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi1_egress_fifo; ///< Queue of input spi transactions from udma_qspi1_egress (uvme_cvmcu_chip_vsqr_c)
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c0_egress_fifo; ///< Queue of input i2c transactions from udma_i2c0_egress (uvme_cvmcu_chip_vsqr_c)
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c1_egress_fifo; ///< Queue of input i2c transactions from udma_i2c1_egress (uvme_cvmcu_chip_vsqr_c)
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart0_egress_fifo; ///< Queue of input uart transactions from udma_uart0_egress (uvme_cvmcu_chip_vsqr_c)
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart1_egress_fifo; ///< Queue of input uart transactions from udma_uart1_egress (uvme_cvmcu_chip_vsqr_c)
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  apb_i2c_egress_fifo; ///< Queue of input i2c transactions from apb_i2c_egress (uvme_cvmcu_chip_vsqr_c)
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_mon_trn_c)  dbg_fifo; ///< Queue of input cvmcu_dbg transactions from dbg (uvme_cvmcu_chip_vsqr_c)
   /// @}

   /// @name Analysis ports
   /// @{
   uvm_analysis_port #(uvma_spi_mon_trn_c)  udma_qspi0_egress_ap; ///< Output for udma_qspi0_egress transactions to the scoreboard
   uvm_analysis_port #(uvma_spi_mon_trn_c)  udma_qspi1_egress_ap; ///< Output for udma_qspi1_egress transactions to the scoreboard
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  udma_i2c0_egress_ap; ///< Output for udma_i2c0_egress transactions to the scoreboard
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  udma_i2c1_egress_ap; ///< Output for udma_i2c1_egress transactions to the scoreboard
   uvm_analysis_port #(uvma_uart_mon_trn_c)  udma_uart0_egress_ap; ///< Output for udma_uart0_egress transactions to the scoreboard
   uvm_analysis_port #(uvma_uart_mon_trn_c)  udma_uart1_egress_ap; ///< Output for udma_uart1_egress transactions to the scoreboard
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  apb_i2c_egress_ap; ///< Output for apb_i2c_egress transactions to the scoreboard
   uvm_analysis_port #(uvma_cvmcu_dbg_mon_trn_c)  dbg_ap; ///< Output for dbg transactions to the scoreboard
   uvm_analysis_port #(uvma_spi_mon_trn_c)  udma_qspi0_ingress_ap; ///< Output for udma_qspi0_ingress transactions to the scoreboard
   uvm_analysis_port #(uvma_spi_mon_trn_c)  udma_qspi1_ingress_ap; ///< Output for udma_qspi1_ingress transactions to the scoreboard
   uvm_analysis_port #(uvma_cvmcu_cpi_mon_trn_c)  udma_camera_ap; ///< Output for udma_camera transactions to the scoreboard
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  udma_i2c0_ingress_ap; ///< Output for udma_i2c0_ingress transactions to the scoreboard
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  udma_i2c1_ingress_ap; ///< Output for udma_i2c1_ingress transactions to the scoreboard
   uvm_analysis_port #(uvma_uart_mon_trn_c)  udma_uart0_ingress_ap; ///< Output for udma_uart0_ingress transactions to the scoreboard
   uvm_analysis_port #(uvma_uart_mon_trn_c)  udma_uart1_ingress_ap; ///< Output for udma_uart1_ingress transactions to the scoreboard
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  apb_i2c_ingress_ap; ///< Output for apb_i2c_ingress transactions to the scoreboard
   /// @}


   `uvm_component_utils(uvme_cvmcu_chip_prd_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_prd", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      data_obi_reg_fifo = new("data_obi_reg_fifo", this);
      udma_qspi0_ingress_fifo = new("udma_qspi0_ingress_fifo", this);
      udma_qspi1_ingress_fifo = new("udma_qspi1_ingress_fifo", this);
      udma_camera_fifo = new("udma_camera_fifo", this);
      udma_i2c0_ingress_fifo = new("udma_i2c0_ingress_fifo", this);
      udma_i2c1_ingress_fifo = new("udma_i2c1_ingress_fifo", this);
      udma_uart0_ingress_fifo = new("udma_uart0_ingress_fifo", this);
      udma_uart1_ingress_fifo = new("udma_uart1_ingress_fifo", this);
      apb_i2c_ingress_fifo = new("apb_i2c_ingress_fifo", this);
      core_event_fifo = new("core_event_fifo", this);
      sys_event_fifo = new("sys_event_fifo", this);
      mon_dbg_fifo = new("mon_dbg_fifo", this);
      udma_qspi0_egress_fifo = new("udma_qspi0_egress_fifo", this);
      udma_qspi1_egress_fifo = new("udma_qspi1_egress_fifo", this);
      udma_i2c0_egress_fifo = new("udma_i2c0_egress_fifo", this);
      udma_i2c1_egress_fifo = new("udma_i2c1_egress_fifo", this);
      udma_uart0_egress_fifo = new("udma_uart0_egress_fifo", this);
      udma_uart1_egress_fifo = new("udma_uart1_egress_fifo", this);
      apb_i2c_egress_fifo = new("apb_i2c_egress_fifo", this);
      dbg_fifo = new("dbg_fifo", this);
   endfunction

   /**
    * Creates analysis ports.
    */
   virtual function void create_ports();
      udma_qspi0_egress_ap = new("udma_qspi0_egress_ap", this);
      udma_qspi1_egress_ap = new("udma_qspi1_egress_ap", this);
      udma_i2c0_egress_ap = new("udma_i2c0_egress_ap", this);
      udma_i2c1_egress_ap = new("udma_i2c1_egress_ap", this);
      udma_uart0_egress_ap = new("udma_uart0_egress_ap", this);
      udma_uart1_egress_ap = new("udma_uart1_egress_ap", this);
      apb_i2c_egress_ap = new("apb_i2c_egress_ap", this);
      dbg_ap = new("dbg_ap", this);
      udma_qspi0_ingress_ap = new("udma_qspi0_ingress_ap", this);
      udma_qspi1_ingress_ap = new("udma_qspi1_ingress_ap", this);
      udma_camera_ap = new("udma_camera_ap", this);
      udma_i2c0_ingress_ap = new("udma_i2c0_ingress_ap", this);
      udma_i2c1_ingress_ap = new("udma_i2c1_ingress_ap", this);
      udma_uart0_ingress_ap = new("udma_uart0_ingress_ap", this);
      udma_uart1_ingress_ap = new("udma_uart1_ingress_ap", this);
      apb_i2c_ingress_ap = new("apb_i2c_ingress_ap", this);
   endfunction

   /**
    * Executes prediction threads.
    */
   virtual task predict();
      fork
         predict_udma_qspi0_ingress();
         predict_udma_qspi1_ingress();
         predict_udma_camera();
         predict_udma_i2c0_ingress();
         predict_udma_i2c1_ingress();
         predict_udma_uart0_ingress();
         predict_udma_uart1_ingress();
         predict_apb_i2c_ingress();
         predict_core_event();
         predict_sys_event();
         predict_mon_dbg();
         predict_udma_qspi0_egress();
         predict_udma_qspi1_egress();
         predict_udma_i2c0_egress();
         predict_udma_i2c1_egress();
         predict_udma_uart0_egress();
         predict_udma_uart1_egress();
         predict_apb_i2c_egress();
         predict_dbg();
      join
   endtask

   /**
    * Prediction thread for register accesses.
    */
   virtual task predict_reg_op(ref uvm_reg_item op);
      uvm_reg        target_reg  ;
      uvm_reg_field  target_field;
      uvm_mem        target_mem  ;
      case (op.element_kind)
         UVM_REG: begin
            // TODO Implement uvme_cvmcu_chip_prd_c::predict_reg_op() for registers
            //      Ex: case (target_reg)
            //             cntxt.reg_model.abc_reg: begin
            //                cntxt.reg_model.xyz_reg.set('h123);
            //             end
            //          endcase
         end
         UVM_FIELD: begin
            // TODO Implement uvme_cvmcu_chip_prd_c::predict_reg_op() for fields
            //      Ex: case (target_reg)
            //             cntxt.reg_model.abc_reg.def_field: begin
            //                cntxt.reg_model.xyz_reg.ghi_field.set('h1);
            //             end
            //          endcase
         end
         UVM_MEM: begin
            // TODO Implement uvme_cvmcu_chip_prd_c::predict_reg_op() for memories
            //      Ex: case (target_mem)
            //             cntxt.reg_model.ram: begin
            //                case (op.offset)
            //                   cntxt.reg_model.abc_reg.def_field: begin
            //                      cntxt.reg_model.xyz_reg.ghi_field.set('h123);
            //                   end
            //                endcase
            //             end
            //          endcase
         end
      endcase
   endtask

   /**
    * Prediction thread for udma_qspi0_ingress.
    */
   virtual task predict_udma_qspi0_ingress();
      uvma_spi_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_qspi0_ingress_fifo, in_trn)
         out_trn = uvma_spi_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         // TODO Implement uvme_cvmcu_chip_prd_c::process_udma_qspi0_ingress()
         `uvmx_prd_send(udma_qspi0_ingress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_qspi1_ingress.
    */
   virtual task predict_udma_qspi1_ingress();
      uvma_spi_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_qspi1_ingress_fifo, in_trn)
         out_trn = uvma_spi_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         // TODO Implement uvme_cvmcu_chip_prd_c::process_udma_qspi1_ingress()
         `uvmx_prd_send(udma_qspi1_ingress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_camera.
    */
   virtual task predict_udma_camera();
      uvma_cvmcu_cpi_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_camera_fifo, in_trn)
         out_trn = uvma_cvmcu_cpi_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         // TODO Implement uvme_cvmcu_chip_prd_c::process_udma_camera()
         `uvmx_prd_send(udma_camera_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_i2c0_ingress.
    */
   virtual task predict_udma_i2c0_ingress();
      uvma_i2c_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_i2c0_ingress_fifo, in_trn)
         out_trn = uvma_i2c_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         // TODO Implement uvme_cvmcu_chip_prd_c::process_udma_i2c0_ingress()
         `uvmx_prd_send(udma_i2c0_ingress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_i2c1_ingress.
    */
   virtual task predict_udma_i2c1_ingress();
      uvma_i2c_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_i2c1_ingress_fifo, in_trn)
         out_trn = uvma_i2c_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         // TODO Implement uvme_cvmcu_chip_prd_c::process_udma_i2c1_ingress()
         `uvmx_prd_send(udma_i2c1_ingress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_uart0_ingress.
    */
   virtual task predict_udma_uart0_ingress();
      uvma_uart_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_uart0_ingress_fifo, in_trn)
         out_trn = uvma_uart_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         // TODO Implement uvme_cvmcu_chip_prd_c::process_udma_uart0_ingress()
         `uvmx_prd_send(udma_uart0_ingress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_uart1_ingress.
    */
   virtual task predict_udma_uart1_ingress();
      uvma_uart_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_uart1_ingress_fifo, in_trn)
         out_trn = uvma_uart_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         // TODO Implement uvme_cvmcu_chip_prd_c::process_udma_uart1_ingress()
         `uvmx_prd_send(udma_uart1_ingress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for apb_i2c_ingress.
    */
   virtual task predict_apb_i2c_ingress();
      uvma_i2c_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(apb_i2c_ingress_fifo, in_trn)
         out_trn = uvma_i2c_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         // TODO Implement uvme_cvmcu_chip_prd_c::process_apb_i2c_ingress()
         `uvmx_prd_send(apb_i2c_ingress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for core_event.
    */
   virtual task predict_core_event();
      uvma_cvmcu_event_mon_trn_c  in_trn;
      forever begin
         `uvmx_prd_get(core_event_fifo, in_trn)
         // TODO Implement uvme_cvmcu_chip_prd_c::predict_core_event()
      end
   endtask

   /**
    * Prediction thread for sys_event.
    */
   virtual task predict_sys_event();
      uvma_cvmcu_event_mon_trn_c  in_trn;
      forever begin
         `uvmx_prd_get(sys_event_fifo, in_trn)
         // TODO Implement uvme_cvmcu_chip_prd_c::predict_sys_event()
      end
   endtask

   /**
    * Prediction thread for mon_dbg.
    */
   virtual task predict_mon_dbg();
      uvma_cvmcu_dbg_mon_trn_c  in_trn;
      forever begin
         `uvmx_prd_get(mon_dbg_fifo, in_trn)
         // TODO Implement uvme_cvmcu_chip_prd_c::predict_mon_dbg()
      end
   endtask

   /**
    * Prediction thread for udma_qspi0_egress.
    */
   virtual task predict_udma_qspi0_egress();
      uvma_spi_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_qspi0_egress_fifo, in_trn)
         out_trn = uvma_spi_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(udma_qspi0_egress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_qspi1_egress.
    */
   virtual task predict_udma_qspi1_egress();
      uvma_spi_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_qspi1_egress_fifo, in_trn)
         out_trn = uvma_spi_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(udma_qspi1_egress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_i2c0_egress.
    */
   virtual task predict_udma_i2c0_egress();
      uvma_i2c_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_i2c0_egress_fifo, in_trn)
         out_trn = uvma_i2c_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(udma_i2c0_egress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_i2c1_egress.
    */
   virtual task predict_udma_i2c1_egress();
      uvma_i2c_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_i2c1_egress_fifo, in_trn)
         out_trn = uvma_i2c_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(udma_i2c1_egress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_uart0_egress.
    */
   virtual task predict_udma_uart0_egress();
      uvma_uart_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_uart0_egress_fifo, in_trn)
         out_trn = uvma_uart_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(udma_uart0_egress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for udma_uart1_egress.
    */
   virtual task predict_udma_uart1_egress();
      uvma_uart_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(udma_uart1_egress_fifo, in_trn)
         out_trn = uvma_uart_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(udma_uart1_egress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for apb_i2c_egress.
    */
   virtual task predict_apb_i2c_egress();
      uvma_i2c_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(apb_i2c_egress_fifo, in_trn)
         out_trn = uvma_i2c_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(apb_i2c_egress_ap, out_trn)
      end
   endtask

   /**
    * Prediction thread for dbg.
    */
   virtual task predict_dbg();
      uvma_cvmcu_dbg_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(dbg_fifo, in_trn)
         out_trn = uvma_cvmcu_dbg_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         `uvmx_prd_send(dbg_ap, out_trn)
      end
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_PRD_SV__