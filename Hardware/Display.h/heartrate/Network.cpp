#include "Network.h"
#include "addons/TokenHelper.h"

#define WIFI_SSID "MHD"
#define WIFI_PASSWORD "12345678"

#define API_KEY "AIzaSyCS2cS4XDvZEZhPhFZuhKwXlpjXtjP6mqc"
#define FIREBASE_PROJECT_ID "esp32-47534"
#define USER_EMAIL "mhd123@gmail.com"
#define USER_PASSWORD "123456"

static Network *instance = NULL;

Network::Network() {
   instance = this;
}

// Define event handler functions


void WiFiEventConnected(WiFiEvent_t event, WiFiEventInfo_t info){
  Serial.println("WIFI CONNECTED! BUT WAIT FOR THE LOCAL IP ADDR");
}

void WiFiEventGotIP(WiFiEvent_t event, WiFiEventInfo_t info){
  Serial.print("LOCAL IP ADDRESS: ");
  Serial.println(WiFi.localIP());
  instance->firebaseInit();
}

void WiFiEventDisconnected(WiFiEvent_t event, WiFiEventInfo_t info){
  Serial.println("WIFI DISCONNECTED!");
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
}

void FirestoreTokenStatusCallback(TokenInfo info){
  Serial.printf("Token Info: type = %s, status = %s\n", getTokenType(info), getTokenStatus(info));
}

void Network::initWiFi(){
  WiFi.disconnect();
  WiFi.onEvent(WiFiEventConnected, ARDUINO_EVENT_WIFI_STA_CONNECTED);
  WiFi.onEvent(WiFiEventGotIP, ARDUINO_EVENT_WIFI_STA_GOT_IP);
  WiFi.onEvent(WiFiEventDisconnected, ARDUINO_EVENT_WIFI_STA_DISCONNECTED);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
}

void Network::firebaseInit(){
  config.api_key = API_KEY;

  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  config.token_status_callback = FirestoreTokenStatusCallback;

  Firebase.begin(&config, &auth);
}

void Network::firestoreDataUpdate(double temp, double humi){
  if(WiFi.status() == WL_CONNECTED && Firebase.ready()){
    String documentPath = "House/Room_1";

    FirebaseJson content;

    content.set("fields/beatAvg/doubleValue", String(temp).c_str());
    content.set("fields/beatsPerMinute/doubleValue", String(humi).c_str());

    if(Firebase.Firestore.patchDocument(&fbdo, FIREBASE_PROJECT_ID, "", documentPath.c_str(), content.raw(), "beatAvg,beatsPerMinute")){
      Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
      return;
    }else{
      Serial.println(fbdo.errorReason());
    }

    if(Firebase.Firestore.createDocument(&fbdo, FIREBASE_PROJECT_ID, "", documentPath.c_str(), content.raw())){
      Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
      return;
    }else{
      Serial.println(fbdo.errorReason());
    }
  }
}