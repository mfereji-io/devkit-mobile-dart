import 'package:kaskazini/util/service_locator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user_model.g.dart';

class AppUser extends Equatable {
  
  const AppUser({
    required this.username,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.chatToken,
    required this.chatAppId


  });

  final String username;
  final String id;
  final String firstname;
  final String lastname;
  final String chatToken;
  final String chatAppId;
  

  static const empty = AppUser(
    username: '',
    id: '',
    firstname: '',
    lastname: '',
    chatToken: '',
    chatAppId: '',
  );

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      username: json['username'].toString(),
      id: json['useruuid'].toString(),
      firstname: json['firstname']..toString(),
      lastname: json['lastname']..toString(),
      chatToken: json['chattoken'].toString(),
      chatAppId: json['chatappid'].toString(),
    );
  }

  @override
  List<Object?> get props => [
    username,
    id,
    firstname,
    lastname,
    chatToken,
    chatAppId
    ];

}

@JsonSerializable()
class UserLoginData{

  UserLoginData(
    {
      required this.username,
      required this.password
    }
  );

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'password')
  String password;

  factory UserLoginData.fromJson(Map<String, dynamic> json) => _$UserLoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginDataToJson(this);
}