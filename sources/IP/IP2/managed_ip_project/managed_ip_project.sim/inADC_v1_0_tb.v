`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2021 08:21:47
// Design Name: 
// Module Name: inADC_v1_0_tb
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


module inADC_v1_0_tb;

    // Users to add parameters here
    parameter integer inADC_WIDTH = 8;
    // User parameters ends
    // Do not modify the parameters beyond this line


    // Parameters of Axi Slave Bus Interface S_AXI
    parameter integer C_S_AXI_DATA_WIDTH	= 32;
    parameter integer C_S_AXI_ADDR_WIDTH = 4;
		
    reg   [inADC_WIDTH-1:0] inDATA_tb;
    wire clkADC_tb;
    // User ports ends
    // Do not modify the ports beyond this line
    
    // Ports of Axi Slave Bus Interface S_AXI
    reg   s_axi_aclk_tb;
    reg   s_axi_aresetn_tb;
    reg  [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr_tb;
    reg  [2 : 0] s_axi_awprot_tb;
    reg   s_axi_awvalid_tb;
    wire  s_axi_awready_tb;
    reg  [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_wdata_tb;
    reg  [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb_tb;
    reg   s_axi_wvalid_tb;
    wire  s_axi_wready_tb;
    wire [1 : 0] s_axi_bresp_tb;
    wire  s_axi_bvalid_tb;
    reg   s_axi_bready_tb;
    reg  [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr_tb;
    reg  [2 : 0] s_axi_arprot_tb;
    reg   s_axi_arvalid_tb;
    wire  s_axi_arready_tb;
    wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_rdata_tb;
    wire [1 : 0] s_axi_rresp_tb;
    wire  s_axi_rvalid_tb;
    reg   s_axi_rready_tb;
    
    localparam T = 10; // clock periodo de 100Mhz
    initial
            begin
                $display($time, " << Starting the Simulation >>");
                s_axi_wdata_tb = 3;
                inDATA_tb <= 8'b00000000;
                s_axi_aresetn_tb <= 1'b1;
                //slv_reg_wren_tb <= 1'b1;
                
                
            end
           
    always      // el always sin lista de sensibilidad se ejecuta siempre.
                begin
                    s_axi_aclk_tb = 1'b1;
                    #(T/2);
                    s_axi_aclk_tb = 1'b0;
                    #(T/2);
                end  
                
                
  inADC_v1_0_S_AXI # ( 
                    .inADC_WIDTH(inADC_WIDTH),
                    .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
                    .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
                ) 
                
                DUT (
                    .S_AXI_ACLK(s_axi_aclk_tb),
                    .S_AXI_ARESETN(s_axi_aresetn_tb),
                    .S_AXI_AWADDR(s_axi_awaddr_tb),
                    .S_AXI_AWPROT(s_axi_awprot_tb),
                    .S_AXI_AWVALID(s_axi_awvalid_tb),
                    .S_AXI_AWREADY(s_axi_awready_tb),
                    .S_AXI_WDATA(s_axi_wdata_tb),
                    .S_AXI_WSTRB(s_axi_wstrb_tb),
                    .S_AXI_WVALID(s_axi_wvalid_tb),
                    .S_AXI_WREADY(s_axi_wready_tb),
                    .S_AXI_BRESP(s_axi_bresp_tb),
                    .S_AXI_BVALID(s_axi_bvalid_tb),
                    .S_AXI_BREADY(s_axi_bready_tb),
                    .S_AXI_ARADDR(s_axi_araddr_tb),
                    .S_AXI_ARPROT(s_axi_arprot_tb),
                    .S_AXI_ARVALID(s_axi_arvalid_tb),
                    .S_AXI_ARREADY(s_axi_arready_tb),
                    .S_AXI_RDATA(s_axi_rdata_tb),
                    .S_AXI_RRESP(s_axi_rresp_tb),
                    .S_AXI_RVALID(s_axi_rvalid_tb),
                    .S_AXI_RREADY(s_axi_rready_tb),
                    .inDATA(inDATA_tb),
                    .clkADC(clkADC_tb)
                );  
endmodule
