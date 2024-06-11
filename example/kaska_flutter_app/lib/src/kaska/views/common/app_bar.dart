import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

AppBar getAppBar(BuildContext context, TabsRouter tabsRouter){

  final AppRouter appRouter = GetIt.instance<AppRouter>();
  final bool showBack = true;


  return AppBar(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    shadowColor: null,
    elevation: 0.5,
    automaticallyImplyLeading: true,
    leadingWidth: 50,
    leading: showBack ? GestureDetector(
      onTap: (){
        //appRouter.navigate(ChatHomeRoute());
        appRouter.navigateBack();
      },
      child: const Padding(
        padding: EdgeInsets.only(left:8.0),
        child: Text("<", style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
          ),),
      ),
    ): null,
    title: const Text("< Kaska", style: TextStyle(
      fontSize: 16,

      color: Color.fromARGB(0, 0, 0, 0),

      ),),

    actions: const [],
  );
}
  