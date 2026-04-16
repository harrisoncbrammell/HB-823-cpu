// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Apr 15 18:47:59 2026
// Host        : DESKTOP-5V676FB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.57205 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
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
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
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
        .ena(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18720)
`pragma protect data_block
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
MEWDujxga412zz5eOqSoWwD8wHgq3jX5
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
