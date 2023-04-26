
part of 'login_bloc.dart';
 
enum FormValidityStatus{
  initial,
  valid,
  invalid,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = FormValidityStatus.initial,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  final FormValidityStatus status;
  final Username username;
  final Password password;
  

  LoginState copyWith({
    FormValidityStatus? status,
    Username? username,
    Password? password
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];

}

/*
class LoginSubmittedWaiting extends LoginState {
  const LoginSubmittedWaiting({
    this.username = "",
    this.password = "",
  });

  //@overide
  final String username;

  //@override
  final String password;
}
*/

/*
class LoginSubmittedDoneWithOk extends LoginState {}
class LoginSubmittedDoneWithError extends LoginState {}
*/