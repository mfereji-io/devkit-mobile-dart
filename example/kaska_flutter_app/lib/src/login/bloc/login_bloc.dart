//import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kaskazini/util/service_locator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    {
      required UserRepository userRepository,
      required AuthenticationRepository authenticationRepository,
    }
  ) : 
  _userRepository = userRepository,
  _authenticationRepository = authenticationRepository,
  super(const LoginState()) {

    on<LoginUsernameChanged>((event, emit) {

        final username = Username.dirty(event.username);
        final password = state.password;
        
        print("--------------------------");
        print("new username is $username");
        print("current password is $password");
        print("--------------------------");

        FormValidityStatus formValidityStatus = state.status;

        if(Formz.validate([username,password])){
          formValidityStatus = FormValidityStatus.valid;
        }else{
          formValidityStatus = FormValidityStatus.invalid;
        }

        emit(
          state.copyWith(
          username: username,
          status: formValidityStatus,
          ),
        );

    });

    on<LoginPasswordChanged>((event, emit) {

        final password = Password.dirty(event.password);
        final username = state.username;

        print("--------------------------");
        print("current username is $username");
        print("new password is $password");
        print("--------------------------");

        FormValidityStatus formValidityStatus = state.status;

        if(Formz.validate([password, username])){
          formValidityStatus = FormValidityStatus.valid;
        }else{
          formValidityStatus = FormValidityStatus.invalid;
        }

        emit(
          state.copyWith(
          password: password,
          status: formValidityStatus,
          ),
        );
     
    });

    on<LoginResetRequested>((event, emit) async {
      print("Resetting the login state");
      emit(state.copyWith(
        status: FormValidityStatus.invalid,
        username: const Username.pure(),
        password: const Password.pure(),
      ));
    });

    on<LoginFormSubmitAttempt>((event, emit) async {
        //check form validity
        print("--------------------------");
        print("login_bloc current form status is ${state.status}");
        print("Submitting form to the auth repository");
        print("Submitting form username ${state.username}");
        print("Submitting form password ${state.password}");
        print("--------------------------");

        if(state.status == FormValidityStatus.valid){
          print("Submitting valid form to the auth repository");

            /*
            emit(LoginSubmittedWaiting(
              username: event.username,
              password: event.password,

            ));
            */

          /*
            print("Submitting form to the auth repository");
            print("Submitting form username ${state.username}");
            print("Submitting form password ${state.password}");
          */

          /*
          try {

            AppUser authenticatedUser = await _authenticationRepository.login(
            username: state.username, 
            password: state.password
            );

            await _userRepository.persistAuthenticationCredentials(authenticUser:authenticatedUser);
            
            /*
            await _authenticationRepository.login(
              username: state.username.value,
              password: state.password.value
            );
            */

            //show status submissionSuccess
            emit(LoginSubmittedDoneWithOk());
            print("submission outcome A");

          }
          catch (e) {
            //show status submissionError
            print("submission outcome B with message ${e.toString()}");
            emit(LoginSubmittedDoneWithError());
          }
          */

        }
        
    });

    /*
    on<>((event, emit) {
     
    });

    on<>((event, emit) {
     
    });
    */
    
  }

  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;
}
