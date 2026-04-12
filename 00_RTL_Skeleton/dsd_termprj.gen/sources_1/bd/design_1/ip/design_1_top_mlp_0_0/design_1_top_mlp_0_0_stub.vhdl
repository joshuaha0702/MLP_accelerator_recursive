-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Sun Jun 15 22:09:55 2025
-- Host        : Jip_desktop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/joshu/Documents/DSD25_Termproject_Materials_Updated250519/00_RTL_Skeleton/dsd_termprj.gen/sources_1/bd/design_1/ip/design_1_top_mlp_0_0/design_1_top_mlp_0_0_stub.vhdl
-- Design      : design_1_top_mlp_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_top_mlp_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    start_i : in STD_LOGIC;
    done_intr_o : out STD_LOGIC;
    done_led_o : out STD_LOGIC;
    y_buf_en : out STD_LOGIC;
    y_buf_wr_en : out STD_LOGIC;
    y_buf_addr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    y_buf_data : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end design_1_top_mlp_0_0;

architecture stub of design_1_top_mlp_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,start_i,done_intr_o,done_led_o,y_buf_en,y_buf_wr_en,y_buf_addr[8:0],y_buf_data[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "top_mlp,Vivado 2023.1";
begin
end;
