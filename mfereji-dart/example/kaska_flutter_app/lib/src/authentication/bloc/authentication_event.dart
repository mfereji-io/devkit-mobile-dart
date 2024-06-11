part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthenticationEvent{}

class LoginRequestedEvent extends AuthenticationEvent{
  
  LoginRequestedEvent({
    required this.username, 
    required this.password});

    String username;
    String password;
}

class LoginSuccessEvent extends AuthenticationEvent{}

class LoginErrorEvent extends AuthenticationEvent{}

class LogoutRequestedEvent extends AuthenticationEvent{}


