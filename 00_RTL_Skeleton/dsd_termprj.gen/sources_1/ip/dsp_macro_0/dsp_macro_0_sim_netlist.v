// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Jun 15 20:02:17 2025
// Host        : Jip_desktop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/joshu/Documents/DSD25_Termproject_Materials_Updated250519/00_RTL_Skeleton/dsd_termprj.gen/sources_1/ip/dsp_macro_0/dsp_macro_0_sim_netlist.v
// Design      : dsp_macro_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_macro_0,dsp_macro_v1_0_3,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_3,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module dsp_macro_0
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
  dsp_macro_0_dsp_macro_v1_0_3 U0
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
h0GLwHMaADxW1EE+9ResUPfDel/9XIYxQbtRCA+hsl7QQVezwMoihYzUAxQN3B+CkCPaY0DDtcec
ZlBSyL1ak7Ts8urvVdEr1OG5LPyJsijHUgJHZuvYHf+JyWPGqfLNQIWGD0L2dURY2/QP0eXGghiw
YdNwUA/44p5Ho1/IB63cOUFk94KXnJyGc6WDKJVHRzssVspN9HdMGkQMmMRE8sv5cx4HP35Qumt1
saOeD5wntlRTSCopeNfAyz/WFEIUAq5pEgb6Ecph13NCr4XJt/+R2ZbiFt5JQrf796rybvsXTd+m
Qbzc+i2gs03eAd+3n2+XRIfSSnaxnNRdRjwnrA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tTPMytvJXI27cDbNe0M9YZBZsCseCw9R5DZmBhfZV/Y2diWaRoCbFsMv/ePDMoOmBSTkqumN4f0o
ANts84rcsOmuyfezfVOTgzi4yQyStBrAQmmErxzKkLeS7VvRXTxd0KObQZyp1W45VCK0kY0ZWGma
8hcDSL8ZMOhTBlKDkwJH+sFsf7EvYjAqpqVetD31rmvCxpjh1m8QkoYZHOQKNiQKAhb/F5jV3djf
2xeSxO0KU5PoQ8JCHdHTx14kWDe+kSPdfcELCkLX5hnwalNMsGjTxxhb59TuRXJlbV/3PRjgZ9g5
A3Yo8+Q4bS8+OXEmemwKrT1/wJP6iLfMH8FKOA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 26640)
`pragma protect data_block
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
/whh+Rm5HLgczekMsS4tK7+qniBU
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
