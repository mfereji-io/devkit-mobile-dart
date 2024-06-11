import 'package:kaskazini/util/service_locator.dart';


class UserRepository {

  UserRepository();

  static const _authenticationTokenKey = 'AUTHENTIC_TOKEN';

  final _storage = const FlutterSecureStorage(aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
  ));

  Future<void> persistAuthenticationCredentials({required AppUser authenticUser}) async {

  }

  Future<bool> hasAuthenticationToken() async {
    
    var value = await _storage.read(key: _authenticationTokenKey);
    return value != null;
    
  }

  Future<AppUser> getAuthenticatedUser() async {
    return const AppUser(
      username: "username",
      id: "id",
      firstname: "firstname",
      lastname: "lastname",
      chatToken: "chatToken",
      chatAppId: "chatAppId",
      );
  }

}