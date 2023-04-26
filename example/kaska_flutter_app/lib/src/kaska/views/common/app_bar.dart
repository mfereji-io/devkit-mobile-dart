import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

AppBar getAppBar(BuildContext context, TabsRouter tabsRouter){
  return AppBar(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    shadowColor: null,
    elevation: 0.5,
    automaticallyImplyLeading: false,
    title: const Text("Kaska", style: TextStyle(
      fontSize: 40,
      color: Color(0),

      ),),
    actions: const [],
  );
}
  