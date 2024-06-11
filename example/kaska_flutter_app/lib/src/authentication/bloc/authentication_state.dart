part of 'authentication_bloc.dart';


const AppUser emptyUser = AppUser(
    username: "",
    id: "",
    firstname: "",
    lastname: "",
    chatToken: "",
    chatAppId: "",
  );

class AuthenticationState extends Equatable {
  const AuthenticationState({this.authenticatedUser = emptyUser});

  @override
  final AppUser authenticatedUser;

  AuthenticationState copyWith({
    AppUser? authenticatedUser,
  }){
    return AuthenticationState(
      authenticatedUser: authenticatedUser ?? this.authenticatedUser,
    );
  }

  
  @override
  List<Object> get props => [authenticatedUser];
}

class AuthenticationUninitialized extends AuthenticationState {
}
class AuthenticationInitializing extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  const AuthenticationAuthenticated({
    required this.authenticatedUser
  });

  final AppUser authenticatedUser;
  @override
  List<Object> get props => [authenticatedUser];
}

class AuthenticationError extends AuthenticationState {}
class AuthenticationLoading extends AuthenticationState {}
class AuthenticationLoggingOut extends AuthenticationState {}
class AuthenticationUnauthenticated extends AuthenticationState {}