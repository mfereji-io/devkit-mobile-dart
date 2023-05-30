import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaskazini/util/service_locator.dart';

class IntroWrapperPage extends StatelessWidget {
  IntroWrapperPage({Key? key,
  }): super(key: key);

  final AppRouter appRouter = GetIt.instance<AppRouter>();
  final AuthenticationBloc authBloc = GetIt.instance<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: authBloc,
      listener:(context, state) async {

        //await Future.delayed(const Duration(seconds: 1));
        print("IntroWrapperPage listen with state $state");
        
        if (state is AuthenticationUnauthenticated){
          appRouter.replace(AuthLoginRoute());
        }else if(state is AuthenticationAuthenticated){
          appRouter.replace(const MainAppRouter());
        }
        
      },
      builder:(context, state){

        print("IntroWrapperPage build with state $state");

        if(state is AuthenticationUninitialized){
          appRouter.push(const AppInitRouter());
        }else if (state is AuthenticationUnauthenticated){
          appRouter.replace(AuthLoginRoute());
        }else if(state is AuthenticationAuthenticated){
          appRouter.replace(const MainAppRouter());
        }

        return const AutoRouter();
      }
    );

  }

}