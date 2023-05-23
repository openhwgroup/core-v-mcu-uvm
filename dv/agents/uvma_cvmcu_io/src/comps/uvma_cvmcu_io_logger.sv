// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_LOGGER_SV__
`define __UVMA_CVMCU_IO_LOGGER_SV__


/**
 * Component which logs to disk information of the transactions generated and monitored by uvma_cvmcu_io_agent_c.
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_logger_c extends uvmx_agent_logger_c #(
   .T_CFG     (uvma_cvmcu_io_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_io_seq_item_c)
);

   /// @name Loggers
   /// @{
   uvmx_logger_c #(uvma_cvmcu_io_mon_trn_c )  ig_mon_trn_logger; ///< Logs IG Monitor Transactions from vsequencer.
   uvmx_logger_c #(uvma_cvmcu_io_mon_trn_c )  eg_mon_trn_logger; ///< Logs EG Monitor Transactions from vsequencer.
   uvmx_logger_c #(uvma_cvmcu_io_board_padi_seq_item_c)  board_padi_seq_item_logger; ///< Logs PADI Sequence Items from BOARD Driver.
   uvmx_logger_c #(uvma_cvmcu_io_board_pado_seq_item_c)  board_pado_seq_item_logger; ///< Logs PADO Sequence Items from BOARD Driver.
   uvmx_logger_c #(uvma_cvmcu_io_chip_padi_seq_item_c)  chip_padi_seq_item_logger; ///< Logs PADI Sequence Items from CHIP Driver.
   uvmx_logger_c #(uvma_cvmcu_io_chip_pado_seq_item_c)  chip_pado_seq_item_logger; ///< Logs PADO Sequence Items from CHIP Driver.
   uvmx_logger_c #(uvma_cvmcu_io_padi_mon_trn_c)  padi_mon_trn_logger; ///< Logs PADI Monitor Transactions from Monitor.
   uvmx_logger_c #(uvma_cvmcu_io_pado_mon_trn_c)  pado_mon_trn_logger; ///< Logs PADO Monitor Transactions from Monitor.
   /// @}


   `uvm_component_utils(uvma_cvmcu_io_logger_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_logger", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates logger components.
    */
   virtual function void create_loggers();
      ig_mon_trn_logger  = uvmx_logger_c #(uvma_cvmcu_io_mon_trn_c )::type_id::create("ig_mon_trn_logger", this);
      eg_mon_trn_logger  = uvmx_logger_c #(uvma_cvmcu_io_mon_trn_c )::type_id::create("eg_mon_trn_logger", this);
      padi_mon_trn_logger = uvmx_logger_c #(uvma_cvmcu_io_padi_mon_trn_c)::type_id::create("padi_mon_trn_logger", this);
      pado_mon_trn_logger = uvmx_logger_c #(uvma_cvmcu_io_pado_mon_trn_c)::type_id::create("pado_mon_trn_logger", this);
      board_padi_seq_item_logger = uvmx_logger_c #(uvma_cvmcu_io_board_padi_seq_item_c)::type_id::create("board_padi_seq_item_logger", this);
      board_pado_seq_item_logger = uvmx_logger_c #(uvma_cvmcu_io_board_pado_seq_item_c)::type_id::create("board_pado_seq_item_logger", this);
      chip_padi_seq_item_logger = uvmx_logger_c #(uvma_cvmcu_io_chip_padi_seq_item_c)::type_id::create("chip_padi_seq_item_logger", this);
      chip_pado_seq_item_logger = uvmx_logger_c #(uvma_cvmcu_io_chip_pado_seq_item_c)::type_id::create("chip_pado_seq_item_logger", this);
   endfunction

   /**
    * Sets filenames for logger components.
    */
   virtual function void configure_loggers();
      ig_mon_trn_logger.set_filename("ig_mon_trn");
      eg_mon_trn_logger.set_filename("eg_mon_trn");
      padi_mon_trn_logger.set_filename("padi.mon_trn");
      pado_mon_trn_logger.set_filename("pado.mon_trn");
      board_padi_seq_item_logger.set_filename("board_padi.seq_item");
      board_pado_seq_item_logger.set_filename("board_pado.seq_item");
      chip_padi_seq_item_logger.set_filename("chip_padi.seq_item");
      chip_pado_seq_item_logger.set_filename("chip_pado.seq_item");
   endfunction

endclass : uvma_cvmcu_io_logger_c


`endif // __UVMA_CVMCU_IO_LOGGER_SV__