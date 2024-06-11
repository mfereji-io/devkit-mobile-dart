import 'dart:convert';
import 'dart:async';
import 'package:kaskazini/util/service_locator.dart';

class AuthorizationService {
  AuthorizationService();

  factory AuthorizationService.instance() => AuthorizationService();

  Future<Map<String, dynamic>> login(
      {required String username, required String password}) async {
    if (username == '') {
      String errorMsgMissingUsername = "Please supply a username";
      throw KaskaAuthServiceException(errorMessage: errorMsgMissingUsername);
    }

    if (password == '') {
      String errorMsgMissingPassword = "Please supply a password";
      throw KaskaAuthServiceException(errorMessage: errorMsgMissingPassword);
    }

    try {
      final dioClient = Dio();
      dioClient.options.headers['X-CLIENT-TYPE'] = AppConfig.clientTypeMobile;

      UserLoginData userData = UserLoginData(
        username: username,
        password: password,
      );

      final userDataResponse = await dioClient.post<String>(
        AppConfig.userLoginEndpoint,
        data: userData.toJson(),
      );

      return jsonDecode(userDataResponse.data.toString())
          as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}

class KaskaAuthServiceException implements Exception {
  KaskaAuthServiceException({required String errorMessage});
}
