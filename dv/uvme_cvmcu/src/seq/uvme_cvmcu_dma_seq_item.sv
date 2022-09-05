// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_DMA_SEQ_ITEM_SV__
`define __UVME_CVMCU_DMA_SEQ_ITEM_SV__


/**
 * Object created by CORE-V MCU DMA sequences running on uvme_cvmcu_dma_sqr_c.
 */
class uvme_cvmcu_dma_seq_item_c extends uvml_mon_trn_c;

   /// @name Data
   /// @{
   rand uvme_cvmcu_peripherals_enum       peripheral_selected; ///< TODO Describe peripheral_selected
   rand int unsigned                      data_sz            ; ///< TODO Describe data_sz
   rand uvme_cvmcu_dma_data_pattern_enum  data_pattern       ; ///< TODO Describe data_pattern
   rand bit [7:0]                         data[$]            ; ///< TODO Describe data
   /// @}

   /// @name Metadata
   /// @{
   uvme_cvmcu_cfg_c  cfg; ///< Environment configuration handle
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_dma_seq_item_c)
      `uvm_field_enum     (uvme_cvmcu_peripherals_enum     , peripheral_selected, UVM_DEFAULT                )
      `uvm_field_int      (                                  data_sz            , UVM_DEFAULT + UVM_DEC      )
      `uvm_field_enum     (uvme_cvmcu_dma_data_pattern_enum, data_pattern       , UVM_DEFAULT + UVM_NOCOMPARE)
      `uvm_field_queue_int(                                  data               , UVM_DEFAULT                )
   `uvm_object_utils_end


   // TODO Add uvme_cvmcu_dma_seq_item_c constraints
   //      Ex: /**
   //           * Describe constraint here
   //           */
   //          constraint default_cons {
   //             abc inside {0,2,4,8,16,32};
   //          }


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_dma_seq_item");

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   extern function uvml_metadata_t get_metadata();

endclass : uvme_cvmcu_dma_seq_item_c


function uvme_cvmcu_dma_seq_item_c::new(string name="uvme_cvmcu_dma_seq_item");

   super.new(name);

endfunction : new


function uvml_metadata_t uvme_cvmcu_dma_seq_item_c::get_metadata();

   // TODO Create metadata for transaction logger
   //      Ex: string  abc_str = $sformatf("%h", abc);
   //          get_metadata.push_back('{
   //             index     : 0,
   //             value     : abc_str
   //             col_name  : "abc",
   //             col_width : abc_str.len(),
   //             col_align : UVML_TEXT_ALIGN_RIGHT,
   //             data_type : UVML_FIELD_INT
   //          });

endfunction : get_metadata


`endif // __UVME_CVMCU_DMA_SEQ_ITEM_SV__
