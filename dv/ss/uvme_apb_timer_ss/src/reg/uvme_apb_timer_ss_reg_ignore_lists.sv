// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_REG_IGNORE_LISTS_SV__
`define __UVME_APB_TIMER_SS_REG_IGNORE_LISTS_SV__


string  uvme_apb_timer_ss_all_reg_mem_ignore_list[$] = '{
};

string  uvme_apb_timer_ss_reg_hw_reset_ignore_list[$] = '{
};

string  uvme_apb_timer_ss_reg_bit_bash_ignore_list[$] = '{
   "cfg_reg_low.mode_64_bit",
   "cfg_reg_low.mode_mtime_bit",
   "cfg_reg_low.prescaler_count",
   "cfg_reg_low.ref_clk_en_bit",
   "cfg_reg_low.prescaler_en_bit",
   "cfg_reg_low.one_shot_bit",
   "cfg_reg_low.cmp_clr_bit",
   "cfg_reg_low.iem_bit",
   "cfg_reg_low.irq_bit",
   "cfg_reg_low.reset_bit",
   "cfg_reg_low.enable_bit",
   "cfg_reg_hi.mode_64_bit",
   "cfg_reg_hi.mode_mtime_bit",
   "cfg_reg_hi.prescaler_count",
   "cfg_reg_hi.ref_clk_en_bit",
   "cfg_reg_hi.prescaler_en_bit",
   "cfg_reg_hi.one_shot_bit",
   "cfg_reg_hi.cmp_clr_bit",
   "cfg_reg_hi.iem_bit",
   "cfg_reg_hi.irq_bit",
   "cfg_reg_hi.reset_bit",
   "cfg_reg_hi.enable_bit"
};

string  uvme_apb_timer_ss_reg_access_ignore_list[$] = '{
};

string  uvme_apb_timer_ss_mem_access_ignore_list[$] = '{
};

string  uvme_apb_timer_ss_shared_access_ignore_list[$] = '{
};

string  uvme_apb_timer_ss_mem_walk_access_ignore_list[$] = '{
};


`endif // __UVME_APB_TIMER_SS_REG_IGNORE_LISTS_SV__