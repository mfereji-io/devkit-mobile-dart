import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';

class SubmitButtonInput extends StatelessWidget {
  SubmitButtonInput({super.key});

  final loginBloc = getIt<LoginBloc>();
  final authBloc = getIt<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {

    //return BlocBuilder<LoginBloc, LoginState>(
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      //bloc: loginBloc,
      bloc: authBloc,
      //buildWhen: (previous, current) => previous.username != current.username,
      builder:(context, state){

        //print("the submit button build state is $state");
        print("the auth bloc state is $state");


        if(state is AuthenticationLoading){
          
          return const Center(
            child: SizedBox(
              height:50,
              width: 50,
              child: const CircularProgressIndicator()
            ),
          );
          

        
        }else{
        
        
          return FilledButton(
            child: const Text("  Login  ",
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: (){

              if(loginBloc.state.status == FormValidityStatus.valid){
                  authBloc.add(LoginRequestedEvent(
                  username:loginBloc.state.username.value,
                  password:loginBloc.state.password.value,
                ));  

              }
              
              
            });

        }
      }
    );
  }

}



