// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Apr 17 00:47:40 2021
// Host        : CCB-011 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Documents/Vivado/Basys3/Projects/smvp_systolic/smvp_systolic.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
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
  blk_mem_gen_0_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18400)
`pragma protect data_block
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
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
