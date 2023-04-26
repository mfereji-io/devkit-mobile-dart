// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginData _$UserLoginDataFromJson(Map<String, dynamic> json) =>
    UserLoginData(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserLoginDataToJson(UserLoginData instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
