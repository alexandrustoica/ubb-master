#include "SensorPIR.h"

Serial UARTPIR(USBTX, USBRX);
DigitalOut dout(LED1);
DigitalIn enable1(D2);

int GetPersonStatus()
{
    bool RoomStatus = 0;
    UARTPIR.baud(115200);
    wait(2); //Wait for sensor to take snap shot of still room
    if(enable1==1) {
        RoomStatus = 1;
        dout=1;
        UARTPIR.printf("Presence detected \n\r");
    } else {
        RoomStatus = 0;
        dout=0;
        UARTPIR.printf("No presence detected\n\r");
    }
    return RoomStatus;
}