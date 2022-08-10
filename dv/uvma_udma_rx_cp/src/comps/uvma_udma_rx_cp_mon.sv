// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_UDMA_RX_CP_MON_SV__
`define __UVMA_UDMA_RX_CP_MON_SV__


/**
 * Component sampling transactions from uDMA Rx Channels Block Control Plane virtual interface (uvma_udma_rx_cp_if).
 * @ingroup uvma_udma_rx_cp_comps
 */
class uvma_udma_rx_cp_mon_c extends uvml_mon_c;

   /// @defgroup Objects
   /// @{
   uvma_udma_rx_cp_cfg_c    cfg  ; ///< Agent configuration handle
   uvma_udma_rx_cp_cntxt_c  cntxt; ///< Agent context handle
   /// @}

   /// @defgroup TLM
   /// @{
   uvm_analysis_port#(uvma_udma_rx_cp_mon_trn_c)  ap; ///< Port producing sampled transactions.
   /// @}

   /// @defgroup Interface handles
   /// @{
   virtual uvma_udma_rx_cp_if.mon_mp  mp; ///< Handle to monitor modport
   /// @}


   `uvm_component_utils_begin(uvma_udma_rx_cp_mon_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_udma_rx_cp_mon", uvm_component parent=null);

   /**
    * 1. Ensures #cfg & #cntxt handles are not null
    * 2. Builds #ap
    * 3. Obtains #mp handle
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Oversees monitoring, depending on the reset state, by calling mon_<pre|in|post>_reset() tasks.
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
    * Updates the context's reset state.
    */
   extern virtual task observe_reset();

   /**
    * Synchronous reset thread.
    */
   extern virtual task observe_reset_sync();

   /**
    * Asynchronous reset thread.
    */
   extern virtual task observe_reset_async();

   /**
    * Called by run_phase() while agent is in pre-reset state.
    */
   extern virtual task mon_pre_reset();

   /**
    * Called by run_phase() while agent is in reset state.
    */
   extern virtual task mon_in_reset();

   /**
    * Called by run_phase() while agent is in post-reset state.
    */
   extern virtual task mon_post_reset();

   /**
    * Creates trn by sampling #mp signals.
    */
   extern virtual task sample_trn(output uvma_udma_rx_cp_mon_trn_c trn);

   /**
    * Appends #cfg, prints out trn and resets heartbeat monitor.
    */
   extern virtual function void process_trn(ref uvma_udma_rx_cp_mon_trn_c trn);

endclass : uvma_udma_rx_cp_mon_c


function uvma_udma_rx_cp_mon_c::new(string name="uvma_udma_rx_cp_mon", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvma_udma_rx_cp_mon_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg          ();
   get_cntxt        ();
   create_tlm_ports ();
   retrieve_modports();

endfunction : build_phase


task uvma_udma_rx_cp_mon_c::run_phase(uvm_phase phase);

   super.run_phase(phase);
   if (cfg.enabled) begin
      cntxt.sample_cntxt_e.trigger();
      fork
         observe_reset();
         forever begin
            case (cntxt.reset_state)
               UVML_RESET_STATE_PRE_RESET : mon_pre_reset ();
               UVML_RESET_STATE_IN_RESET  : mon_in_reset  ();
               UVML_RESET_STATE_POST_RESET: mon_post_reset();
            endcase
         end
      join_none
   end

endtask : run_phase


function void uvma_udma_rx_cp_mon_c::get_cfg();

   void'(uvm_config_db#(uvma_udma_rx_cp_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("UDMA_RX_CP_MON", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvma_udma_rx_cp_mon_c::get_cntxt();

   void'(uvm_config_db#(uvma_udma_rx_cp_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("UDMA_RX_CP_MON", "Context handle is null")
   end

endfunction : get_cntxt


function void uvma_udma_rx_cp_mon_c::create_tlm_ports();

   ap = new("ap", this);

endfunction : create_tlm_ports


function void uvma_udma_rx_cp_mon_c::retrieve_modports();

   mp = cntxt.vif.mon_mp;

endfunction : retrieve_modports


task uvma_udma_rx_cp_mon_c::observe_reset();

   case (cfg.reset_type)
      UVML_RESET_TYPE_SYNCHRONOUS : observe_reset_sync ();
      UVML_RESET_TYPE_ASYNCHRONOUS: observe_reset_async();
      default: begin
         `uvm_fatal("UDMA_RX_CP_MON", $sformatf("Illegal cfg.reset_type: %s", cfg.reset_type.name()))
      end
   endcase

endtask : observe_reset


task uvma_udma_rx_cp_mon_c::observe_reset_sync();

   forever begin
      `uvm_info("UDMA_RX_CP_MON", "Waiting for synchronous reset pulse", UVM_HIGH)
      while (mp.reset_n !== 1'b0) begin
         wait (mp.clk === 1);
         wait (mp.clk === 0);
      end
      cntxt.reset_state = UVML_RESET_STATE_IN_RESET;
      cntxt.sample_cntxt_e.trigger();
      `uvm_info("UDMA_RX_CP_MON", "Entered IN_RESET state", UVM_HIGH)
      while (mp.reset_n !== 1'b1) begin
         wait (mp.clk === 1);
         wait (mp.clk === 0);
      end
      cntxt.reset_state = UVML_RESET_STATE_POST_RESET;
      cntxt.sample_cntxt_e.trigger();
      `uvm_info("UDMA_RX_CP_MON", "Entered POST_RESET state", UVM_HIGH)
   end

endtask : observe_reset_sync


task uvma_udma_rx_cp_mon_c::observe_reset_async();

   forever begin
      `uvm_info("UDMA_RX_CP_MON", "Waiting for asynchronous reset pulse", UVM_HIGH)
      wait (mp.reset_n === 0);
      cntxt.reset_state = UVML_RESET_STATE_IN_RESET;
      cntxt.sample_cntxt_e.trigger();
      `uvm_info("UDMA_RX_CP_MON", "Entered IN_RESET state", UVM_HIGH)
      wait (mp.reset_n === 1);
      cntxt.reset_state = UVML_RESET_STATE_POST_RESET;
      cntxt.sample_cntxt_e.trigger();
      `uvm_info("UDMA_RX_CP_MON", "Entered POST_RESET state", UVM_HIGH)
   end

endtask : observe_reset_async


task uvma_udma_rx_cp_mon_c::mon_pre_reset();

   @(mp.mon_cb);

endtask : mon_pre_reset


task uvma_udma_rx_cp_mon_c::mon_in_reset();

   @(mp.mon_cb);

endtask : mon_in_reset


task uvma_udma_rx_cp_mon_c::mon_post_reset();

   uvma_udma_rx_cp_mon_trn_c  trn;
   sample_trn (trn);
   process_trn(trn);
   ap.write   (trn);

endtask : mon_post_reset


task uvma_udma_rx_cp_mon_c::sample_trn(output uvma_udma_rx_cp_mon_trn_c trn);

   bit  sampled_trn = 0;
   do begin
      @(mp.mon_cb);
      // TODO Sample trn
      //      Ex: if (mp.mon_cb.enable === 1'b1) begin
      //             `uvm_info("UDMA_RX_CP_MON", "Sampling transaction", UVM_DEBUG)
      //             trn = uvma_udma_rx_cp_mon_trn_c::type_id::create("trn");
      //             sampled_trn = 1;
      //             trn.data = mp.mon_cb.data;
      //             trn.set_timestamp_end($realtime());
      //          end
   end while (!sampled_trn);

endtask : sample_trn


function void uvma_udma_rx_cp_mon_c::process_trn(ref uvma_udma_rx_cp_mon_trn_c trn);

   trn.cfg = cfg;
   trn.set_initiator(this);
   `uvm_info("UDMA_RX_CP_MON", $sformatf("Sampled transaction from the virtual interface:\n%s", trn.sprint()), UVM_DEBUG)

endfunction : process_trn


`endif // __UVMA_UDMA_RX_CP_MON_SV__
