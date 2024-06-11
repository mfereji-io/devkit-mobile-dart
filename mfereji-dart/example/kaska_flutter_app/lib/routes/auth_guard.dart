import 'package:kaskazini/util/service_locator.dart';

class AppAuthGuard extends AutoRouteGuard {
  AppAuthGuard({required this.authBloc});

  final AuthenticationBloc authBloc;
  
   @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if(authBloc.state is AuthenticationAuthenticated)
    {
      resolver.next();
    }else{
      resolver.next(false);
    }
  }

}