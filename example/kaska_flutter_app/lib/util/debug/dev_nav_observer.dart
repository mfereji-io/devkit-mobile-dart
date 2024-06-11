import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class DevNavObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {

    print('');
    print('-----');
    if (previousRoute != null) {
      print('Previous route: ${previousRoute.settings.name}');
    } else {
      print('Previous route: NULL');
    }
    print('New route pushed: ${route.settings.name}');
    print('-----');
    print('');

  }

  @override
  void didPop(Route route, Route? previousRoute) {
    
    print('');
    print('-----');

    if (previousRoute != null) {
      print('Previous route: ${previousRoute.settings.name}');
    } else {
      print('Previous route: NULL');
    }
    print('New route popped: ${route.settings.name}');
    print('-----');
    print('');

  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('');
    print('-----');
    print('Tab route visited: ${route.name}');
    print('-----');
    print('');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('');
    print('-----');
    print('Tab route re-visited: ${route.name}');
    print('-----');
    print('');
  }
}
