// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Apr  8 18:31:35 2025
// Host        : DESKTOP-34C1KEP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2022.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe_in0, probe_in1, probe_in2, probe_in3, 
  probe_in4, probe_in5, probe_in6, probe_in7, probe_out0, probe_out1)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[15:0],probe_in1[5:0],probe_in2[1:0],probe_in3[3:0],probe_in4[15:0],probe_in5[15:0],probe_in6[15:0],probe_in7[3:0],probe_out0[15:0],probe_out1[0:0]" */;
  input clk;
  input [15:0]probe_in0;
  input [5:0]probe_in1;
  input [1:0]probe_in2;
  input [3:0]probe_in3;
  input [15:0]probe_in4;
  input [15:0]probe_in5;
  input [15:0]probe_in6;
  input [3:0]probe_in7;
  output [15:0]probe_out0;
  output [0:0]probe_out1;
endmodule
