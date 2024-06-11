import 'package:app_runner/app_runner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:kaskazini/util/service_locator.dart';

class CustomWidgetsFlutterBinding extends WidgetsFlutterBinding {}

String returnOk = "INIT_OK";
String returnError = "INIT_ERR";

Future <void> main() async {

  final WidgetConfiguration widgetConfiguration = WidgetConfiguration(
    child: AppBuilder<String>(
      preInitialize: (WidgetsBinding binding) async {

        Bloc.observer = DevAppBlocObserver();
        await registerServiceLocatorDependencies();

        return returnOk;
        
      },
      builder: (
        BuildContext context,
        AsyncSnapshot<String?> snapshot,
        Widget? child,
        ) {

          late final Widget widgetToDisplayFirst;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              widgetToDisplayFirst = const KaskaSplash(); // show Splash
              continue display;
            case ConnectionState.done:

              final String? data = snapshot.data; // data from preInitialize
              
              if(data==returnOk){
                final authBloc = getIt<AuthenticationBloc>();
                authBloc.add(AppStartedEvent());
                widgetToDisplayFirst = KaskaApp(); 
              }
              else{
                widgetToDisplayFirst = const KaskaSplash(showError: true);
              }
              
              // show App
              continue display;

            display:
            default:
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: widgetToDisplayFirst,
            );

          }
          

      }),

      onFlutterError: (FlutterErrorDetails errorDetails) {

      log(
        errorDetails.toStringShort(),
        name: 'onFlutterError',
        stackTrace: errorDetails.stack,
        error: errorDetails.exception,
      );

    },
    //errorBuilder: ,
    //releaseErrorBuilder: ,
    initializeBinding: () => CustomWidgetsFlutterBinding(),
  );

  final ZoneConfiguration zoneConfiguration = ZoneConfiguration(
    
    onZoneError: (Object error, StackTrace stackTrace) {

      log(
        error.runtimeType.toString(),
        name: 'onZoneError',
        stackTrace: stackTrace,
        error: error,
      );
    },
  );

  appRunner(
    kIsWeb
        ? RunnerConfiguration(
          widgetConfig: widgetConfiguration,
          onPlatformError: (Object exception, StackTrace stackTrace) {
              log(
                exception.runtimeType.toString(),
                name: 'onPlatformError',
                stackTrace: stackTrace,
                error: exception,
              );
              return false;
            },
        )
        : RunnerConfiguration.guarded(
            widgetConfig: widgetConfiguration,
            zoneConfig: zoneConfiguration,
          ),
  );

}
