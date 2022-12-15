// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_REG_IGNORE_LISTS_SV__
`define __UVME_APB_TIMER_REG_IGNORE_LISTS_SV__


string  uvme_apb_timer_all_reg_mem_ignore_list[$] = '{
   // TODO Add registers and/or register blocks to ignore list for all automated reg tests
   //      Ex: "reg_name"     , // One register at a time
   //      Ex: "reg_name.abc*", // One register field at a time
};

string  uvme_apb_timer_reg_hw_reset_ignore_list[$] = '{
   // TODO Add registers and/or register blocks to ignore list for uvm_reg_hw_reset_seq
   //      Ex: "reg_name"     , // One register at a time
   //      Ex: "reg_name.abc*", // One register field at a time
};

string  uvme_apb_timer_reg_bit_bash_ignore_list[$] = '{
   "cfg_reg_hi" ,
   "cfg_reg_low"
};

string  uvme_apb_timer_reg_access_ignore_list[$] = '{
   // TODO Add registers and/or register blocks to ignore list for uvm_reg_access_seq
   //      Ex: "reg_name"     , // One register at a time
   //      Ex: "reg_name.abc*", // One register field at a time
};

string  uvme_apb_timer_mem_access_ignore_list[$] = '{
   // TODO Add registers and/or register blocks to ignore list for uvm_mem_access_seq
   //      Ex: "reg_name"     , // One register at a time
   //      Ex: "reg_name.abc*", // One register field at a time
};

string  uvme_apb_timer_shared_access_ignore_list[$] = '{
   // TODO Add registers and/or register blocks to ignore list for uvm_reg_mem_shared_access_seq
   //      Ex: "reg_name"     , // One register at a time
   //      Ex: "reg_name.abc*", // One register field at a time
};

string  uvme_apb_timer_mem_walk_access_ignore_list[$] = '{
   // TODO Add registers and/or register blocks to ignore list for uvm_mem_walk_seq
   //      Ex: "reg_name"     , // One register at a time
   //      Ex: "reg_name.abc*", // One register field at a time
};


`endif // __UVME_APB_TIMER_REG_IGNORE_LISTS_SV__
