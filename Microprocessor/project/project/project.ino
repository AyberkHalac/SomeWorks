#include <SoftwareSerial.h>
#define PIR 8

SoftwareSerial mySerial(0, 1); // RX, TX
boolean check = false;
void setup()
{
  pinMode(PIR, INPUT);
  while (!Serial) {
    ;
  }
  mySerial.begin(9600);
  delay(2000);
}

void loop()
{

  int value = digitalRead(PIR);
  if (value == HIGH) {
    mySerial.write('1');
    check = true;
    delay(500);
  }
  else if (value == LOW && check == true) {
    check = false;
    mySerial.write('e');
  }
}


