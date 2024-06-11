import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  //final AppRouter appRouter = GetIt.instance<AppRouter>();
  //final loginBloc = getIt<LoginBloc>();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
        
            child: Column(
              children:  [
        
                const SizedBox(height:50),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Image.asset(
                      'assets/img/login/login_icon.png',
                    ),
        
                  ],
                ),
                
                const SizedBox(height:50),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width:40),
                    Expanded(
                      child: UsernameInput(),
                    ),
                    const SizedBox(width:40),
                  ]
                ),
        
                const SizedBox(height:20),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width:40),
                    Expanded(
        
                      child: PasswordInput(),
                    
                    ),
                    const SizedBox(width:40),
                  ]
                ),
        
                const SizedBox(height:30),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width:100),
                    Expanded(
                      child: SubmitButtonInput(),
                    
                    ),
                    const SizedBox(width:100),
                  ],
                ),
        
                const SizedBox(height:30),
        
              ],
              
            ),
        
          ),
        )
      ),
    );

  }

  
}