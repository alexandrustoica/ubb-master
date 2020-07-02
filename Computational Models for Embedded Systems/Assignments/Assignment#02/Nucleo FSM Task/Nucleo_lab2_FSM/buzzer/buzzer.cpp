#include "buzzer.h"
#include "mbed.h"
 
/** class to make sound with a buzzer, based on a PwmOut
 *   The class use a timeout to switch off the sound  - it is not blocking while making noise
 *
 * Example:
 * @code
 * // Beep with 1Khz for 0.5 seconds
 * #include "mbed.h"
 * #include "beep.h"
 * 
 * Beep buzzer(PTC2);
 * 
 * int main() {
 *       ...
 *   buzzer.beep(1000,0.5);    
 *       ...
 * }
 * @endcode
 */
 
using namespace mbed;
 // constructor
 /** Create a Beep object connected to the specified PwmOut pin
  *
  * @param pin PwmOut pin to connect to 
  */
    
Beep::Beep(PinName pin) : _pwm(pin) {
    _pwm.write(0.0);     // after creating it have to be off
}
 
 /** stop the beep instantaneous 
  * usually not used 
  */
void Beep::nobeep() {
    _pwm.write(0.0);
}
 
/** Beep with given frequency and duration.
 *
 * @param frequency - the frequency of the tone in Hz
 * @param time - the duration of the tone in seconds
 */
     
void Beep::beep(float freq, float time) {
 
    _pwm.period(1.0/freq);
    _pwm.write(0.5);            // 50% duty cycle - beep on
    toff.attach(this,&Beep::nobeep, time);   // time to off
}