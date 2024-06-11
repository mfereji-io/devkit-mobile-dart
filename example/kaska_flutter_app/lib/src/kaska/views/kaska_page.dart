import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

//final AuthenticationBloc authBloc = GetIt.instance<AuthenticationBloc>();
class KaskaPage extends StatelessWidget {
  KaskaPage({Key? key} ):super(key: key);

  
  String firstname = authBloc.state.authenticatedUser.firstname;
  String lastname = authBloc.state.authenticatedUser.lastname;
  
  
  @override
  Widget build(BuildContext context) {

    //Establish the state of Chat Connection

    return Container(
      child: Column(
        children: [
          Center(child: Text("Welcome back, $firstname $lastname",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          )),
        ],
      ),
    );

  }

}