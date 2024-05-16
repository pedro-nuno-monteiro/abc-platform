#include <Arduino.h>
#include <BleGamepad.h>

#define FSR_1 35
#define FSR_2 27
#define FSR_3 32
#define FSR_4 34
#define FSR_5 13

BleGamepad bleGamepad;

void setup()
{
  Serial.begin(115200);
  Serial.println("Starting BLE work!");
  bleGamepad.begin();
  // The default bleGamepad.begin() above enables 16 buttons, all axes, one hat, and no simulation controls or special buttons
  pinMode(FSR_1, OUTPUT);
  pinMode(FSR_2, OUTPUT);
  pinMode(FSR_3, OUTPUT);
  pinMode(FSR_4, OUTPUT);
  pinMode(FSR_5, OUTPUT);
}

void loop()
{
  if (bleGamepad.isConnected())
  {
    int valor_esquerda, valor_direita, valor_frente, valor_saltar, valor_atras;
   
    valor_esquerda=analogRead(FSR_1);
    valor_direita=analogRead(FSR_2);
    //Serial.println(valor_direita);
    
    valor_frente=analogRead(FSR_3);
    Serial.println(valor_frente);
    valor_atras=analogRead(FSR_5);
    valor_saltar=analogRead(FSR_4);
    Serial.println(valor_saltar);

     int maior_valor = 0;
      unsigned long tempo_inicial = millis();
      unsigned long tempo_atual;
      
      if(valor_saltar>2000){ // e porque esta a ser pressionada
        /*while (millis() - tempo_inicial < 1000) {
          valor_saltar = analogRead(FSR_3);
          if (valor_saltar > maior_valor) {
              maior_valor = valor_saltar;
          }
        }*/
      

      valor_saltar = map(valor_saltar, 0, 4095, 0, 32767/2);

      bleGamepad.setAxes(32767/2, 32767/2, 32767/2 - valor_saltar, 32767/2, 0, 0, 0, 0);
      /*
       * valor_saltar = maior_valor;
       * Serial.print("Maior valor lido durante 1 segundo: ");
      Serial.println(maior_valor);*/
      }
      
    valor_esquerda = map(valor_esquerda, 0, 4095, 0, 32767/2);
    valor_direita = map(valor_direita, 0, 4095/2, 0, 32767/2);
    valor_frente = map(valor_frente, 0, 4095, 0, 32767/2);
    valor_atras = map(valor_atras, 0, 3000, 0, 32767/2);

    bleGamepad.setAxes(32767/2 - valor_esquerda + valor_direita, 32767/2 - valor_frente + valor_atras, 32767/2, 32767/2, 0, 0, 0, 0);
    //delay(500);
  }
}
