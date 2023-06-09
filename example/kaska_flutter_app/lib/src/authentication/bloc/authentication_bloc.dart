//
//import 'package:equatable/equatable.dart';
import 'package:kaskazini/util/service_locator.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';


ChatClientConnStatusBloc chatClientConnStatusBloc = GetIt.instance<ChatClientConnStatusBloc>();
        

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc({
    required UserRepository userRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository,
        super(AuthenticationUninitialized()) {

    on<AppStartedEvent>((event, emit) async {
      
      emit(AuthenticationInitializing());

      final userHasAuthenticationToken =
          await userRepository.hasAuthenticationToken();

      if (userHasAuthenticationToken) {

        AppUser authenticatedUser = await userRepository.getAuthenticatedUser();
        
        /*
        print("#################################");
        print("About to init conn status bloc");

        //Register Chat Client
        
        ChatClientConnStatusBloc chatClientConnStatusBloc = GetIt.instance<ChatClientConnStatusBloc>();
        chatClientConnStatusBloc.add(ChatClientInitRequestedEvent(
          chatToken: authenticatedUser.chatToken, 
        ));

        print("#################################");
        */

        emit(AuthenticationAuthenticated(authenticatedUser: authenticatedUser));

      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<LoginRequestedEvent>((event, emit) async {
      emit(AuthenticationLoading());

      try {
        AppUser authenticatedUser = await _authenticationRepository.login(
            username: event.username, password: event.password);

        await _userRepository.persistAuthenticationCredentials(
            authenticUser: authenticatedUser);

        final loginBloc = getIt<LoginBloc>();

        loginBloc.add(LoginResetRequested());

        //Register Chat Client
        //ChatClientConnStatusBloc chatClientConnStatusBloc = GetIt.instance<ChatClientConnStatusBloc>();
        
        chatClientConnStatusBloc.add(ChatClientInitRequestedEvent(
          chatToken: authenticatedUser.chatToken, 
        ));
        
        emit(AuthenticationAuthenticated(authenticatedUser: authenticatedUser));
        
      } catch (_) {
        emit(AuthenticationUnauthenticated());
      }
    });


    on<LogoutRequestedEvent>((event, emit) async {
      
      chatClientConnStatusBloc.add(ChatClientDisConnectRequestedEvent());
      emit(AuthenticationLoggingOut());

      emit(AuthenticationUnauthenticated());
    });

  }

  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;
}
