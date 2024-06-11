import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

class MainAppPage extends StatelessWidget {
  const MainAppPage({Key? key,}): super(key: key);

     @override
  Widget build(BuildContext context) {

    return AutoTabsScaffold(
      
      routes: const [

        KaskaRouter(),

        ChatRouter(),

        AccountRouter()

      ],
      appBarBuilder: (context, tabsRouter )=>getAppBar(context, tabsRouter),
      bottomNavigationBuilder:(context, tabsRouter )=>getBottomNavbar(context, tabsRouter),
      resizeToAvoidBottomInset: true,
    );

  
  }
}