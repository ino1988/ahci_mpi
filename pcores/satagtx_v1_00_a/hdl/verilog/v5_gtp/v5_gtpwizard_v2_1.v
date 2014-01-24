//////////////////////////////////////////////////////////////////////////////
//$Date: 2009/11/26 05:47:37 $
//$Revision: 1.1 $
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /
// \   \   \/     Vendor : Xilinx
//  \   \         Version : 2.1
//  /   /         Application : Rocketio GTP Transceiver Wizard
// /___/   /\     Filename : v5_gtpwizard_v2_1.v
// \   \  /  \
//  \___\/\___\
//
//
// Module V5_GTPWIZARD_V2_1 (a GTP Wrapper)
// Generated by Xilinx Rocketio GTP Transceiver Wizard
// 
// 
// (c) Copyright 2006-2010 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 



`timescale 1ns / 1ps


//***************************** Entity Declaration ****************************

module V5_GTPWIZARD_V2_1 #
(
    // Simulation attributes
    parameter   WRAPPER_SIM_MODE                = "FAST",   // Set to Fast Functional Simulation Model    
    parameter   WRAPPER_SIM_GTPRESET_SPEEDUP    = 0,    // Set to 1 to speed up sim reset
    parameter   WRAPPER_SIM_PLL_PERDIV2         = 9'h14d   // Set to the VCO Unit Interval time    
)
(
    
    //_________________________________________________________________________
    //_________________________________________________________________________
    //TILE0  (Location)

    //---------------------- Loopback and Powerdown Ports ----------------------
    TILE0_LOOPBACK0_IN,
    TILE0_LOOPBACK1_IN,
    //--------------------- Receive Ports - 8b10b Decoder ----------------------
    TILE0_RXCHARISCOMMA0_OUT,
    TILE0_RXCHARISCOMMA1_OUT,
    TILE0_RXCHARISK0_OUT,
    TILE0_RXCHARISK1_OUT,
    TILE0_RXDISPERR0_OUT,
    TILE0_RXDISPERR1_OUT,
    TILE0_RXNOTINTABLE0_OUT,
    TILE0_RXNOTINTABLE1_OUT,
    //----------------- Receive Ports - Clock Correction Ports -----------------
    TILE0_RXCLKCORCNT0_OUT,
    TILE0_RXCLKCORCNT1_OUT,
    //------------- Receive Ports - Comma Detection and Alignment --------------
    TILE0_RXBYTEISALIGNED0_OUT,
    TILE0_RXBYTEISALIGNED1_OUT,
    TILE0_RXENMCOMMAALIGN0_IN,
    TILE0_RXENMCOMMAALIGN1_IN,
    TILE0_RXENPCOMMAALIGN0_IN,
    TILE0_RXENPCOMMAALIGN1_IN,
    //----------------- Receive Ports - RX Data Path interface -----------------
    TILE0_RXDATA0_OUT,
    TILE0_RXDATA1_OUT,
    TILE0_RXRESET0_IN,
    TILE0_RXRESET1_IN,
    TILE0_RXUSRCLK0_IN,
    TILE0_RXUSRCLK1_IN,
    TILE0_RXUSRCLK20_IN,
    TILE0_RXUSRCLK21_IN,
    //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    TILE0_RXELECIDLE0_OUT,
    TILE0_RXELECIDLE1_OUT,
    TILE0_RXEQMIX0_IN,
    TILE0_RXEQMIX1_IN,
    TILE0_RXEQPOLE0_IN,
    TILE0_RXEQPOLE1_IN,
    TILE0_RXN0_IN,
    TILE0_RXN1_IN,
    TILE0_RXP0_IN,
    TILE0_RXP1_IN,
    //------ Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    TILE0_RXSTATUS0_OUT,
    TILE0_RXSTATUS1_OUT,
    //------------------- Shared Ports - Tile and PLL Ports --------------------
    TILE0_CLKIN_IN,
    TILE0_GTPRESET_IN,
    TILE0_PLLLKDET_OUT,
    TILE0_REFCLKOUT_OUT,
    TILE0_RESETDONE0_OUT,
    TILE0_RESETDONE1_OUT,
    TILE0_TXENPMAPHASEALIGN_IN,
    TILE0_TXPMASETPHASE_IN,
    //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    TILE0_TXCHARISK0_IN,
    TILE0_TXCHARISK1_IN,
    //---------------- Transmit Ports - TX Data Path interface -----------------
    TILE0_TXDATA0_IN,
    TILE0_TXDATA1_IN,
    TILE0_TXRESET0_IN,
    TILE0_TXRESET1_IN,
    TILE0_TXUSRCLK0_IN,
    TILE0_TXUSRCLK1_IN,
    TILE0_TXUSRCLK20_IN,
    TILE0_TXUSRCLK21_IN,
    //------------- Transmit Ports - TX Driver and OOB signalling --------------
    TILE0_TXDIFFCTRL0_IN,
    TILE0_TXDIFFCTRL1_IN,
    TILE0_TXN0_OUT,
    TILE0_TXN1_OUT,
    TILE0_TXP0_OUT,
    TILE0_TXP1_OUT,
    //--------------- Transmit Ports - TX Ports for PCI Express ----------------
    TILE0_TXELECIDLE0_IN,
    TILE0_TXELECIDLE1_IN,
    //------------------- Transmit Ports - TX Ports for SATA -------------------
    TILE0_TXCOMSTART0_IN,
    TILE0_TXCOMSTART1_IN,
    TILE0_TXCOMTYPE0_IN,
    TILE0_TXCOMTYPE1_IN,
 gtp_dbg

);

// synthesis attribute X_CORE_INFO of V5_GTPWIZARD_V2_1 is "v5_gtpwizard_v2_1, Coregen v12.1";

//***************************** Port Declarations *****************************
        


    //_________________________________________________________________________
    //_________________________________________________________________________
    //TILE0  (Location)

    //---------------------- Loopback and Powerdown Ports ----------------------
    input   [2:0]   TILE0_LOOPBACK0_IN;
    input   [2:0]   TILE0_LOOPBACK1_IN;
    //--------------------- Receive Ports - 8b10b Decoder ----------------------
    output  [1:0]   TILE0_RXCHARISCOMMA0_OUT;
    output  [1:0]   TILE0_RXCHARISCOMMA1_OUT;
    output  [1:0]   TILE0_RXCHARISK0_OUT;
    output  [1:0]   TILE0_RXCHARISK1_OUT;
    output  [1:0]   TILE0_RXDISPERR0_OUT;
    output  [1:0]   TILE0_RXDISPERR1_OUT;
    output  [1:0]   TILE0_RXNOTINTABLE0_OUT;
    output  [1:0]   TILE0_RXNOTINTABLE1_OUT;
    //----------------- Receive Ports - Clock Correction Ports -----------------
    output  [2:0]   TILE0_RXCLKCORCNT0_OUT;
    output  [2:0]   TILE0_RXCLKCORCNT1_OUT;
    //------------- Receive Ports - Comma Detection and Alignment --------------
    output          TILE0_RXBYTEISALIGNED0_OUT;
    output          TILE0_RXBYTEISALIGNED1_OUT;
    input           TILE0_RXENMCOMMAALIGN0_IN;
    input           TILE0_RXENMCOMMAALIGN1_IN;
    input           TILE0_RXENPCOMMAALIGN0_IN;
    input           TILE0_RXENPCOMMAALIGN1_IN;
    //----------------- Receive Ports - RX Data Path interface -----------------
    output  [15:0]  TILE0_RXDATA0_OUT;
    output  [15:0]  TILE0_RXDATA1_OUT;
    input           TILE0_RXRESET0_IN;
    input           TILE0_RXRESET1_IN;
    input           TILE0_RXUSRCLK0_IN;
    input           TILE0_RXUSRCLK1_IN;
    input           TILE0_RXUSRCLK20_IN;
    input           TILE0_RXUSRCLK21_IN;
    //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    output          TILE0_RXELECIDLE0_OUT;
    output          TILE0_RXELECIDLE1_OUT;
    input   [1:0]   TILE0_RXEQMIX0_IN;
    input   [1:0]   TILE0_RXEQMIX1_IN;
    input   [3:0]   TILE0_RXEQPOLE0_IN;
    input   [3:0]   TILE0_RXEQPOLE1_IN;
    input           TILE0_RXN0_IN;
    input           TILE0_RXN1_IN;
    input           TILE0_RXP0_IN;
    input           TILE0_RXP1_IN;
    //------ Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    output  [2:0]   TILE0_RXSTATUS0_OUT;
    output  [2:0]   TILE0_RXSTATUS1_OUT;
    //------------------- Shared Ports - Tile and PLL Ports --------------------
    input           TILE0_CLKIN_IN;
    input           TILE0_GTPRESET_IN;
    output          TILE0_PLLLKDET_OUT;
    output          TILE0_REFCLKOUT_OUT;
    output          TILE0_RESETDONE0_OUT;
    output          TILE0_RESETDONE1_OUT;
    input           TILE0_TXENPMAPHASEALIGN_IN;
    input           TILE0_TXPMASETPHASE_IN;
    //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    input   [1:0]   TILE0_TXCHARISK0_IN;
    input   [1:0]   TILE0_TXCHARISK1_IN;
    //---------------- Transmit Ports - TX Data Path interface -----------------
    input   [15:0]  TILE0_TXDATA0_IN;
    input   [15:0]  TILE0_TXDATA1_IN;
    input           TILE0_TXRESET0_IN;
    input           TILE0_TXRESET1_IN;
    input           TILE0_TXUSRCLK0_IN;
    input           TILE0_TXUSRCLK1_IN;
    input           TILE0_TXUSRCLK20_IN;
    input           TILE0_TXUSRCLK21_IN;
    //------------- Transmit Ports - TX Driver and OOB signalling --------------
    input   [2:0]   TILE0_TXDIFFCTRL0_IN;
    input   [2:0]   TILE0_TXDIFFCTRL1_IN;
    output          TILE0_TXN0_OUT;
    output          TILE0_TXN1_OUT;
    output          TILE0_TXP0_OUT;
    output          TILE0_TXP1_OUT;
    //--------------- Transmit Ports - TX Ports for PCI Express ----------------
    input           TILE0_TXELECIDLE0_IN;
    input           TILE0_TXELECIDLE1_IN;
    //------------------- Transmit Ports - TX Ports for SATA -------------------
    input           TILE0_TXCOMSTART0_IN;
    input           TILE0_TXCOMSTART1_IN;
    input           TILE0_TXCOMTYPE0_IN;
    input           TILE0_TXCOMTYPE1_IN;
   output [127:0]   gtp_dbg;
   



//***************************** Wire Declarations *****************************

    // Channel Bonding Signals


    // ground and vcc signals
    wire            tied_to_ground_i;
    wire    [63:0]  tied_to_ground_vec_i;
    wire            tied_to_vcc_i;
    wire    [63:0]  tied_to_vcc_vec_i;
    

//********************************* Main Body of Code**************************

    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;
    

    //------------------------- Tile Instances  -------------------------------   



    //_________________________________________________________________________
    //_________________________________________________________________________
    //TILE0  (Location)

    V5_GTPWIZARD_V2_1_TILE #
    (
        // Simulation attributes
        .TILE_SIM_MODE               (WRAPPER_SIM_MODE),
        .TILE_SIM_GTPRESET_SPEEDUP   (WRAPPER_SIM_GTPRESET_SPEEDUP),
        .TILE_SIM_PLL_PERDIV2        (WRAPPER_SIM_PLL_PERDIV2),

        // Channel bonding attributes
        .TILE_CHAN_BOND_MODE_0       ("OFF"),
        .TILE_CHAN_BOND_LEVEL_0      (0),
    
        .TILE_CHAN_BOND_MODE_1       ("OFF"),
        .TILE_CHAN_BOND_LEVEL_1      (0)          
    )
    tile0_v5_gtpwizard_v2_1_i
    (
        //---------------------- Loopback and Powerdown Ports ----------------------
        .LOOPBACK0_IN                   (TILE0_LOOPBACK0_IN),
        .LOOPBACK1_IN                   (TILE0_LOOPBACK1_IN),
        //--------------------- Receive Ports - 8b10b Decoder ----------------------
        .RXCHARISCOMMA0_OUT             (TILE0_RXCHARISCOMMA0_OUT),
        .RXCHARISCOMMA1_OUT             (TILE0_RXCHARISCOMMA1_OUT),
        .RXCHARISK0_OUT                 (TILE0_RXCHARISK0_OUT),
        .RXCHARISK1_OUT                 (TILE0_RXCHARISK1_OUT),
        .RXDISPERR0_OUT                 (TILE0_RXDISPERR0_OUT),
        .RXDISPERR1_OUT                 (TILE0_RXDISPERR1_OUT),
        .RXNOTINTABLE0_OUT              (TILE0_RXNOTINTABLE0_OUT),
        .RXNOTINTABLE1_OUT              (TILE0_RXNOTINTABLE1_OUT),
        //----------------- Receive Ports - Clock Correction Ports -----------------
        .RXCLKCORCNT0_OUT               (TILE0_RXCLKCORCNT0_OUT),
        .RXCLKCORCNT1_OUT               (TILE0_RXCLKCORCNT1_OUT),
        //------------- Receive Ports - Comma Detection and Alignment --------------
        .RXBYTEISALIGNED0_OUT           (TILE0_RXBYTEISALIGNED0_OUT),
        .RXBYTEISALIGNED1_OUT           (TILE0_RXBYTEISALIGNED1_OUT),
        .RXENMCOMMAALIGN0_IN            (TILE0_RXENMCOMMAALIGN0_IN),
        .RXENMCOMMAALIGN1_IN            (TILE0_RXENMCOMMAALIGN1_IN),
        .RXENPCOMMAALIGN0_IN            (TILE0_RXENPCOMMAALIGN0_IN),
        .RXENPCOMMAALIGN1_IN            (TILE0_RXENPCOMMAALIGN1_IN),
        //----------------- Receive Ports - RX Data Path interface -----------------
        .RXDATA0_OUT                    (TILE0_RXDATA0_OUT),
        .RXDATA1_OUT                    (TILE0_RXDATA1_OUT),
        .RXRESET0_IN                    (TILE0_RXRESET0_IN),
        .RXRESET1_IN                    (TILE0_RXRESET1_IN),
        .RXUSRCLK0_IN                   (TILE0_RXUSRCLK0_IN),
        .RXUSRCLK1_IN                   (TILE0_RXUSRCLK1_IN),
        .RXUSRCLK20_IN                  (TILE0_RXUSRCLK20_IN),
        .RXUSRCLK21_IN                  (TILE0_RXUSRCLK21_IN),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .RXELECIDLE0_OUT                (TILE0_RXELECIDLE0_OUT),
        .RXELECIDLE1_OUT                (TILE0_RXELECIDLE1_OUT),
        .RXEQMIX0_IN                    (TILE0_RXEQMIX0_IN),
        .RXEQMIX1_IN                    (TILE0_RXEQMIX1_IN),
        .RXEQPOLE0_IN                   (TILE0_RXEQPOLE0_IN),
        .RXEQPOLE1_IN                   (TILE0_RXEQPOLE1_IN),
        .RXN0_IN                        (TILE0_RXN0_IN),
        .RXN1_IN                        (TILE0_RXN1_IN),
        .RXP0_IN                        (TILE0_RXP0_IN),
        .RXP1_IN                        (TILE0_RXP1_IN),
        //------ Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
        .RXSTATUS0_OUT                  (TILE0_RXSTATUS0_OUT),
        .RXSTATUS1_OUT                  (TILE0_RXSTATUS1_OUT),
        //------------------- Shared Ports - Tile and PLL Ports --------------------
        .CLKIN_IN                       (TILE0_CLKIN_IN),
        .GTPRESET_IN                    (TILE0_GTPRESET_IN),
        .PLLLKDET_OUT                   (TILE0_PLLLKDET_OUT),
        .REFCLKOUT_OUT                  (TILE0_REFCLKOUT_OUT),
        .RESETDONE0_OUT                 (TILE0_RESETDONE0_OUT),
        .RESETDONE1_OUT                 (TILE0_RESETDONE1_OUT),
        .TXENPMAPHASEALIGN_IN           (TILE0_TXENPMAPHASEALIGN_IN),
        .TXPMASETPHASE_IN               (TILE0_TXPMASETPHASE_IN),
        //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        .TXCHARISK0_IN                  (TILE0_TXCHARISK0_IN),
        .TXCHARISK1_IN                  (TILE0_TXCHARISK1_IN),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .TXDATA0_IN                     (TILE0_TXDATA0_IN),
        .TXDATA1_IN                     (TILE0_TXDATA1_IN),
        .TXRESET0_IN                    (TILE0_TXRESET0_IN),
        .TXRESET1_IN                    (TILE0_TXRESET1_IN),
        .TXUSRCLK0_IN                   (TILE0_TXUSRCLK0_IN),
        .TXUSRCLK1_IN                   (TILE0_TXUSRCLK1_IN),
        .TXUSRCLK20_IN                  (TILE0_TXUSRCLK20_IN),
        .TXUSRCLK21_IN                  (TILE0_TXUSRCLK21_IN),
        //------------- Transmit Ports - TX Driver and OOB signalling --------------
        .TXDIFFCTRL0_IN                 (TILE0_TXDIFFCTRL0_IN),
        .TXDIFFCTRL1_IN                 (TILE0_TXDIFFCTRL1_IN),
        .TXN0_OUT                       (TILE0_TXN0_OUT),
        .TXN1_OUT                       (TILE0_TXN1_OUT),
        .TXP0_OUT                       (TILE0_TXP0_OUT),
        .TXP1_OUT                       (TILE0_TXP1_OUT),
        //--------------- Transmit Ports - TX Ports for PCI Express ----------------
        .TXELECIDLE0_IN                 (TILE0_TXELECIDLE0_IN),
        .TXELECIDLE1_IN                 (TILE0_TXELECIDLE1_IN),
        //------------------- Transmit Ports - TX Ports for SATA -------------------
        .TXCOMSTART0_IN                 (TILE0_TXCOMSTART0_IN),
        .TXCOMSTART1_IN                 (TILE0_TXCOMSTART1_IN),
        .TXCOMTYPE0_IN                  (TILE0_TXCOMTYPE0_IN),
        .TXCOMTYPE1_IN                  (TILE0_TXCOMTYPE1_IN),
     .gtp_dbg                           (gtp_dbg)
    );

    
     
endmodule

