`timescale 1ns / 1ps


// Top level wrapper
//
module async_fifo1
#(
  parameter DSIZE = 3,
  parameter ASIZE = 3
 )
(
//  input    wrst_n,//winc write enable signal ;button
//  input   winc, wclk, wrst_n,//winc write enable signal ;button
//  input    rrst_n,//rinc read enable signal ; button
//  input   rinc, rclk, rrst_n,//rinc read enable signal ; button
//  input   [DSIZE-1:0] wdata,
  input clk_100MHz,
  input DIP2,DIP1,DIP0,DIP_R,butr,
  input read_btn,write_btn,reset,
//  output  [DSIZE-1:0] rdata,
//  output  wfull,
//  output  rempty,
  output  led3,led2,led1,led0,RGB_g,RGB_r
);
  wire [DSIZE-1:0] wdata = {DIP2,DIP1,DIP0}; 
  wire [ASIZE-1:0] waddr,  raddr;
  wire [ASIZE:0] wptr, rptr, wq2_rptr, rq2_wptr;
  wire winc,rinc;
  wire wclk,rclk;
  reg [DSIZE-1:0] rdata;
  reg wfull;
  reg  rempty;
//  assign rinc = read_btn ;
//  assign winc = write_btn ;
  assign {led2,led1,led0} = rdata;

  assign wrst_n =DIP_R;
  assign RGB_g = wfull;
  assign RGB_r = rempty;
  assign led3 = DIP_R;
  
  btn_deb bd3(.clk_100MHz(clk_100MHz), .btn_in(reset), .btn_out(rrst_n));
  btn_deb bd5(.clk_100MHz(clk_100MHz), .btn_in(read_btn), .btn_out(rinc));
  btn_deb bd4(.clk_100MHz(clk_100MHz), .btn_in(write_btn), .btn_out(winc));
  fifoclock fclk(.clk_100MHz(clk_100MHz), .reset(butr), .clk_10Hz(wclk),.clk_25Hz(rclk));
//  ficoclock writeclk(.clk_100MHz(clk_100MHz), .reset(btnR), .clk_10Hz(read));
  
  sync_r2w sync_r2w (.*);
  sync_w2r sync_w2r (.*);
  fifomem #(DSIZE, ASIZE) fifomem (.*);
  rptr_empty #(ASIZE) rptr_empty (.*);
  wptr_full #(ASIZE) wptr_full (.*);
  

  
endmodule
