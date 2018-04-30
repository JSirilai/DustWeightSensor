#ifndef _DustWS_h
#define _DustWS_h

#include "arduino.h"

#define quartzfreq 10000000
#define SauerbreyConst 0.04416915213

class DustWS
{
protected:
    int counterGateControllerPin;
    int resetCounterGateControllerPin;
    int MUXoutputPin;
    int triggerMUXControllerPin;
    long timerTime;

    bool isCounterGateOpen;
    bool isResetCounterGateOpen;
    bool isTriggerMUXOpen;

    void resetGateControl();
    void counterGateControl();
    void triggerMUXControl();
    unsigned long readingFromMUX();

public:
    DustWS(int, int, int, int);
    void begin();
    void setTimer(long);					//millisecond
    float measureMass();
    long measureFreq();
};

#endif // _DustWS_h
