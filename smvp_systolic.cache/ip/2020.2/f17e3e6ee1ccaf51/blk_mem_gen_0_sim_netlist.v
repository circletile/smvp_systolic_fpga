// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Apr 17 00:34:53 2021
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [6:0]addra;
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
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.54005 mW" *) 
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
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
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
  (* C_WRITE_DEPTH_A = "128" *) 
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20544)
`pragma protect data_block
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
GXJpxqOPVd4z6dhxVX5sJeH5ujMiHOJ0
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
