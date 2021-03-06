#include "xparameters.h"
#include "xgpio.h"
#include "led_ip.h"
#include "inADC.h"
#include "xuartps.h"
#include "stdio.h"
#include "string.h"

//====================================================
#define TEST_BUFFER_SIZE 32
XUartPs serial;
XUartPs_Config *serialconfig;

static u8 RecvBuffer[TEST_BUFFER_SIZE];
static u8 SendBuffer[TEST_BUFFER_SIZE];
int status;
u8 rx_data, rx_index,endser, command;
u8 rx_buffer[255];

void terminadatauart(){
	if(rx_data != 0){
		rx_buffer[rx_index]= rx_data;
		if(rx_buffer[rx_index] != '\n'){
			if(rx_buffer[0] == '$'){
				rx_index++;
			}
			else{
				rx_index = 0;
				rx_data= 0;
			}
		}
		else{
			rx_buffer[rx_index] = rx_data;
			rx_index = 0;
			endser =1;
		}
		rx_data = 0;
	}
}

void olahdataserial(){
	if(strncmp(rx_buffer, 's', 5) == 0) command = 1;
	switch(command){
	case 1:
		printf("tes uart link\r\n");
		printf("procesor ARM\r\n");

		break;
	default:
		command=0;
	}
}

int main (void)
{
	XGpio dip, push, inADC, ckio, uart0;

	int i, psb_check, dip_check, inADC_check, ckio_check, uart0_check;
    int au;
    int cont=0;
    int index=0;
    int bandato=0;
    u32 LoopCount = 0;

    unsigned int SentCount;
    unsigned int ReceivedCount;

	//configuro el serial
	serialconfig = XUartPs_LookupConfig(XPAR_PS7_UART_0_DEVICE_ID);

	//inicializacion del uart
	status = XUartPs_CfgInitialize(&serial ,serialconfig, serialconfig -> BaseAddress);

	//baudrate
	XUartPs_SetBaudRate(&serial, 115200);


   xil_printf("-- Start of the Program --\r\n");

   XGpio_Initialize(&dip, XPAR_SWITCHS_DEVICE_ID); // Modify this
   XGpio_SetDataDirection(&dip, 1, 0xffffffff);

   XGpio_Initialize(&push, XPAR_BUTTONS_DEVICE_ID); // Modify this
   XGpio_SetDataDirection(&push, 1, 0xffffffff);

   XGpio_Initialize(&inADC, XPAR_INADC_0_DEVICE_ID); // Modify this
   XGpio_SetDataDirection(&inADC, 1, 0xffffffff);

   XGpio_Initialize(&ckio, XPAR_LED_IP_0_DEVICE_ID); // Modify this
   XGpio_SetDataDirection(&ckio, 1, 0xffffffff);

   //XGpio_Initialize(&uart0, XPAR_XUARTPS_0_DEVICE_ID); // Modify this
   //XGpio_SetDataDirection(&uart0, 1, 0xffffffff);

  // XUartPs_SetModeControl(Uart_PS, XUARTPS_OPER_MODE_NORMAL);

   while (1)
   {
	  //psb_check = XGpio_DiscreteRead(&push, 1);
	  //xil_printf("Push Buttons Status %x\r\n", psb_check);

	 // dip_check = XGpio_DiscreteRead(&dip, 1);
	 // xil_printf("DIP Switch Status %x\r\n", dip_check);

	//*****************************Comunicacion con el bloque de adquicision
	  if(bandato==1){
		  inADC_check = 22;
		  INADC_mWriteReg(XPAR_INADC_0_S_AXI_BASEADDR, 0, inADC_check);
		  inADC_check = INADC_mReadReg(XPAR_INADC_0_S_AXI_BASEADDR , 0);
		  au = inADC_check & 255;
		  if (au == cont){
			  xil_printf("a %x\r\n", inADC_check);
			  cont=cont+1;
			  if (cont == 101)
			  {
				  cont=0;
			  }
		  }
	  }
	  else if(bandato==3){
		  inADC_check = 3;
		  INADC_mWriteReg(XPAR_INADC_0_S_AXI_BASEADDR, 0, inADC_check);
	  }
	  else if(bandato==4){
		  inADC_check = 4;
		  INADC_mWriteReg(XPAR_INADC_0_S_AXI_BASEADDR, 0, inADC_check);
	  }
	  else if(bandato==5){
		  inADC_check = 5;
		  INADC_mWriteReg(XPAR_INADC_0_S_AXI_BASEADDR, 0, inADC_check);
	  }


	  //****************************Recepcion de datos
		  if (endser){
			  olahdataserial();
			  endser=0;
		  }
		  ReceivedCount = XUartPs_Recv(&serial,&rx_data,1);

		  if (ReceivedCount != 0){
			  xil_printf("Dato Recibido por uart %x\r\n", ReceivedCount);
			  xil_printf("Dato %x\r\n", rx_data);
			  if(rx_data == '1'){	//para inicializar en envio de datos
				  bandato=1;
			  }
			  else if(rx_data == '2'){ // para frenar la adquisicion de datos
				  bandato=2;
			  }
			  else if(rx_data == '3'){ // Tmuestreo 1Mhz
			  	  bandato=3;
			  }
			  else if(rx_data == '4'){ // Tmuestreo 500khz
			  	  bandato=4;
			  }
			  else if(rx_data == '5'){ // Tmuestreo 333khz
				  bandato=5;
			  }
		  }
		  terminadatauart();


	  //inADC_check = 0;
	  //INADC_mWriteReg(XPAR_INADC_0_S_AXI_BASEADDR, 0, inADC_check);

	  //ckio_check = XGpio_DiscreteRead(&ckio, 1);
	  //ckio_check = LED_IP_mReadReg(XPAR_LED_IP_0_S_AXI_BASEADDR , 0);
	 // xil_printf("gpio1 Status %x\r\n", ckio_check);


	  // output dip switches value on LED_ip device
	  //LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, psb_check);



	  for (i=0; i<999; i++);
   }
}
