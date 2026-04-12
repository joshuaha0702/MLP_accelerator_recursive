// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Jun 15 20:02:15 2025
// Host        : Jip_desktop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dsp_macro_0_sim_netlist.v
// Design      : dsp_macro_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_macro_0,dsp_macro_v1_0_3,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_3,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [7:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [30:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [31:0]P;

  wire [7:0]A;
  wire [7:0]B;
  wire [30:0]C;
  wire CE;
  wire CLK;
  wire [31:0]P;
  wire SCLR;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "8" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "31" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "128" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000011010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "31" *) 
  (* C_REG_CONFIG = "00000000000000000000000001000000" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_SQUARE_FCN = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dsp_macro_v1_0_3 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C(C),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(CE),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
eXu8CP/59WSryM+0TrJm4ivvR8jHZUvAhTM/3bTefAJXrKDHPLzKye7Mt1lRDbXJAjZ6BIKO4kwC
E0lcvSrV/Q3dyfvAxtUp+z/aW8VJRK9qFHdYmlvgE+RPpMa3xR2aZy6U8Oi3M/l6Zx+25t9AX8je
jkkih0AxnCIBN1VIUqs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vgEvPTqFnqLdQAsx6AXakuctSKMkEG2yHSn4TsDpQk1BrjbzuBtnELewLyu5ZXRBjC8xFsQPW3cH
Ijezov8BDFEzYCheSybl50hwqRI4T0U4N2aoukd55sy9/NN/+A/8Xjl2+g59+0dy6ah8l8JC/qit
l31TRSDYlJTLd1mQWx3tzFmN+bObNeP3maLIbD4XAjkgQ7yM5fP17d00xtU7feiIsq+x7OCl8dNg
Lb6/MRQ7tcASiCzijiw1uXAToCUdMxgwgJod3u1zhviPycgXmq35FZKuwpZjHbl0RDdbj+VG8Bpj
4BU8mxfWb+gvLPK6UlY/G7koaN6b8jABhJx6dA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
AaFM62USO7nm3XNUl+p18THQcjom9piiWV6niKyzDrgB89YGfBopTWrrBST1q+vznrsm1xYeBw0/
aUlMx3aaTJAO5tmM1PHkJSpudvwlb+QPsKCQ1U+sK88kH8wB1yOXWndOr9j1qQOaW7Dl8gr3SftQ
YtUGanmwYxL2tWG2WK8=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
C0y/vEvU9lV6QG7X1OT8SLSXZuemaWEBdXhrUF9kdwmgdFOawTMiM1GmMDMBgOcJHmcZZR/vHgjX
aW6LgUFWwSJBwd8FgrX2GbEx7xC61Ri0fwxzDG1Tns+5KdLl1XOtx/PL/I9GeE1CXetRMzM+s3HS
VC1otl8i826A3YXs41mtZyFqeu6JcfSKsoWmWhVOohan5pR/xouMVA20kBiN3Kl342JzkDM9tofJ
2U1WQM7I0GeX38EB7rx7N9fUUTsAxbMNkY9cSn5jJdADowfYwHWzjyG57462H4HjgFh3vbI4LtAe
iviGzIl6rjHhqn+uDqLNuNsC+sXc5SpfXzaatg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uBCuIthdOfPzzjz/96GbH63rV6HYJnDrLoe2d7Fu1o3WmbYzd75N6ms8Slm+1ppOkleA/O0EIH9E
QWOljNznnEOpJKNmhXFdvz2kcOCdLA/poOcJXyHw9X9dQS+ds2WUpieCP+bbnrQb3dLDH0qoSWMT
eqT/l+07htuRx2NqmQCnQME7OixqYKIuoYm9qnSnyhn6Cx7fTEYRu+oJvkU+/GVZNd73WLsoCf2y
wX3gEXrilulAXUTqCh319fuOfO1JbckH8V1VQwoiTFvFbtgEDQ29w8Vsrlzbo6S4AtwKCMAZHhfD
jQa/oimM1Xz5RgmjOOAj+3upyFgp1v2sx/6dnw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tt7uUpU++Y1HyXw3H9uOZfR0faSHPJDBUNXzHd0A0mMBQSxHBUQO87ix4I9WYmXI78wSRjF0IGHr
xFa3M9/7SVLvNUBeb0SU1jS231rDwgD2G2uwW8g5/9kqE6FLAHLzrl9r3XHmWFv4+FyylrGJ62as
DP0dCDKjxnw5u1IB5Jms6xkS8WgqGubTQ4tnTj8HIqDjyxiBiVHHjftyFeDq/sV4G+yf3GTex00U
eB5JtuT/qI142GJyVmMhLVH0H7FZQDexSTBHYOyRfNRU/4rja0DQ1G1J1hifhyeiB0KxnWMlTibd
LdoZIikRhz8x8iEr4vjsMkdkpAnpQ3PAMy64QA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AB07luaM6UqGzgUh8UuGEePdazMDdWluSYXVevTEENMZocIMfT6+7peiLi2lFLpT1PZHY0SV1bEB
3MGbnC8HTccfBEybpEbQcthgHlVowXAYniz/2Txe8qyOgo32iW3oqkNBI8+3F9ZSPlDg+JFVzIVA
qX6p9OE5OdkLviZr3HhrGHnr09iaLa0pojKY4jFq+7VRqBz023vKkoYVs0PjJfI6INZ1/WQImSWb
jFYp9N/v0u9E/ihSNdJ7cHFaC7K6PApgCrr3WdKb4sDwuHAEo2YBL+RafV+/bjhXcb36+8fi+Ihp
bOs+vnNa/kMivBt4zh4pkIiWe+NoICqV2/ie5g==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
VBFfqhMRFT4vkmBP645Vb+B3Zb1lr1J3v1UU437hv44KR/OBhVQry6ZFwQmnE4IL8RDeLg0D2tkZ
+Gq6ejrRmUJtMhB7DcRs1bi5keF43hsgq5wg0KTBhh3yUyQJp2rwUcd3hZ940AXSavn+1xjGlJLz
UeHKKlF6m3CSmvReobaVea9RaUO0WwDXmnf/lbeCObhOgaYEBceQjk/5E4hT/c0y8RPW7tDdF2yo
u8/2q5ioXWJ1FseteaZwdHICpZUYihFMiyZHYshN2G9zQtp4k87huvEBbFWggT9c6s3Lee8qIdsH
BXt0uVwINMMM1li7PiKl8l1URiX178BSIcGzdM0ZwSyAyO6i/qWiFsr7cCD1jcwDxUH+rVizdYBx
wfhtDxWf01qjpq13uUUqxxB+xMf58l+wpjFCLmKMgpNYs0S33SG6R8fvJ3IPvJHhVRc/hPupWbcK
hezSkYXnupL+GdSPxPoQZJW7/k8leEwuDKBO/VCfQpPXQR+FxLDNFBDe

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ao2uzJ9cDoOFb4Q+cT2/6EJRN9VWvURi+To0IoDU4YLe3Dr0WyVOAUCUIhb3Y8swY+CKwa+eJzzm
AriAJZAp9p8NujF4gOv+y4wy+eanf3pnOWbMWxsr6TT2S39coNdQ+NAO4aBUP3ZbESI4AbXpCTKA
+KV2gtFESo654X+tD0UNAabhx5OJpkBawo8534pIFBCYn70xDogKM4jXqTVCDr0CleLmgeIOYdIO
5T48N/bB3mluyuxS/Ea1/kS2r1g49hjIWlYnMkQ27NaUI1xAJTAjkrvMTHEKoSIskGvfO6jSWVlF
19HXSOkKJMQeQ0I6TBJ0H1KwHX8XwIuipvGDhg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Vsc9DrGpNf/QUtBLAFWvpuejhZo7A/NlxBRu0QXrx79KXU+CwS9U10fzPZUIXx67A4LW63t0ANDz
MKT8efKaE09nANawuJVnQxQ6LSAUbMLLKd9/6Kzy/hgi0h+GETObWQJkSEZJ+WZsrhofT03H4IBP
RcntX3mOYXMi51O+Um8rmHblcMeeRXex0luDAlLfX4xA0TNwLSRpR9aRQFXoB6KnqiChACqooRVz
N97G0k3b3ddbqLtFwh5sHVvrCP47WDnJMPCvPkyPvo7Ebs/xLgtoJw2bOZX6RMTnFurqk8ZMrzhQ
bb6wJVjKjW5mNsQHry+pM4v+5Q+pVnTEdw/84A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JhnJCjGYv5OasXDl+Bm+6DRwfZS2hgzUucWmDHkywIgaYeHcF6kl0sy8m4gxEBi2+63hD+aTUDYm
nUJM0nE5I/35fN8GEA1dufkbg7MKqw5qxqXUzVD2LHmEh8ECdJv3xPjAqooNZBiYmLQt2oTvrO5C
PeX3xCmF0nP1da0Z+veW4FNOK6ZiSl1UJSTiPA3kKGEkrVe6zdFJM26Mkjch9z7S82RTuml3Mcv/
Dq/8WlDw+w/enEwuaHk/T+qdVQkAL4rJQoBB52ahsdcYT2BwKTi/mL92NJYBXU7QFFPsUtyA80t+
cEoO7mjbWRKcLUa3im7Y7+uFlCO258ftuISJFQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 26672)
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
