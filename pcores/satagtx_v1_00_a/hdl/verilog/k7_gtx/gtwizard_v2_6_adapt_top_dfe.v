////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 2.6
//  \   \         Application : 7 Series FPGAs Transceivers Wizard 
//  /   /         Filename : gtwizard_v2_6_adapt_top_dfe.v
// /___/   /\     
// \   \  /  \ 
//  \___\/\___\ 
//
//
// Module gtwizard_v2_6_ADAPT_TOP_DFE
// Generated by Xilinx 7 Series FPGAs Transceivers Wizard
// 
// 
// (c) Copyright 2010-2012 Xilinx, Inc. All rights reserved.
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
`define DLY #1
module gtwizard_v2_6_ADAPT_TOP_DFE #(
	parameter AGC_TIMER = 150
)
(
	input  EN,
	input  CTLE3_COMP_EN,
	input  GTRXRESET,
	input  RXPMARESET,
	input  RXDFELPMRESET,
	//DRP
	input  DCLK,
	input  [15:0] DO,
	input  DRDY,
	output [8:0] DADDR,
	output [15:0] DI,
	output DEN,
	output DWE,
	//RXMONITOR
	input [6:0] RXMONITOR,
	output [1:0] RXMONITORSEL,
	output AGCHOLD,
	output KLHOLD,
	output KHHOLD,
	//DONE	
	output DONE,
	//Debug
	output [53:0] DEBUG
);

wire rst = (GTRXRESET | RXPMARESET | RXDFELPMRESET) & EN;
wire start_done;
wire done_pre;
wire lock_done;
wire ctle3_done;
wire en_b;

//DRP-related
wire [8:0] daddr_starter;
wire den_starter;
wire dwe_starter;

wire [8:0] daddr_lock;
wire den_lock;
wire dwe_lock;
wire [15:0] di_lock;

wire [8:0] daddr_ctle;
wire den_ctle;
wire dwe_ctle;
wire [15:0] di_ctle;

wire [3:0] holds;

wire rst_lock, rst_ctle, rst_ctle_b;
wire rst_ctle_pre;

reg lock_done_r, lock_done_r2;

//Debug signals
wire [3:0] lock_state;
wire [31:0] lock_count;
wire lock0, lock1, lock2, lock3;
wire [3:0] starter_state;
wire [2:0] starter_count;
wire starter_rst_int;
wire [3:0] ctle_state;
wire lock_done_rise;

/////////////////////////////////////////////////////////////
assign en_b = ~EN;
//assign rst_lock = ~start_done | en_b;
//assign rst_ctle = ~lock_done | ~CTLE3_COMP_EN | en_b;
assign rst_lock = ~start_done;
assign rst_ctle_pre = ~lock_done | ~CTLE3_COMP_EN;
assign rst_ctle = ~rst_ctle_b;
assign done_pre = CTLE3_COMP_EN ? ctle3_done : lock_done;
assign DONE = done_pre & start_done; //So that DONE goes low immediately after any of RESET's is asserted

//Start CTLE only after lock was just done. Don't want to start if user just asserted CTLE3_COMP_EN while lock_done already high.
FDCE #(
	.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) RST_CTLE_RISE_SR_FF (
	.Q(rst_ctle_b),
	.C(DCLK),
	.CE(lock_done_rise),
	.CLR(rst_ctle_pre),
	.D(1'b1)
);

always @ (posedge DCLK)
begin
	lock_done_r <= lock_done;
	lock_done_r2 <= lock_done_r;
end

assign lock_done_rise = ~lock_done_r2 & lock_done_r;

assign DEBUG = {
	lock_state[3:0],//53:50
	lock_count[31:0],//49:18
	lock0, lock1, lock2, lock3,//17:14
	starter_state[3:0],//13:10
	starter_count[2:0],//9:7
	starter_rst_int,//6
	ctle_state[3:0],//5:2
	rst_lock, rst_ctle //1:0
	};
assign AGCHOLD = DONE;
assign KLHOLD = DONE;
assign KHHOLD = DONE;

//When a block is not active, it will hold DADDR,DI,DEN,DWE low
assign DADDR = en_b ? 9'd0 : (daddr_starter | daddr_lock | daddr_ctle);
assign DI    = en_b ? 16'd0 : (di_lock | di_ctle);
assign DEN   = en_b ? 1'b0 : (den_starter | den_lock | den_ctle);
assign DWE   = en_b ? 1'b0 : (dwe_starter | dwe_lock | dwe_ctle);

/***************************************
	Sequence of operation:
	-adapt_starter -> triggered by any of above resets to deassert then waits for DFE LPM reset to complete
	-agc_loop_fsm -> triggered by adapt_starter completion then waits for all loops to lock
	-ctle_agc_comp -> triggered by agc_loop_fsmm done and adjusts CTLE3 until AGC not railing or CTLE3 at max/min.
***************************************/
gtwizard_v2_6_adapt_starter #(
	.WAIT_CYC(10)
) i_starter
(
	.RST(rst),
	.CLK(DCLK),
	.DO (DO),
	.DRDY(DRDY),
	.DADDR(daddr_starter),
	.DEN(den_starter),
	.DWE(dwe_starter),
	.READY(start_done),
	.curr_state_debug(starter_state[3:0]),
	.counter_debug(starter_count[2:0]),
	.rst_int_debug(starter_rst_int)
);

gtwizard_v2_6_agc_loop_fsm #(
	.usr_clk(AGC_TIMER)
) i_lock (
	.DCLK(DCLK),
	.reset(rst_lock),
	.DRDY(DRDY),
	.D0(DO),
	.DI(di_lock),
	.DWE(dwe_lock),
	.DEN(den_lock),
	.DADDR(daddr_lock),
	.holds(holds), //RXAGCHOLD,NC,KLHOLD,KHHOLD
	.kill(lock_done),
	.state(lock_state[3:0]),
	.count_lock_out(lock_count[31:0]),
	.lock0(lock0),
	.lock1(lock1),
	.lock2(lock2),
	.lock3(lock3)
);

gtwizard_v2_6_ctle_agc_comp #(
	.AGC_TIMER(AGC_TIMER)
) i_ctle
(
	.RST(rst_ctle),          //RST low starts state machine
	.DONE(ctle3_done),        //DONE asserted when complete, deasserted with RST high
	.DRDY(DRDY),         //Connect to Channel DRP 
	.DO(DO),    //Connect to Channel DRP 
	.DCLK(DCLK),         //Connect to same clk as Channel DRP DCLK
	.DADDR(daddr_ctle), //Connect to Channel DRP
	.DI(di_ctle),   //Connect to Channel DRP
	.DEN(den_ctle),         //Connect to Channel DRP
	.DWE(dwe_ctle),         //Connect to Channel DRP
	.RXMONITOR(RXMONITOR),			//Connect to RXMONITOR port
	.RXMONITORSEL(RXMONITORSEL),	//Connect to RXMONITORSEL port
	.curr_state(ctle_state[3:0])
);

endmodule

