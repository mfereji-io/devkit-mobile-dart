import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordInput extends StatelessWidget {
  PasswordInput({super.key});

  final loginBloc = getIt<LoginBloc>();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc, LoginState>(
      bloc: loginBloc,
      //buildWhen: (previous, current) => previous.username != current.username,
      builder:(context, state){

        return TextField(
          obscureText: true,
          decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Password',
          ),
          onChanged: (password){
            loginBloc.add(LoginPasswordChanged(password));
          },
        );
        
      }
    );
  }

}

