// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Apr 17 00:47:40 2021
// Host        : CCB-011 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
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
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3396 mW" *) 
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
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18416)
`pragma protect data_block
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
stM98Gg=
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
