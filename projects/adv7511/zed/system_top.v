// ***************************************************************************
// ***************************************************************************
// Copyright 2011(c) Analog Devices, Inc.
// 
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//     - Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     - Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in
//       the documentation and/or other materials provided with the
//       distribution.
//     - Neither the name of Analog Devices, Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//     - The use of this software may or may not infringe the patent rights
//       of one or more patent holders.  This license does not release you
//       from the requirement that you obtain separate licenses from these
//       patent holders to use this software.
//     - Use of the software either in source or binary form, must be run
//       on or directly connected to an Analog Devices Inc. component.
//    
// THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE ARE DISCLAIMED.
//
// IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, INTELLECTUAL PROPERTY
// RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module system_top (

  DDR_addr,
  DDR_ba,
  DDR_cas_n,
  DDR_ck_n,
  DDR_ck_p,
  DDR_cke,
  DDR_cs_n,
  DDR_dm,
  DDR_dq,
  DDR_dqs_n,
  DDR_dqs_p,
  DDR_odt,
  DDR_ras_n,
  DDR_reset_n,
  DDR_we_n,

  FIXED_IO_ddr_vrn,
  FIXED_IO_ddr_vrp,
  FIXED_IO_mio,
  FIXED_IO_ps_clk,
  FIXED_IO_ps_porb,
  FIXED_IO_ps_srstb,

  gpio_bd,

  hdmi_out_clk,
  hdmi_vsync,
  hdmi_hsync,
  hdmi_data_e,
  hdmi_data,

  i2s_mclk,
  i2s_bclk,
  i2s_lrclk,
  i2s_sdata_out,
  i2s_sdata_in,

  spdif,

  iic_scl,
  iic_sda,
  iic_mux_scl,
  iic_mux_sda,

  otg_vbusoc,

  //the following code is newly added
  phy_rst_n_0,
  mdio_0_io,
  mdio_0_mdc,
  mdio_1_io,                    
  mdio_1_mdc,
  mdio_2_io,
  mdio_2_mdc,
  mdio_3_io,
  mdio_3_mdc,
  rgmii_0_rd,
  rgmii_0_rx_ctl,
  rgmii_0_rxc,
  rgmii_0_td,
  rgmii_0_tx_ctl,
  rgmii_0_txc,
  rgmii_1_rd,
  rgmii_1_rx_ctl,
  rgmii_1_rxc,
  rgmii_1_td,
  rgmii_1_tx_ctl,
  rgmii_1_txc,
  rgmii_2_rd,
  rgmii_2_rx_ctl,
  rgmii_2_rxc,
  rgmii_2_td,
  rgmii_2_tx_ctl,
  rgmii_2_txc,
  rgmii_3_rd,
  rgmii_3_rx_ctl,
  rgmii_3_rxc,
  rgmii_3_td,
  rgmii_3_tx_ctl,
  rgmii_3_txc,
  btn_rst_n
  );

  inout   [14:0]  DDR_addr;
  inout   [ 2:0]  DDR_ba;
  inout           DDR_cas_n;
  inout           DDR_ck_n;
  inout           DDR_ck_p;
  inout           DDR_cke;
  inout           DDR_cs_n;
  inout   [ 3:0]  DDR_dm;
  inout   [31:0]  DDR_dq;
  inout   [ 3:0]  DDR_dqs_n;
  inout   [ 3:0]  DDR_dqs_p;
  inout           DDR_odt;
  inout           DDR_ras_n;
  inout           DDR_reset_n;
  inout           DDR_we_n;

  inout           FIXED_IO_ddr_vrn;
  inout           FIXED_IO_ddr_vrp;
  inout   [53:0]  FIXED_IO_mio;
  inout           FIXED_IO_ps_clk;
  inout           FIXED_IO_ps_porb;
  inout           FIXED_IO_ps_srstb;

  inout   [31:0]  gpio_bd;

  output          hdmi_out_clk;
  output          hdmi_vsync;
  output          hdmi_hsync;
  output          hdmi_data_e;
  output  [15:0]  hdmi_data;

  output          spdif;

  output          i2s_mclk;
  output          i2s_bclk;
  output          i2s_lrclk;
  output          i2s_sdata_out;
  input           i2s_sdata_in;


  inout           iic_scl;
  inout           iic_sda;
  inout   [ 1:0]  iic_mux_scl;
  inout   [ 1:0]  iic_mux_sda;

  input           otg_vbusoc;

  //the following code is newly added
  output          phy_rst_n_0;
  inout           mdio_0_io;
  output          mdio_0_mdc;
  inout           mdio_1_io;
  output          mdio_1_mdc;
  inout           mdio_2_io;
  output          mdio_2_mdc;
  inout           mdio_3_io;
  output          mdio_3_mdc;
  input   [3:0]   rgmii_0_rd;
  input           rgmii_0_rx_ctl;
  input           rgmii_0_rxc;
  output  [3:0]   rgmii_0_td;
  output          rgmii_0_tx_ctl;
  output          rgmii_0_txc;
  input   [3:0]   rgmii_1_rd;
  input           rgmii_1_rx_ctl;
  input           rgmii_1_rxc;
  output  [3:0]   rgmii_1_td;
  output          rgmii_1_tx_ctl;
  output          rgmii_1_txc;
  input   [3:0]   rgmii_2_rd;
  input           rgmii_2_rx_ctl;
  input           rgmii_2_rxc;
  output  [3:0]   rgmii_2_td;
  output          rgmii_2_tx_ctl;
  output          rgmii_2_txc;
  input   [3:0]   rgmii_3_rd;
  input           rgmii_3_rx_ctl;
  input           rgmii_3_rxc;
  output  [3:0]   rgmii_3_td;
  output          rgmii_3_tx_ctl;
  output          rgmii_3_txc;
  input           btn_rst_n;

  // internal signals

  wire    [31:0]  gpio_i;
  wire    [31:0]  gpio_o;
  wire    [31:0]  gpio_t;
  wire    [ 1:0]  iic_mux_scl_i_s;
  wire    [ 1:0]  iic_mux_scl_o_s;
  wire            iic_mux_scl_t_s;
  wire    [ 1:0]  iic_mux_sda_i_s;
  wire    [ 1:0]  iic_mux_sda_o_s;
  wire            iic_mux_sda_t_s;

  // instantiations

  genvar n;
  generate
  for (n = 0; n <= 31; n = n + 1) begin: g_iobuf_gpio_bd
  IOBUF i_iobuf_gpio_bd (
    .I (gpio_o[n]),
    .O (gpio_i[n]),
    .T (gpio_t[n]),
    .IO (gpio_bd[n]));
  end
  endgenerate

  IOBUF i_iic_mux_scl_0 (.I(iic_mux_scl_o_s[0]), .O(iic_mux_scl_i_s[0]), .T(iic_mux_scl_t_s), .IO(iic_mux_scl[0]));
  IOBUF i_iic_mux_scl_1 (.I(iic_mux_scl_o_s[1]), .O(iic_mux_scl_i_s[1]), .T(iic_mux_scl_t_s), .IO(iic_mux_scl[1]));
  IOBUF i_iic_mux_sda_0 (.I(iic_mux_sda_o_s[0]), .O(iic_mux_sda_i_s[0]), .T(iic_mux_sda_t_s), .IO(iic_mux_sda[0]));
  IOBUF i_iic_mux_sda_1 (.I(iic_mux_sda_o_s[1]), .O(iic_mux_sda_i_s[1]), .T(iic_mux_sda_t_s), .IO(iic_mux_sda[1]));

  system_wrapper i_system_wrapper (
    .DDR_addr (DDR_addr),
    .DDR_ba (DDR_ba),
    .DDR_cas_n (DDR_cas_n),
    .DDR_ck_n (DDR_ck_n),
    .DDR_ck_p (DDR_ck_p),
    .DDR_cke (DDR_cke),
    .DDR_cs_n (DDR_cs_n),
    .DDR_dm (DDR_dm),
    .DDR_dq (DDR_dq),
    .DDR_dqs_n (DDR_dqs_n),
    .DDR_dqs_p (DDR_dqs_p),
    .DDR_odt (DDR_odt),
    .DDR_ras_n (DDR_ras_n),
    .DDR_reset_n (DDR_reset_n),
    .DDR_we_n (DDR_we_n),
    .FIXED_IO_ddr_vrn (FIXED_IO_ddr_vrn),
    .FIXED_IO_ddr_vrp (FIXED_IO_ddr_vrp),
    .FIXED_IO_mio (FIXED_IO_mio),
    .FIXED_IO_ps_clk (FIXED_IO_ps_clk),
    .FIXED_IO_ps_porb (FIXED_IO_ps_porb),
    .FIXED_IO_ps_srstb (FIXED_IO_ps_srstb),
    .GPIO_I (gpio_i),
    .GPIO_O (gpio_o),
    .GPIO_T (gpio_t),
    .hdmi_data (hdmi_data),
    .hdmi_data_e (hdmi_data_e),
    .hdmi_hsync (hdmi_hsync),
    .hdmi_out_clk (hdmi_out_clk),
    .hdmi_vsync (hdmi_vsync),
    .i2s_bclk (i2s_bclk),
    .i2s_lrclk (i2s_lrclk),
    .i2s_mclk (i2s_mclk),
    .i2s_sdata_in (i2s_sdata_in),
    .i2s_sdata_out (i2s_sdata_out),
    .iic_fmc_scl_io (iic_scl),
    .iic_fmc_sda_io (iic_sda),
    .iic_mux_scl_I (iic_mux_scl_i_s),
    .iic_mux_scl_O (iic_mux_scl_o_s),
    .iic_mux_scl_T (iic_mux_scl_t_s),
    .iic_mux_sda_I (iic_mux_sda_i_s),
    .iic_mux_sda_O (iic_mux_sda_o_s),
    .iic_mux_sda_T (iic_mux_sda_t_s),
    .otg_vbusoc (otg_vbusoc),
    .spdif (spdif),
    //the following code is newly added
  .mdio_0_io       (mdio_0_io       ),
  .mdio_0_mdc      (mdio_0_mdc      ),
  .mdio_1_io       (mdio_1_io       ),
  .mdio_1_mdc      (mdio_1_mdc      ),
  .mdio_2_io       (mdio_2_io       ),
  .mdio_2_mdc      (mdio_2_mdc      ),
  .mdio_3_io       (mdio_3_io       ),
  .mdio_3_mdc      (mdio_3_mdc      ),
  .phy_rst_n_0     (phy_rst_n_0),
  .phy_rst_n_1     (),
  .phy_rst_n_2     (),
  .phy_rst_n_3     (),
  .rgmii_0_rd      (rgmii_0_rd      ),
  .rgmii_0_rx_ctl  (rgmii_0_rx_ctl  ),
  .rgmii_0_rxc     (rgmii_0_rxc     ),
  .rgmii_0_td      (rgmii_0_td      ),
  .rgmii_0_tx_ctl  (rgmii_0_tx_ctl  ),
  .rgmii_0_txc     (rgmii_0_txc     ),
  .rgmii_1_rd      (rgmii_1_rd      ),
  .rgmii_1_rx_ctl  (rgmii_1_rx_ctl  ),
  .rgmii_1_rxc     (rgmii_1_rxc     ),
  .rgmii_1_td      (rgmii_1_td      ),
  .rgmii_1_tx_ctl  (rgmii_1_tx_ctl  ),
  .rgmii_1_txc     (rgmii_1_txc     ),
  .rgmii_2_rd      (rgmii_2_rd      ),
  .rgmii_2_rx_ctl  (rgmii_2_rx_ctl  ),
  .rgmii_2_rxc     (rgmii_2_rxc     ),
  .rgmii_2_td      (rgmii_2_td      ),
  .rgmii_2_tx_ctl  (rgmii_2_tx_ctl  ),
  .rgmii_2_txc     (rgmii_2_txc     ),
  .rgmii_3_rd      (rgmii_3_rd      ),
  .rgmii_3_rx_ctl  (rgmii_3_rx_ctl  ),
  .rgmii_3_rxc     (rgmii_3_rxc     ),
  .rgmii_3_td      (rgmii_3_td      ),
  .rgmii_3_tx_ctl  (rgmii_3_tx_ctl  ),
  .rgmii_3_txc     (rgmii_3_txc     ),
  .ext_rst         (1'b0)
);

endmodule

// ***************************************************************************
// ***************************************************************************
