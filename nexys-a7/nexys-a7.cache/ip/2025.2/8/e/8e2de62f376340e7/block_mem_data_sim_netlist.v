// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Apr 15 18:59:59 2026
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
Kbod+4biMwICFWAyD2Y+CnG8Geu03M+1
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
