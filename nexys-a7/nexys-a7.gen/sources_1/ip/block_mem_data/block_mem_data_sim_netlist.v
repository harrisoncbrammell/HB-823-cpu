// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Apr 15 19:00:00 2026
// Host        : DESKTOP-5V676FB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Development/School/computer_arch/cpu_project/nexys-a7/nexys-a7.gen/sources_1/ip/block_mem_data/block_mem_data_sim_netlist.v
// Design      : block_mem_data
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "block_mem_data,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module block_mem_data
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
  block_mem_data_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18704)
`pragma protect data_block
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
JF0MmqEvkZg=
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
