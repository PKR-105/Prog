#include<ESP8266WiFi.h>
#include<ThingSpeak.h>
#include<WiFiClient.h>
#include <ESP8266WebServer.h>
#include <MQ2.h>
#include "DHT.h"

#define DHTPIN 2    
 
#define DHTTYPE DHT11

DHT dht(2, DHTTYPE);

int LED = 12; 

int isFlamePin = 16; 

int isFlame = HIGH; 

int relaypinmode1 = 13;

int buzzerPin1 = 14;

WiFiClient client ;

char sd[]="erwq";

char pwdd[]="ertyui";

long rssivaluewifi;

const char* host = "195.111.33.27"; 

char wrky[]="VCI8YTAI2ZL9RLMR";

unsigned long cd=1278647;

const int Field_Number_2 = 2;

String dat;

String url1;

int numa =1;

int pin = A0;

int lpg, co, smoke;

MQ2 mq2(pin);


void setup() {

  Serial.begin(9600);
  
  delay(10);
  
    
  
  pinMode(LED, OUTPUT);
  
  pinMode(isFlamePin, INPUT); 

  pinMode(relaypinmode1, OUTPUT);
  
  pinMode(buzzerPin1, OUTPUT);
  
  digitalWrite(buzzerPin1, HIGH);
  
  mq2.begin();

  dht.begin();

  WiFi.begin(sd,pwdd);

  while(WiFi.status()!=WL_CONNECTED)
  {	  
    delay(500);
	
    Serial.print(".");
	
   }

  Serial.println();

  ThingSpeak.begin(client);
}

void loop() {	

  rssivaluewifi = 0;
		
  isFlame = digitalRead(isFlamePin);
  
  if (isFlame== HIGH)  
  {
    Serial.println("no flame"); 

    digitalWrite(LED, LOW); 
	
	digitalWrite(relaypinmode1, LOW);
	
	digitalWrite(buzzerPin1, HIGH);
  }
  else                           
  {   
    
    digitalWrite(LED, HIGH);
	
	digitalWrite(relaypinmode1, HIGH);
	
	digitalWrite(buzzerPin1, LOW);
  }
  
  float* values= mq2.read(true); 

  lpg = mq2.readLPG();

  smoke = mq2.readSmoke();
  
  
  
  Serial.print("LPG - ");
  Serial.println(lpg); 
  Serial.print("Smoke - ");
  Serial.println(smoke);  
  Serial.println("");
  
  
  

  float h = dht.readHumidity();

  float t = dht.readTemperature();

  Serial.print(F(" Humidity: "));
  Serial.print(h);
  Serial.print(F("%  Temperature: "));
  Serial.print(t);
  Serial.print(F("C "));
  Serial.println("");
  

    

  if(client.connect(host,8000)) {

    rssivaluewifi = WiFi.RSSI();

    url1 = String(numa) + "," + String(t) + "," + String(h) +  "," + lpg + "," + smoke + "," + String(isFlame) + "," + String(rssivaluewifi);
    client.print(url1); 
	  
	Serial.println("Send Data");
	Serial.println(url1);
	Serial.println(numa);
  	Serial.println("");
	Serial.println(rssivaluewifi);
	
	  
	
    delay(10);
  }
  
  numa++;
  
  Serial.println("................................................");
    
  delay(1000);
  
}