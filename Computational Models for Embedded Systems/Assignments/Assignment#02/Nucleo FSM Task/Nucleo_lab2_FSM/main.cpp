#include "mbed.h"
#include "SensorPIR.h"
#include "buzzer.h"

Beep buzzer(D3);
DigitalOut myledD15(D15);
DigitalIn pb(D7);

#define STATE_idle 0
#define STATE_presence_detected 1
#define STATE_alarm_on 2
#define STATE_led_on 3
#define STATE_alarm_off 4

int fsm_state;
Serial pc(USBTX, USBRX);

//function to perform bitwise inversion
int invert(int value)
{
    if (value == 0)
        return 1;
    else
        return 0;
}

void loop()
{
    pb.mode(PullUp);
    int valuePB;

    int presence_detected;
    int alarm_on = 0;
    int count_button_pressed = 0;

	switch(fsm_state){
	case STATE_idle:
		presence_detected = GetPersonStatus();
		if(presence_detected == 1){
		 pc.printf("Presence detected, turn on the alarm. \n"); 
		 alarm_on=1; 
		 fsm_state = STATE_alarm_on;
		}
		break;
	case STATE_alarm_on:
		if(alarm_on == 1){
		   buzzer.beep(1000,1);
 		   wait(2.0);
		   pc.printf("Send a light signal. \n"); 
		   myledD15 == 1;
		   fsm_state = STATE_led_on;
		}
		break;
	case STATE_led_on:
		if(myledD15 == 1){
		pc.printf("Led was turned on, press the button to turn it off. \n"); 
		    while (valuePB = invert(pb.read())) {
 			if(valuePB) {
                		count_button_pressed++;
                		fsm_state = STATE_alarm_off;
                		break;
            			}
       			 }
		}
		break;
	case STATE_alarm_off:
		myledD15 = 0;
		pc.printf("Led was turned off, press the button to turn off the alarm.\n"); 
		    while (valuePB = invert(pb.read())) {
 			if (valuePB && count_button_pressed == 2) {
                		alarm_on = 0;
				pc.printf("Alarm was turned off.\n"); 
                		count_button_pressed = 0;
						fsm_state = STATE_idle;
                		break;
            			}
			}
		break;

	}
}

int main() {
    
    fsm_state = STATE_idle; 
    pc.printf("Go to initial state\r\n");  
 
    while(1) {
        loop();     
        wait(0.1);  
    }
}

