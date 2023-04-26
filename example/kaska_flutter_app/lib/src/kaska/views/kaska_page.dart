import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

class KaskaPage extends StatelessWidget {
  KaskaPage({Key? key} ):super(key: key);

  final AuthenticationBloc authBloc = GetIt.instance<AuthenticationBloc>();
  
  
  @override
  Widget build(BuildContext context) {

    return Container(
      child: const Text("Wecome back "),
    );

  }

}