#define LED_PIN 35
#include <Arduino.h>

void setup() {
  Serial.begin(115200);
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  Serial.println("The force sensor value = ");
  Serial.println(analogRead(LED_PIN));
  Serial.println("\n");
  delay(100);
}