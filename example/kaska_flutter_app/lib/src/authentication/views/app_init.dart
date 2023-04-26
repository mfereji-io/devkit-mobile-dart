import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

class AppInitPage extends StatelessWidget {
  AppInitPage({super.key});

  final AppRouter appRouter = GetIt.instance<AppRouter>();
  final authBloc = getIt<AuthenticationBloc>();
  
  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      bloc: authBloc,
      listener:(context, state){
        print("AppInitPage listener with state $state");
      },
      child:_getPageContent()
    );

  }

  Widget _getPageContent(){

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: const [
              SizedBox(height:200),
              CircularProgressIndicator(),
              SizedBox(height:200),
              Text("...Initializing..."),
              SizedBox(height:200),
            ],
          ),
        )
      ),
    );

  }

}
