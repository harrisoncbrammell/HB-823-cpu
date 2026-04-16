// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Apr 15 18:52:02 2026
// Host        : DESKTOP-5V676FB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ block_mem_data_sim_netlist.v
// Design      : block_mem_data
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "block_mem_data,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.51805 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "block_mem_data.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YqH9kwIC39+qbZg4PSfFsXuB9k9wnuxNryS/CfnEri6Ci9fSC6fsrQ/T/hnt3u/yolbJ8DJa1Qu6
Qnm24A9jLbA+fu3Nsmm6/rM6a4vU6OfVl/gTFd/CiWDutv6Dhn6Lim4uUNPahoOR/A2Yc4Zo2tdI
kMLO9gn9WlH2l3O2oXs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XJYO2VHd/cnMxQd3i7/2qRhl57dl+doEKuhAunQyv3vpGRG/jlNxj8PqrgLoF0HMdqE3qJUVE/oq
kBSapqjVjLDMOrNGQ+Tc6VGsKMZH8FE/TXHQJ/IM5Iuiu2eozEwwVUomF+7cfqn+9OsVsqCONQ1M
g0oRlangiqasJDhhMfnlGGqwAwmgWRGQA6dmhTuua1s8zdvIv540zY6p5au8cAKVhqyyKK7wbxEE
SGuFqX+NYoyRV+rfWCcWM+hJEmnWS8LNAKkd13YE2+17sPYzUdZ23DmTxXK6KlAxKFW27CBySUfg
qdNXp2DSs2KAQYih27pBNMuHfGbM/ATFPWFvxg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYoEi/e8HsDTz6N11EDe/B/iitERmeYndlCklmCluwgb0N4W80JUGVlkd7NlRZHRNhxaNBJPkcjC
n61nO0tb17NwsMwjbY5TF8JWRYTNw1JXCFacvQYrdKv4/7QNQEtwVGiCLxFhOA8aHlWMZIrc2fri
VRMVWaEBcPwCGorlVIM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QEw9fEsWFbdX0OQLvYs/gl+zyEOW3ak9TdQVaq+0AXXOT3LIqF7wDxJ6ZBnlf9mNbdsUVH5tAz1o
H8u7ihJl1L3THEvugW+TS8hkvVbEA9rKO2vV15KAj4Lla7UdFT/xDfe79RFarlLI7yGrubjgdoRi
QWy//UKsffG7IWNwmoSuppWiWB4ZHJtkunNyIkm70JPGyZF62VxJg1MTT+5LUbZG5vZjjuHZud9w
xJaKv1tFP/x8RVqLU5gPOqGqTW7/nKO2S+450Vo4D9vAmBVVcXpaL1EbSmCvQ+qJmcQKtf9qYFRV
Zko08hbpHjPxstqvTDro01jRzB8592m4xU2TWA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TC7q853CWBPPJgbRfgDV1lmjUwSAtliljShAyNFg8sfRfwDzchthzoSPH1UCHV++E2JXacEKq1lB
UWsNP92U4Xh0/Gu+6esOI0pJb8I+TRTxyBN1I4cRQEfQHcwfhbSdeH3yX9OV3opLEqYmT37hWU+J
zCawYnxVESI0FtRzEXve9gdEWlrKKckrT/hp4mvxxOjvOkOSQBvy0elgUOqh6mEOZl+JnUbsR+Wm
CoZLE1eefMZy3FnVmyDNPv3JPXi88aLXMyimal0MYFkTiS4XJiGT3eAIMIbksehXY+eYi/KFpZWQ
GHpX+lG3UmiWWLwyPakFwKEHbrBc70AlJ2eV9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9nmCKgjPWNChPbpSW6EWLrMA6oCG2JGPoum8px09v0PEAh0DRXZi0J8HPzXUsZgOEMcKpA7X54u
YFcDDCLAQ+urha/eSPbQYHQh4yGCursxAQ1C6LEyNQ2wJ0eLlO2bJeAl/gof06zqsYVM2lLJVNv5
wao1k2bmgPdfpfY3c9vPD0fSMuZPS41EoRS0cQhO5GTZnKdjxm6tEUL3GnTjB8ynSCIbCJUsMtAX
4FRHNa52gudx5B5fagR+lXgFhE7e++rWTJELr7SYB+r5Es8qZLTpCH8TrQxEkV0rY/+e4sAjNE2D
gHw8GD7VcUtc15B8y1BbVmh29qc8Nd3V2i/miA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UkCD6I/Vye4qNoNoa3hIexBXG3xyKUJPAHAjIo7UcNVCDXpMQiYEtPDqExZMfiPlJn2nswCYIfIJ
FYWqMCloKSQyyI/7yZ2EtbyWEklb/P5IyZyvGi6hhFUo/JFTb12b4bK0gZPr+bCDdlVQKTx5GVHz
wptdUJO2omSj8axVMPbLRRtVzlJIZ29dTJ2ATXVXAcBxPnFfHRAMnYYKLeeLExX61vQvpqrkLQHm
XG7hpVzJi56gYKAzxa2BLq072OCVpVS70bfWlhlSTVcSlCrUf+EcarEk4FD8+Ih2NCvrqremG6yn
TtcBn8Xr8M/6zhOYvLi6AD6eArDMKA8n+Ccv8A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A5y5QVZU8yjPexRVPioSiAGohCHD5DX5FVobuMyhcgQRExLUhPvnnS8HOtxTj/2IapEcz68gFMGG
Hpi+m725u85/om/Vze9pGIW9Mn328Kz2FIg3W5EvGstfGwY+48LiAGAmTR269JS4lJGVYWYOz7Xk
S8cEsFd2m7j8iyKtARJzD90+UdXq/cIIh725jC9i8nbgxB364zddvm1Z/DF3JRw1qFp6GGcuRai1
KNcJ1j8c9wtIgktpsteU3e5+bxHEw8NT3gWXUFYjm00NDq97Jals8Jjktmum2nQxoF7ivPacfEey
gnSF6jRMkTsZObzc30hAhs0CEtc33hZLhPLHSn8pQ0WyvKJLHdd5s2yckgTZtqxC1Sbwe7WEgNXe
ZMX3pIkz+aoXsAL7GBLyVBMVQcyMoF0w8QGAaTe8sqatABwPqXidYRqNROTf62IYcMpV89XYgaTv
EwIn/oni9KOFd2BFVxRZbFGGC4IjvigsTBUijI+Dk6kVnDh240clGcc4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Omtp+lCaqUx7Z4qdFj2zrN8LpCkit2eX4hlMtig+ielGm/x4FSZkpjoFmiqdKFPi2eg0pg09MSai
XyGH68UzAR7Xrj8f1jlIoUmMKp4GcxfdqfTeuu7kWGOJEP6cvgTjSJFj2gawDv7f4yZcltnK2x0L
e4GW/rBTmGvZtKWb2ahjINLxPuh3dDaSaWdb+zVgbtyrI5FrjxBkq+aOxSjyNsqnCx1L0uWbxnkl
88NbXN3dTaECXHNm/fsleayM5hKis7kTv9BFajJMGy+BhQlmIYpE+F5zchnTTFUFJZCz1sX9Fc8e
HcY7irB8mR3ajdzjUZLBQEMktp096Nheq3U75A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpeBLwN9x2ZFDwroYLlUe5GjjDepHik2l0c2s3/6S7JPCRkzQSyt2V1Ad/JewAs/QNp5SXSbYYB4
rQl0My1LDMF3xw43r0g2IbcyHVpPhGp0W5msuQdF67afnsRv90iJYWLMI3QkYGCTWAzl4HrLxFSg
3z8XZRK670IcxznOrlvgHmIKsvubZrBkuc1EynrVb9Nw16QnIx2rc4WgcEXeFf+4i1RoYLDd3gXK
NFCNMdtaRYUThunFP6Z4ViZ5UnDmKq+IMhd31jTaqIlWOBDxPI1+v5RJYxIyTbn4rxlKR2fNbl5/
z4OUjBTd+1GH3I2OXlqmAOvIhpe2Z2HH7nZu/A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mt2RhTSUwEIEWeNARbyL+EdfS1UF6nPaL/fKl/7oO2gina93egwCWDLl1fbBtkfaPco0cu4MJ9K3
OraAsyHRlY+MNShmJ1LzAIA1LjZx4y55lu9dlQqSUXR7AW7wVbkg1864mK+hM/1XygU0jvebKNW9
B7xSER+asLO6pxi0mt7uC2PHxLPAYEszFhmnap82TtbDGdQ2qtyekY+ngs+N2fAdsblxVwJruiMl
e6XJ127M8N1mYwhWU2HtRpBOSnnKoHgD9fG51XK/rhk8DxT66QnX9uLPB+H25eDupBJGi1Y5o6x8
hOwZiSUVlBLh7brfzevh7+eRn+7es6wBas0+3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18992)
`pragma protect data_block
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
G1QM6QkaBZeQM+c=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
