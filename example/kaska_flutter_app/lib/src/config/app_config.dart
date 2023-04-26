import 'dart:io' show Platform;

class AppConfig{

  AppConfig();

  static const clientTypeMobile = "MOBILE";

  static String getPlatformUrl(){

    if(Platform.isIOS){
      return 'http://localhost:8081/api/v1';
    }

    return 'http://10.0.2.2:8081/api/v1';
    //return 'https://api.mybackend.com/api/v1'
    //return 'https://api.kaska.lab.mfereji.io/api/v1'

  }

  static final baseURL = getPlatformUrl();

  static final authBaseURL = "$baseURL/auth";
  static final userLoginEndpoint = "$authBaseURL/login/u";

  static const appId = "72303f7f-bcbb-428f-9314-21a6e2d7061c";
  static const mferejiPresenceBaseUrl = 'wss://lab.chat-wss.mfereji.io/v1';
  static const mferejiPresenceConnectUrl = "$mferejiPresenceBaseUrl/ws/connect?app_id="+appId;

  
}