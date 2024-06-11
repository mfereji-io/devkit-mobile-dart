import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

class AuthLoginPage extends StatelessWidget {
  AuthLoginPage({super.key});

  final AppRouter appRouter = GetIt.instance<AppRouter>();
  final loginBloc = getIt<LoginBloc>();
  final authBloc = getIt<AuthenticationBloc>();
  
  @override
  Widget build(BuildContext context) {
    
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      bloc: authBloc,
      listener:(context, state){
        
        if(state is AuthenticationAuthenticated){

          appRouter.replace(const MainAppRouter());

        }
        
        
      },

      child: LoginForm(),

    );
  }
}