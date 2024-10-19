`timescale 1ns / 1ps


module sync_w2r
#(
  parameter ADDRSIZE = 3
)
(
  input   rclk, rrst_n,
  input   [ADDRSIZE:0] wptr,
  output reg [ADDRSIZE:0] rq2_wptr
);
reg [ADDRSIZE:0] rq1_wptr;

always_ff @(posedge rclk or posedge rrst_n) 
//always_ff @(posedge rclk or negedge rrst_n) 
    if (rrst_n) begin
//    if (!rrst_n) begin
//      {rq2_wptr,rq1_wptr} <= 0;
      rq2_wptr <= 0;
      rq1_wptr <= 0;     
      end
    else
    begin
          {rq2_wptr,rq1_wptr} <= {rq1_wptr,wptr};
    end

endmodule

