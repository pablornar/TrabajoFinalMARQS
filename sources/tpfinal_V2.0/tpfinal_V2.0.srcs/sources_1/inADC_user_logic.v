`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2021 18:42:33
// Design Name: 
// Module Name: inADC_user_logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module inADC_user_logic # (
	parameter inADC_WIDTH = 8
	)
	(
    input S_AXI_ACLK,
    input slv_reg_wren,
    input [2:0] axi_awaddr,
    input [31:0] S_AXI_WDATA,
    input S_AXI_ARESETN,
    output reg [31:0] S_AXI_RDATA,
    input [inADC_WIDTH-1:0] inDATA,
    output reg clkADC
    );
  
   reg [31:0] dataout[255:0];
   reg [7:0] index;
   reg [31:0] bandindex;
   reg [15:0] contclk=0; 
   reg [15:0] contdata=0;
   reg [15:0] cantdata=100;
   reg reglleno=0;
   reg [15:0] T=50;
   reg [7:0] Tguarda=5;
   reg [15:0] contdataout=0;
   reg [31:0] contTx=0;
   reg [31:0] TTx=5000000;
   
  initial
   begin
    clkADC <= 1'b0;
   end
   
  always @( posedge S_AXI_ACLK )
  
  begin
  
 //*****para ver si recibe un dato del micro.
    if ( S_AXI_ARESETN == 1'b0 )
        begin
            dataout[0] <= 8'b0;
        end
    else  
      begin
          if (slv_reg_wren && (axi_awaddr == 3'h0))
            begin
                index <= S_AXI_WDATA[inADC_WIDTH-1:0];
            end
      end
      
 //*****segun el dato recibido envia al micro        
    if (index == 22)
         begin
           if (reglleno == 1)
             begin
               if(contTx == TTx)
                 begin   
                   contTx=0;
                   S_AXI_RDATA[15:8] <= dataout[contdataout];
                   S_AXI_RDATA[7:0] <= contdataout;
                   contdataout=contdataout+1;
                   if(contdataout == (cantdata+1))
                       begin
                           contdataout=0;
                           reglleno=0;
                       end
                 end
                else
                  begin
                    contTx=contTx+1;
                  end
             end
          end
   else if (index == 3)
         begin
           T=50;    
         end
    else if (index == 4)
         begin
           T=100;    
         end
    else if (index == 5)
          begin
            T=150;    
          end
          
//**********generacion de clock
       if ((contclk == (T-1)) && (clkADC == 1'b0))
        begin
            clkADC <= 1'b1;
            contclk =0;
        end
       else if ((contclk == (T-1)) && (clkADC == 1'b1))
        begin
            clkADC <= 1'b0;
            contclk =0;
        end
       else
        begin
            contclk=contclk+1;
        end
       
       if ((clkADC == 1'b1) && (contclk >= Tguarda) && (reglleno == 0)) 
        begin
            if((contdata == (cantdata+1)))
                begin
                    contdata=0;
                    reglleno=1;
                end
            else
                begin
                    dataout[contdata]=inDATA;
                    contdata=contdata+1;
                end
        end
        
   end
endmodule
