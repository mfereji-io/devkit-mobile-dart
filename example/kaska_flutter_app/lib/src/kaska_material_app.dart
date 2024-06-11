import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaskazini/util/service_locator.dart';
import 'package:kaskazini/theme/theme_mobile.dart';

class KaskaApp extends StatelessWidget {
  KaskaApp({Key? key,}) : super(key: key);

  static const debugShowCheckedModeBanner = false;
  final AppRouter appRouter = GetIt.instance<AppRouter>();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent),
    );

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      //designSize: const Size(375, 750),
      minTextAdapt: true,
      builder: (context , child){
        return MaterialApp.router(
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          themeMode: ThemeMode.system,
          theme: kaskaTheme,
          darkTheme: kaskaThemeDark,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [ DevNavObserver() ],
            ),
            
        );

    },
    child: Container(
      color: Colors.amberAccent,
      child: const Text("Test child"),
      ));
    }
  }