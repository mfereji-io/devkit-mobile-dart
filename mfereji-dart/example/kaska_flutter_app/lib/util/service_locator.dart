import 'package:get_it/get_it.dart';
export 'package:get_it/get_it.dart';

export 'package:equatable/equatable.dart';

export 'package:dio/dio.dart';

export 'package:flutter_secure_storage/flutter_secure_storage.dart';

//import 'package:kaskazini/src/config/app_config.dart';
export 'package:kaskazini/src/config/app_config.dart';

export 'package:auto_route/auto_route.dart';
export 'package:auto_route/empty_router_widgets.dart';
export 'package:kaskazini/routes/routes.dart';

import 'package:kaskazini/routes/routes.gr.dart';
export 'package:kaskazini/routes/routes.gr.dart';

import 'package:kaskazini/routes/auth_guard.dart';
export 'package:kaskazini/routes/auth_guard.dart';

//Export debug files
export 'package:kaskazini/util/debug/dev_app_bloc_observer.dart';
export 'package:kaskazini/util/debug/dev_nav_observer.dart';
export 'package:kaskazini/util/debug/logging.dart';

//export services
import 'package:kaskazini/src/authentication/services/auth_service.dart';
export 'package:kaskazini/src/authentication/services/auth_service.dart';

//export repos
import 'package:kaskazini/src/authentication/repository/authentication_repository.dart';
export 'package:kaskazini/src/authentication/repository/authentication_repository.dart';

import 'package:kaskazini/src/authentication/repository/user_repository.dart';
export 'package:kaskazini/src/authentication/repository/user_repository.dart';

//export blocs
export 'package:bloc/bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
//export 'package:hydrated_bloc/hydrated_bloc.dart';
export 'package:formz/formz.dart';

import 'package:kaskazini/src/login/bloc/login_bloc.dart';
export 'package:kaskazini/src/login/bloc/login_bloc.dart';

import 'package:kaskazini/src/authentication/bloc/authentication_bloc.dart';
export 'package:kaskazini/src/authentication/bloc/authentication_bloc.dart';

//Export the app views
export 'package:kaskazini/util/main_barrel.dart';

//#######################

import 'package:kaskazini/src/chat_client/client.dart';
export 'package:kaskazini/src/chat_client/client.dart';

import 'package:kaskazini/src/kaska/chat/bloc/chat_client_conn_status_bloc.dart';
export 'package:kaskazini/src/kaska/chat/bloc/chat_client_conn_status_bloc.dart';

//#######################
import 'package:kaskazini/src/kaska/chat/models/chat_channel.dart';
export 'package:kaskazini/src/kaska/chat/models/chat_channel.dart';

import 'package:kaskazini/src/kaska/chat/repository/chat_listing_repository.dart';
export 'package:kaskazini/src/kaska/chat/repository/chat_listing_repository.dart';

import 'package:kaskazini/src/kaska/chat/services/chat_listing_service.dart';
export 'package:kaskazini/src/kaska/chat/services/chat_listing_service.dart';

//#######################

final getIt = GetIt.instance;

Future<void> registerServiceLocatorDependencies() async {
  getIt.registerLazySingleton<AuthorizationService>(
      () => AuthorizationService());

  getIt.registerLazySingleton<UserRepository>(() => UserRepository());

  getIt.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepository(
          authorizationService: GetIt.instance<AuthorizationService>()));

  getIt.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc(
        userRepository: GetIt.instance<UserRepository>(),
        authenticationRepository: GetIt.instance<AuthenticationRepository>(),
      ));

  getIt.registerLazySingleton<LoginBloc>(() => LoginBloc(
        userRepository: GetIt.instance<UserRepository>(),
        authenticationRepository: GetIt.instance<AuthenticationRepository>(),
      ));

  getIt.registerSingleton<AppRouter>(
    AppRouter(
      appAuthGuard:
          AppAuthGuard(authBloc: GetIt.instance<AuthenticationBloc>()),
    ),
  );

  getIt.registerLazySingleton<ChatClient>(() => ChatClient());

  getIt.registerLazySingleton<ChatClientConnStatusBloc>(
      () => ChatClientConnStatusBloc(
            chatClient: GetIt.instance<ChatClient>(),
          ));

  getIt.registerLazySingleton<ChatListingService>(() => ChatListingService());

  getIt
      .registerLazySingleton<ChatListingRepository>(() => ChatListingRepository(
            chatListingService: GetIt.instance<ChatListingService>(),
          ));

  return;
}
