#include "DustWS.h"

DustWS::DustWS(int CGCpin, int RCGCpin, int MUXOpin, int MUXCpin)
	{
		counterGateControllerPin = CGCpin;
		resetCounterGateControllerPin = RCGCpin;
		MUXoutputPin = MUXOpin;
		triggerMUXControllerPin = MUXCpin;

		pinMode(counterGateControllerPin, OUTPUT);
		pinMode(resetCounterGateControllerPin, OUTPUT);
		pinMode(triggerMUXControllerPin, OUTPUT);
		pinMode(MUXoutputPin, INPUT);
	}

void DustWS::begin()
	{
		isCounterGateOpen = false;
		isResetCounterGateOpen = false;
		isTriggerMUXOpen = false;

		timerTime = 60000;

		digitalWrite(counterGateControllerPin,LOW);
		digitalWrite(resetCounterGateControllerPin,LOW);
		digitalWrite(triggerMUXControllerPin,LOW);
	}

void DustWS::setTimer(long changeTime)
	{
		timerTime = changeTime;
	}

void DustWS::counterGateControl()
	{
		if(!isCounterGateOpen){
				digitalWrite(counterGateControllerPin,HIGH);
		  //Serial.println("C");
		}
		else{
				digitalWrite(counterGateControllerPin,LOW);
		  //Serial.println("CE");
		}
    isCounterGateOpen = !isCounterGateOpen;
	}

void DustWS::resetGateControl()
	{
		if(!isResetCounterGateOpen){
				digitalWrite(resetCounterGateControllerPin,HIGH);
		  //Serial.println("S");
		}
		else{
				digitalWrite(resetCounterGateControllerPin,LOW);
		  //Serial.println("SE");
		}
    isResetCounterGateOpen = !isResetCounterGateOpen;
	}

void DustWS::triggerMUXControl()
	{
		if(!isTriggerMUXOpen){
				digitalWrite(triggerMUXControllerPin,HIGH);
		}
		else{
				digitalWrite(triggerMUXControllerPin,LOW);
		}
    isTriggerMUXOpen = !isTriggerMUXOpen;
	}

unsigned long DustWS::readingFromMUX()
	{
		int readingValue[24];//={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		for(int i = 0; i <= 23; i++)
		{
		  if(digitalRead(MUXoutputPin) == HIGH){
                readingValue[i]=1;
			}
      else{
                readingValue[i]=0;
      }
      //Serial.println(readingValue[i]);
      triggerMUXControl();
      delay(100);
			triggerMUXControl();
			delay(100);
		}
		unsigned long sum = 0;
		for(int i = 0; i<=23;i++)
		{
			sum*=2;
			sum+=readingValue[23-i];
		}
		return sum;
	}

float DustWS::measureMass()
	{
		int prev_freq,pres_freq;

		prev_freq = measureFreq();

		Serial.println("Processing");
		delay(timerTime);

		pres_freq = measureFreq();

		return SauerbreyConst * (prev_freq - pres_freq);
	}

long  DustWS::measureFreq()
	{
		resetGateControl();
		Serial.println("Reset Gate Open");
		delay(1000);
		resetGateControl();
		Serial.println("Reset Gate closed");

		counterGateControl();
		Serial.println("Counter Gate Open");
		delay(1000);
		counterGateControl();
		Serial.println("Counter Gate Closed");
		delay(3000);

		return readingFromMUX();
	}