//-----------------------------------------------------------------------------
//-- (c) Copyright 2006 - 2009 Xilinx, Inc. All rights reserved.
//--
//-- This file contains confidential and proprietary information
//-- of Xilinx, Inc. and is protected under U.S. and
//-- international copyright and other intellectual property
//-- laws.
//--
//-- DISCLAIMER
//-- This disclaimer is not a license and does not grant any
//-- rights to the materials distributed herewith. Except as
//-- otherwise provided in a valid license issued to you by
//-- Xilinx, and to the maximum extent permitted by applicable
//-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//-- (2) Xilinx shall not be liable (whether in contract or tort,
//-- including negligence, or under any other theory of
//-- liability) for any loss or damage of any kind or nature
//-- related to, arising under or in connection with these
//-- materials, including for any direct, or any indirect,
//-- special, incidental, or consequential loss or damage
//-- (including loss of data, profits, goodwill, or any type of
//-- loss or damage suffered as a result of any action brought
//-- by a third party) even if such damage or loss was
//-- reasonably foreseeable or Xilinx had been advised of the
//-- possibility of the same.
//--
//-- CRITICAL APPLICATIONS
//-- Xilinx products are not designed or intended to be fail-
//-- safe, or for use in any application requiring fail-safe
//-- performance, such as life-support or safety devices or
//-- systems, Class III medical devices, nuclear facilities,
//-- applications related to the deployment of airbags, or any
//-- other applications that could lead to death, personal
//-- injury, or severe property or environmental damage
//-- (individually and collectively, "Critical
//-- Applications"). Customer assumes the sole risk and
//-- liability of any use of Xilinx products in Critical
//-- Applications, subject only to applicable laws and
//-- regulations governing limitations on product liability.
//--
//-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//-- PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
// MPMC Data Path
//-------------------------------------------------------------------------

// Description:    
//   Data Path for MPMC
//
// Structure:
//   mpmc_data_path
//     mpmc_write_fifo
//       mpmc_bram_fifo
//         mpmc_ramb16_sx_sx
//       mpmc_srl_fifo
//     mpmc_read_fifo
//       mpmc_bram_fifo
//         mpmc_ramb16_sx_sx
//       mpmc_srl_fifo
//     
//--------------------------------------------------------------------------
//
// History:
//   06/15/2007 Initial Version
//
//--------------------------------------------------------------------------
`timescale 1ns/1ns

module mpmc_srl_fifo_gen_output_pipeline #
  (
   parameter         C_OUTPUT_PIPELINE   = 1'b1,
   parameter integer C_OUTPUT_DATA_WIDTH =   64,
   parameter         C_DIRECTION         = "write"
   )
  (
   input                                  Clk,
   input                                  Pop,
   input      [C_OUTPUT_DATA_WIDTH-1:0]   PopData_r,
   input      [C_OUTPUT_DATA_WIDTH/8-1:0] PopParity_r,
   input                                  ParityRst_r,
   output reg [C_OUTPUT_DATA_WIDTH-1:0]   PopData,
   output reg [C_OUTPUT_DATA_WIDTH/8-1:0] PopParity
   );

  generate
    if (C_OUTPUT_PIPELINE == 1) begin : gen_output_pipeline
      if (C_DIRECTION == "read") begin : gen_read
        always @(posedge Clk) begin
          PopData      <= PopData_r;
          PopParity <= PopParity_r & {C_OUTPUT_DATA_WIDTH/8{~ParityRst_r}};
        end
      end
      else begin : gen_write
        reg Pop_d1;
        always @(posedge Clk) begin
          Pop_d1 <= Pop;
          if (~Pop_d1) begin
            PopData   <= {C_OUTPUT_DATA_WIDTH{1'b0}};
            PopParity <= {C_OUTPUT_DATA_WIDTH/8{1'b0}};
          end
          else begin
            PopData   <= PopData_r;
            PopParity <= PopParity_r & {C_OUTPUT_DATA_WIDTH/8{~ParityRst_r}};
          end
        end
      end
    end
    else begin : gen_no_output_pipeline
      always @(*) begin
        PopData   <= PopData_r;
        PopParity <= PopParity_r & {C_OUTPUT_DATA_WIDTH/8{~ParityRst_r}};
      end
    end
  endgenerate

endmodule // mpmc_srl_fifo_gen_output_pipeline

