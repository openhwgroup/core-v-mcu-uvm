// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_REG_IGNORE_LISTS_SV__
`define __UVME_CVMCU_CHIP_REG_IGNORE_LISTS_SV__


string  uvme_cvmcu_chip_all_reg_mem_ignore_list[$] = '{
};

string  uvme_cvmcu_chip_reg_hw_reset_ignore_list[$] = '{
};

string  uvme_cvmcu_chip_reg_bit_bash_ignore_list[$] = '{
   "timer.cfg_reg_low.mode_64_bit",
   "timer.cfg_reg_low.mode_mtime_bit",
   "timer.cfg_reg_low.prescaler_count",
   "timer.cfg_reg_low.ref_clk_en_bit",
   "timer.cfg_reg_low.prescaler_en_bit",
   "timer.cfg_reg_low.one_shot_bit",
   "timer.cfg_reg_low.cmp_clr_bit",
   "timer.cfg_reg_low.iem_bit",
   "timer.cfg_reg_low.irq_bit",
   "timer.cfg_reg_low.reset_bit",
   "timer.cfg_reg_low.enable_bit",
   "timer.cfg_reg_hi.mode_64_bit",
   "timer.cfg_reg_hi.mode_mtime_bit",
   "timer.cfg_reg_hi.prescaler_count",
   "timer.cfg_reg_hi.ref_clk_en_bit",
   "timer.cfg_reg_hi.prescaler_en_bit",
   "timer.cfg_reg_hi.one_shot_bit",
   "timer.cfg_reg_hi.cmp_clr_bit",
   "timer.cfg_reg_hi.iem_bit",
   "timer.cfg_reg_hi.irq_bit",
   "timer.cfg_reg_hi.reset_bit",
   "timer.cfg_reg_hi.enable_bit",
   "gpio.rdstat.mode",
   "gpio.rdstat.inttype",
   "gpio.rdstat.inten",
   "gpio.rdstat.input_val",
   "gpio.rdstat.output_val",
   "gpio.rdstat.gpio_sel",
   "uart0.rx_saddr.saddr",
   "uart0.rx_size.size",
   "uart0.rx_cfg.clear",
   "uart0.rx_cfg.pending",
   "uart0.rx_cfg.en",
   "uart0.rx_cfg.continuous",
   "uart0.tx_saddr.saddr",
   "uart0.tx_size.size",
   "uart0.tx_cfg.clr",
   "uart0.tx_cfg.pending",
   "uart0.tx_cfg.en",
   "uart0.tx_cfg.continuous",
   "uart1.rx_saddr.saddr",
   "uart1.rx_size.size",
   "uart1.rx_cfg.clear",
   "uart1.rx_cfg.pending",
   "uart1.rx_cfg.en",
   "uart1.rx_cfg.continuous",
   "uart1.tx_saddr.saddr",
   "uart1.tx_size.size",
   "uart1.tx_cfg.clr",
   "uart1.tx_cfg.pending",
   "uart1.tx_cfg.en",
   "uart1.tx_cfg.continuous"
};

string  uvme_cvmcu_chip_reg_access_ignore_list[$] = '{
};

string  uvme_cvmcu_chip_mem_access_ignore_list[$] = '{
};

string  uvme_cvmcu_chip_shared_access_ignore_list[$] = '{
};

string  uvme_cvmcu_chip_mem_walk_access_ignore_list[$] = '{
};


`endif // __UVME_CVMCU_CHIP_REG_IGNORE_LISTS_SV__