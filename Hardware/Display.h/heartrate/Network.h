#ifndef Network_H_
#define Network_H_

#include <WiFi.h>
#include <Firebase_ESP_Client.h>

class Network {
private:
    FirebaseData fbdo;
    FirebaseAuth auth;
    FirebaseConfig config;
    friend void WiFiEventConnected(WiFiEvent_t event, WiFiEventInfo_t info);
    friend void WiFiEventGotIP(WiFiEvent_t event, WiFiEventInfo_t info);
    friend void WiFiEventDisconnected(WiFiEvent_t event, WiFiEventInfo_t info);
  
    friend void FirestoreTokenStatusCallback(TokenInfo info);

public:
    Network();
    void firestoreDataUpdate(double temp, double humi);
    void firebaseInit();
    void initWiFi();
};

#endif // Network_H_
