// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_CP_MON_TRN_SV__
`define __UVMA_ADV_TIMER_B_CP_MON_TRN_SV__


/**
 * Control Plane monitor transaction sampled by uvma_adv_timer_b_cp_mon_c.
 * @ingroup uvma_adv_timer_b_obj
 */
class uvma_adv_timer_b_cp_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_adv_timer_b_cfg_c  ),
   .T_CNTXT(uvma_adv_timer_b_cntxt_c)
);

   /// @name Data
   /// @{
   logic                                   cfg_start_i      ; ///< 
   logic                                   cfg_stop_i       ; ///< 
   logic                                   cfg_rst_i        ; ///< 
   logic                                   cfg_update_i     ; ///< 
   logic                                   cfg_arm_i        ; ///< 
   uvma_adv_timer_b_cfg_sel_i_l_t          cfg_sel_i        ; ///< 
   logic                                   cfg_sel_clk_i    ; ///< 
   uvma_adv_timer_b_cfg_mode_i_l_t         cfg_mode_i       ; ///< 
   uvma_adv_timer_b_cfg_presc_i_l_t        cfg_presc_i      ; ///< 
   logic                                   cfg_sawtooth_i   ; ///< 
   uvma_adv_timer_b_num_bits_l_t           cfg_cnt_start_i  ; ///< 
   uvma_adv_timer_b_num_bits_l_t           cfg_cnt_end_i    ; ///< 
   uvma_adv_timer_b_num_bits_l_t           cfg_comp_ch0_i   ; ///< 
   uvma_adv_timer_b_cfg_comp_op_ch0_i_l_t  cfg_comp_op_ch0_i; ///< 
   uvma_adv_timer_b_num_bits_l_t           cfg_comp_ch1_i   ; ///< 
   uvma_adv_timer_b_cfg_comp_op_ch1_i_l_t  cfg_comp_op_ch1_i; ///< 
   uvma_adv_timer_b_num_bits_l_t           cfg_comp_ch2_i   ; ///< 
   uvma_adv_timer_b_cfg_comp_op_ch2_i_l_t  cfg_comp_op_ch2_i; ///< 
   uvma_adv_timer_b_num_bits_l_t           cfg_comp_ch3_i   ; ///< 
   uvma_adv_timer_b_cfg_comp_op_ch3_i_l_t  cfg_comp_op_ch3_i; ///< 
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_adv_timer_b_cp_mon_trn_c)
      `uvm_field_int(cfg_start_i, UVM_DEFAULT)
      `uvm_field_int(cfg_stop_i, UVM_DEFAULT)
      `uvm_field_int(cfg_rst_i, UVM_DEFAULT)
      `uvm_field_int(cfg_update_i, UVM_DEFAULT)
      `uvm_field_int(cfg_arm_i, UVM_DEFAULT)
      `uvm_field_int(cfg_sel_i, UVM_DEFAULT)
      `uvm_field_int(cfg_sel_clk_i, UVM_DEFAULT)
      `uvm_field_int(cfg_mode_i, UVM_DEFAULT)
      `uvm_field_int(cfg_presc_i, UVM_DEFAULT)
      `uvm_field_int(cfg_sawtooth_i, UVM_DEFAULT)
      `uvm_field_int(cfg_cnt_start_i, UVM_DEFAULT)
      `uvm_field_int(cfg_cnt_end_i, UVM_DEFAULT)
      `uvm_field_int(cfg_comp_ch0_i, UVM_DEFAULT)
      `uvm_field_int(cfg_comp_op_ch0_i, UVM_DEFAULT)
      `uvm_field_int(cfg_comp_ch1_i, UVM_DEFAULT)
      `uvm_field_int(cfg_comp_op_ch1_i, UVM_DEFAULT)
      `uvm_field_int(cfg_comp_ch2_i, UVM_DEFAULT)
      `uvm_field_int(cfg_comp_op_ch2_i, UVM_DEFAULT)
      `uvm_field_int(cfg_comp_ch3_i, UVM_DEFAULT)
      `uvm_field_int(cfg_comp_op_ch3_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_cp_mon_trn");
      super.new(name);
   endfunction

   /**
    * Describes transaction for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string cfg_start_i_str;
      string cfg_stop_i_str;
      string cfg_rst_i_str;
      string cfg_update_i_str;
      string cfg_arm_i_str;
      string cfg_sel_i_str;
      string cfg_sel_clk_i_str;
      string cfg_mode_i_str;
      string cfg_presc_i_str;
      string cfg_sawtooth_i_str;
      string cfg_cnt_start_i_str;
      string cfg_cnt_end_i_str;
      string cfg_comp_ch0_i_str;
      string cfg_comp_op_ch0_i_str;
      string cfg_comp_ch1_i_str;
      string cfg_comp_op_ch1_i_str;
      string cfg_comp_ch2_i_str;
      string cfg_comp_op_ch2_i_str;
      string cfg_comp_ch3_i_str;
      string cfg_comp_op_ch3_i_str;
      cfg_start_i_str = $sformatf("%b", cfg_start_i);
      cfg_stop_i_str = $sformatf("%b", cfg_stop_i);
      cfg_rst_i_str = $sformatf("%b", cfg_rst_i);
      cfg_update_i_str = $sformatf("%b", cfg_update_i);
      cfg_arm_i_str = $sformatf("%b", cfg_arm_i);
      cfg_sel_i_str = $sformatf("%h", cfg_sel_i);
      cfg_sel_clk_i_str = $sformatf("%b", cfg_sel_clk_i);
      cfg_mode_i_str = $sformatf("%h", cfg_mode_i);
      cfg_presc_i_str = $sformatf("%h", cfg_presc_i);
      cfg_sawtooth_i_str = $sformatf("%b", cfg_sawtooth_i);
      cfg_cnt_start_i_str = $sformatf("%h", cfg_cnt_start_i);
      cfg_cnt_end_i_str = $sformatf("%h", cfg_cnt_end_i);
      cfg_comp_ch0_i_str = $sformatf("%h", cfg_comp_ch0_i);
      cfg_comp_op_ch0_i_str = $sformatf("%h", cfg_comp_op_ch0_i);
      cfg_comp_ch1_i_str = $sformatf("%h", cfg_comp_ch1_i);
      cfg_comp_op_ch1_i_str = $sformatf("%h", cfg_comp_op_ch1_i);
      cfg_comp_ch2_i_str = $sformatf("%h", cfg_comp_ch2_i);
      cfg_comp_op_ch2_i_str = $sformatf("%h", cfg_comp_op_ch2_i);
      cfg_comp_ch3_i_str = $sformatf("%h", cfg_comp_ch3_i);
      cfg_comp_op_ch3_i_str = $sformatf("%h", cfg_comp_op_ch3_i);
      `uvmx_metadata_field("cfg_start_i", cfg_start_i_str)
      `uvmx_metadata_field("cfg_stop_i", cfg_stop_i_str)
      `uvmx_metadata_field("cfg_rst_i", cfg_rst_i_str)
      `uvmx_metadata_field("cfg_update_i", cfg_update_i_str)
      `uvmx_metadata_field("cfg_arm_i", cfg_arm_i_str)
      `uvmx_metadata_field("cfg_sel_i", cfg_sel_i_str)
      `uvmx_metadata_field("cfg_sel_clk_i", cfg_sel_clk_i_str)
      `uvmx_metadata_field("cfg_mode_i", cfg_mode_i_str)
      `uvmx_metadata_field("cfg_presc_i", cfg_presc_i_str)
      `uvmx_metadata_field("cfg_sawtooth_i", cfg_sawtooth_i_str)
      `uvmx_metadata_field("cfg_cnt_start_i", cfg_cnt_start_i_str)
      `uvmx_metadata_field("cfg_cnt_end_i", cfg_cnt_end_i_str)
      `uvmx_metadata_field("cfg_comp_ch0_i", cfg_comp_ch0_i_str)
      `uvmx_metadata_field("cfg_comp_op_ch0_i", cfg_comp_op_ch0_i_str)
      `uvmx_metadata_field("cfg_comp_ch1_i", cfg_comp_ch1_i_str)
      `uvmx_metadata_field("cfg_comp_op_ch1_i", cfg_comp_op_ch1_i_str)
      `uvmx_metadata_field("cfg_comp_ch2_i", cfg_comp_ch2_i_str)
      `uvmx_metadata_field("cfg_comp_op_ch2_i", cfg_comp_op_ch2_i_str)
      `uvmx_metadata_field("cfg_comp_ch3_i", cfg_comp_ch3_i_str)
      `uvmx_metadata_field("cfg_comp_op_ch3_i", cfg_comp_op_ch3_i_str)
   endfunction

endclass : uvma_adv_timer_b_cp_mon_trn_c


`endif // __UVMA_ADV_TIMER_B_CP_MON_TRN_SV__