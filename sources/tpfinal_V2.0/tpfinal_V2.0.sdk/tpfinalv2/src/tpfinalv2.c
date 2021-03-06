#include "xparameters.h"
#include "xgpio.h"
#include "led_ip.h"

//====================================================

int main (void)
{
	XGpio dip, push, inADC, ckio;
   int i, psb_check, dip_check, inADC_check, ckio_check;

   xil_printf("-- Start of the Program --\r\n");

   XGpio_Initialize(&dip, XPAR_SWITCHS_DEVICE_ID); // Modify this
   XGpio_SetDataDirection(&dip, 1, 0xffffffff);

   XGpio_Initialize(&push, XPAR_BUTTONS_DEVICE_ID); // Modify this
   XGpio_SetDataDirection(&push, 1, 0xffffffff);

   XGpio_Initialize(&inADC, XPAR_INADC_DEVICE_ID); // Modify this
   XGpio_SetDataDirection(&inADC, 1, 0xffffffff);

   XGpio_Initialize(&ckio, XPAR_LED_IP_0_DEVICE_ID); // Modify this
   XGpio_SetDataDirection(&ckio, 1, 0xffffffff);


   while (1)
   {
	  psb_check = XGpio_DiscreteRead(&push, 1);
	  xil_printf("Push Buttons Status %x\r\n", psb_check);

	  dip_check = XGpio_DiscreteRead(&dip, 1);
	  xil_printf("DIP Switch Status %x\r\n", dip_check);


	  inADC_check = XGpio_DiscreteRead(&inADC, 1);
	  xil_printf("ADC Status %x\r\n", inADC_check);

	  //ckio_check = XGpio_DiscreteRead(&ckio, 1);

	 	 ckio_check = LED_IP_mReadReg(XPAR_LED_IP_0_S_AXI_BASEADDR , 0);

	 	 	  xil_printf("gpio1 Status %x\r\n", ckio_check);


	  // output dip switches value on LED_ip device
	  LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, psb_check);



	  for (i=0; i<6999999; i++);
   }
}
