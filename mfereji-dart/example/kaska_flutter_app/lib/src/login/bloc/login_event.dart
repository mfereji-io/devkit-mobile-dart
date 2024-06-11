part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent{
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];

}
//class LoginEmailChanged extends LoginEvent{}
class LoginPasswordChanged extends LoginEvent{
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginFormSubmitAttempt extends LoginEvent{
  const LoginFormSubmitAttempt();
  
  /*
  const LoginFormSubmitAttempt(
    {
    this.username = "",
    this.password = "",
  });

  final String username;
  final String password;
  */
}

class LoginResetRequested extends LoginEvent{}
