import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final AuthenticationBloc authBloc = GetIt.instance<AuthenticationBloc>();
  final AppRouter appRouter = GetIt.instance<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      
      bloc: authBloc,
      listener:(context, state){
        if(state is AuthenticationUnauthenticated){
          appRouter.replace(AuthLoginRoute());
        }
      },
      builder:(context, state){
        return Column(
        children:  [
          const SizedBox(height:50),
          const Text("Kaskazini Account Page"),
          const SizedBox(height:50),
            FilledButton(
            child: const Text("Logout"),
            onPressed: (){
              authBloc.add(LogoutRequestedEvent());
            },
          ),
          const SizedBox(height:50),

        ]); 
      });


    

  }

}