`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: lab3_user_logic
/////////////////////////////////////////////////////////////////

module lab3_user_logic # (
	parameter LED_WIDTH = 4
	)
	(
    input S_AXI_ACLK,
    input slv_reg_wren,
    input [2:0] axi_awaddr,
    input [31:0] S_AXI_WDATA,
    input S_AXI_ARESETN,
    output reg [31:0] S_AXI_RDATA,
    output reg [LED_WIDTH-1:0] LED,
    input [LED_WIDTH-4:0] ck_io0,
    input [LED_WIDTH-4:0] ck_io1
    );
  
   reg [31:0] dataout;
   
  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_ARESETN == 1'b0 )
        LED <= 4'b0;
    else  
    //axi_awaddr  = 2'b00;
      if (slv_reg_wren && (axi_awaddr == 3'h0))
        begin
            LED <= S_AXI_WDATA[LED_WIDTH-1:0];
            LED[0] <= ck_io0;
            LED[2] <= ck_io1;
            if (ck_io1 == 1'b1)
              begin
                dataout= 4;
                //S_AXI_RDATA[3:0] <= dataout;
              end
            else if (ck_io1 == 1'b0)
              begin
                //S_AXI_RDATA[3:0] <= 0;    
              end
        end
   end
endmodule