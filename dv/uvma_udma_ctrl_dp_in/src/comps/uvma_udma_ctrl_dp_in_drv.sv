// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_UDMA_CTRL_DP_IN_DRV_SV__
`define __UVMA_UDMA_CTRL_DP_IN_DRV_SV__


/**
 * Component driving a uDMA Controller Block Data Plane Input virtual interface (uvma_udma_ctrl_dp_in_if) with contents from uvma_udma_ctrl_dp_in_seq_item_c requests.
 * @ingroup uvma_udma_ctrl_dp_in_comps
 */
class uvma_udma_ctrl_dp_in_drv_c extends uvml_drv_c #(
   .REQ(uvma_udma_ctrl_dp_in_seq_item_c),
   .RSP(uvma_udma_ctrl_dp_in_seq_item_c)
);

   /// @name Objects
   /// @{
   uvma_udma_ctrl_dp_in_cfg_c    cfg  ; ///< Agent configuration handle
   uvma_udma_ctrl_dp_in_cntxt_c  cntxt; ///< Agent context handle
   /// @}

   /// @name TLM
   /// @{
   uvm_analysis_port#(uvma_udma_ctrl_dp_in_seq_item_c)  ap; ///< Port producing sampled transactions.
   /// @}

   /// @name Interface handles
   /// @{
   virtual uvma_udma_ctrl_dp_in_if.drv_mp  mp; ///< Handle to driver modport
   /// @}


   `uvm_component_utils_begin(uvma_udma_ctrl_dp_in_drv_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_udma_ctrl_dp_in_drv", uvm_component parent=null);

   /**
    * 1. Ensures #cfg & #cntxt handles are not null
    * 2. Builds #ap
    * 3. Obtains #mp handle
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Oversees driving, depending on the reset state, by calling drv_<pre|in|post>_reset() tasks.
    */
   extern virtual task run_phase(uvm_phase phase);

   /**
    * Uses uvm_config_db to retrieve cfg.
    */
   extern function void get_cfg();

   /**
    * Uses uvm_config_db to retrieve cntxt.
    */
   extern function void get_cntxt();

   /**
    * Creates #ap.
    */
   extern function void create_tlm_ports();

   /**
    * Retrieves #mp from #cntxt.
    */
   extern function void retrieve_modports();

   /**
    * Called by run_phase() while agent is in pre-reset state.
    */
   extern virtual task drv_pre_reset();

   /**
    * Called by run_phase() while agent is in reset state.
    */
   extern virtual task drv_in_reset();

   /**
    * Called by run_phase() while agent is in post-reset state.
    */
   extern virtual task drv_post_reset();

   /**
    * Appends #cfg, prints out req and issues heartbeat.
    */
   extern virtual function void process_req(ref uvma_udma_ctrl_dp_in_seq_item_c req);

   /**
    * Drives #mp's signals using req's contents.
    */
   extern virtual task drv_req(ref uvma_udma_ctrl_dp_in_seq_item_c req);

endclass : uvma_udma_ctrl_dp_in_drv_c


function uvma_udma_ctrl_dp_in_drv_c::new(string name="uvma_udma_ctrl_dp_in_drv", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvma_udma_ctrl_dp_in_drv_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg          ();
   get_cntxt        ();
   create_tlm_ports ();
   retrieve_modports();

endfunction : build_phase


task uvma_udma_ctrl_dp_in_drv_c::run_phase(uvm_phase phase);

   super.run_phase(phase);
   if (cfg.enabled && cfg.is_active) begin
      forever begin
         case (cntxt.reset_state)
            UVML_RESET_STATE_PRE_RESET : drv_pre_reset ();
            UVML_RESET_STATE_IN_RESET  : drv_in_reset  ();
            UVML_RESET_STATE_POST_RESET: drv_post_reset();
         endcase
      end
   end

endtask : run_phase


function void uvma_udma_ctrl_dp_in_drv_c::get_cfg();

   void'(uvm_config_db#(uvma_udma_ctrl_dp_in_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("UDMA_CTRL_DP_IN_DRV", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvma_udma_ctrl_dp_in_drv_c::get_cntxt();

   void'(uvm_config_db#(uvma_udma_ctrl_dp_in_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("UDMA_CTRL_DP_IN_DRV", "Context handle is null")
   end

endfunction : get_cntxt


function void uvma_udma_ctrl_dp_in_drv_c::create_tlm_ports();

   ap = new("ap", this);

endfunction : create_tlm_ports


function void uvma_udma_ctrl_dp_in_drv_c::retrieve_modports();

   mp = cntxt.vif.drv_mp;

endfunction : retrieve_modports


task uvma_udma_ctrl_dp_in_drv_c::drv_pre_reset();

   @(mp.drv_cb);

endtask : drv_pre_reset


task uvma_udma_ctrl_dp_in_drv_c::drv_in_reset();

   @(mp.drv_cb);

endtask : drv_in_reset


task uvma_udma_ctrl_dp_in_drv_c::drv_post_reset();

   seq_item_port.get_next_item(req);
   process_req                (req);
   drv_req                    (req);
   ap.write                   (req);
   seq_item_port.item_done();

endtask : drv_post_reset


function void uvma_udma_ctrl_dp_in_drv_c::process_req(ref uvma_udma_ctrl_dp_in_seq_item_c req);

   req.cfg = cfg;
   `uvm_info("UDMA_CTRL_DP_IN_DRV", $sformatf("Got new req from the sequencer:\n%s", req.sprint()), UVM_DEBUG)
   `uvml_hrtbt()

endfunction : process_req


task uvma_udma_ctrl_dp_in_drv_c::drv_req(ref uvma_udma_ctrl_dp_in_seq_item_c req);

   @(mp.drv_cb);
   // TODO Implement uvma_udma_ctrl_dp_in_drv_c::drv_req()
   //      Ex: mp.drv_cb.enable <= 1'b1;
   //          mp.drv_cb.abc    <= req.abc;
   //          mp.drv_cb.xyz    <= req.xyz;

endtask : drv_req


`endif // __UVMA_UDMA_CTRL_DP_IN_DRV_SV__
