#define FSR_1 27
#define FSR_2 25
#define FSR_3 32
#define FSR_4 35
#include <Arduino.h>

bool uma_vez = true;

//#include "BluetoothSerial.h" 

//BluetoothSerial BT;

void setup() {
  Serial.begin(115200);
  //BT.begin("ESP32-BT-Slave");
  pinMode(FSR_1, OUTPUT);
  pinMode(FSR_2, OUTPUT);
  pinMode(FSR_3, OUTPUT);
  pinMode(FSR_4, OUTPUT);
}

void loop() {
  //if(BT.available()>0){
    /*Serial.print("The force sensor value 1 = ");
    Serial.println(analogRead(FSR_1));
    Serial.println("\n");
    delay(100);
  
    Serial.print("The force sensor value 2 = ");
    Serial.println(analogRead(FSR_2));
    Serial.println("\n");
    delay(100);
  
    Serial.print("The force sensor value 3 = ");
    Serial.println(analogRead(FSR_3));
    Serial.println("\n");
    delay(100);*/

    if(uma_vez){

      int valor_4 = analogRead(FSR_3);
      Serial.print("The force sensor value 4 = ");
      Serial.println(valor_4);
      
      int maior_valor = 0;
      unsigned long tempo_inicial = millis();
      unsigned long tempo_atual;
      
      if(valor_4>300){ // e porque esta a ser pressionada
        while (millis() - tempo_inicial < 1000) {
          valor_4 = analogRead(FSR_3);
          if (valor_4 > maior_valor) {
              maior_valor = valor_4;
          }
        }
      Serial.print("Maior valor lido durante 1 segundo: ");
      Serial.println(maior_valor);
      uma_vez=false;
      }
    }
    

    

    
  //}
  

  
}
