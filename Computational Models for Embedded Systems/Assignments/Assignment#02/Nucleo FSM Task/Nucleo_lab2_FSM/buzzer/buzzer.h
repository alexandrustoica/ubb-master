#ifndef MBED_BEEP_H
#define MBED_BEEP_H
 
#include "mbed.h"
/**
@namespace Beep Library 
@brief Contains member functions for the speaker funtion that allow for sending of frequency of sounds and duration through pwm
@Author Peter Drescher (I do not own the rights to this library and it has been rightly attributed to its owner
@Revision 2012 

**/


 
/** class to make sound with a buzzer, roughly based on a library created by Peter Drescher 
 *   The class use a timeout to switch off the sound  - it is not blocking while making noise
 *
 * Example:
 * @code
 * // Beep with 1Khz for 0.5 seconds
 * #include "mbed.h"
 * #include "buzzer.h"
 * 
 * Beep buzzer(PTC2);
 * 
 * int main() {
 *        ...
 *   buzzer.beep(1000,0.5);    
 *       ...
 * }
 * @endcode
 */
 
 
namespace mbed {
 
/* Class: Beep
 *  A class witch uses pwm to controle a beeper to generate sounds.
 */
class Beep {
 
public:
 
/** Create a Beep object connected to the specified PwmOut pin
 *
 * @param pin PwmOut pin to connect to 
 */
    Beep (PinName pin);
 
/** Beep with given frequency and duration.
 *
 * @param frequency - the frequency of the tone in Hz
 * @param time - the duration of the tone in seconds
 */
    void beep (float frequency, float time);
 
/** stop the beep instantaneous 
 * usually not used 
 */
    void nobeep();
 
private :
    PwmOut _pwm;
    Timeout toff;
};
 
}
#endif
 
            
