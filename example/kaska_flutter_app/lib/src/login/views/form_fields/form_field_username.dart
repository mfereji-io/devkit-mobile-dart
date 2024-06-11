import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';

class UsernameInput extends StatelessWidget {
  UsernameInput({super.key});

  final loginBloc = getIt<LoginBloc>();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc, LoginState>(
      bloc: loginBloc,
      buildWhen: (previous, current) => previous.username != current.username,
      builder:(context, state){

        return TextField(
          decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Username',
          ),
          onChanged: (username){
            loginBloc.add(LoginUsernameChanged(username));
          },
        );
        
      }
    );
  }

}

