#include "mbed.h"
#include "SensorPIR.h"
#include "buzzer.h"

Beep buzzer(D3);
DigitalOut myledD15(D15);
DigitalIn pb(D7);

//function to perform bitwise inversion
int invert(int value)
{
    if (value == 0)
        return 1;
    else
        return 0;
}


int main()
{
    pb.mode(PullUp);
    int valuePB;

    int presence_detected;
    int alarm_on = 1;
    int count_button_pressed = 0;
    while(1) {
        presence_detected = GetPersonStatus();
        if (alarm_on == 1 && presence_detected == 1) {
            buzzer.beep(1000,1);
            wait(2.0);
            myledD15 = 1;
        }
        while (valuePB = invert(pb.read())) {
            if (valuePB && count_button_pressed == 2) {
                alarm_on = 1;
                count_button_pressed = 0;
                break;
            }
            if(valuePB) { //apasa pe buton
                myledD15 = 0;
                count_button_pressed++;
                alarm_on = 0;
            }
        }

    }
}
