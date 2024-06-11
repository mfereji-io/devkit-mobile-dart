import 'dart:async';
import 'package:kaskazini/util/service_locator.dart';

enum AuthenticationStatus { 
  unknown, 
  authenticated,
  unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository({required this.authorizationService});

  final  AuthorizationService authorizationService;

  Future<AppUser> login({
      required String username,
      required String password,
    }) async {
      
      try{


        final userLoginResponse = await authorizationService.login(
        username: username, password: password);
        return AppUser.fromJson(userLoginResponse);

      }catch(e){
        throw KaskaLogInException(errorMessage: "Authentication failed");
      }

  }

  Future<void> signOut() async {
    try {

      /*

        //() => _controller.add(AuthenticationStatus.authenticated),
        //
        ()=>AuthenticationStatus.unauthenticated
        
      */
      //

      return;

    } catch (e) {
      throw Exception(e);
    }

  }

}

class KaskaLogInException implements Exception {
  KaskaLogInException({required String errorMessage});
}