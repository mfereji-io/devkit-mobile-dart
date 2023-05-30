import 'package:kaskazini/util/service_locator.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',

  routes: <AutoRoute>[

    RedirectRoute(path: '/', redirectTo: '/intro'),

    AutoRoute(path: '/login', page: AuthLoginPage),
    AutoRoute(path: '/auth-wait-login', page: AuthWaitLoginPage),
    AutoRoute(path: '/auth-wait-logout', page: AuthWaitLogoutPage),
    AutoRoute(path: '/auth-error', page: AuthErrorPage),

    AutoRoute(
      path: '/intro',
      page: IntroWrapperPage,
      name: "IntroRoute",
      children: [
        AutoRoute<dynamic>(
          path: 'appinit',
          page: EmptyRouterPage,
          name: 'AppInitRouter',
          //initial: true,
          children:[
            AutoRoute<dynamic>(
              path: '',
              page: AppInitPage,
            ),
          ]
        ),
        
      ]

    ),

    
    AutoRoute<dynamic>(
      path: '/kaskazini',
      page: MainAppPage,
      name: 'MainAppRouter',
      guards: [
        AppAuthGuard,
      ],
      children:[
        AutoRoute<dynamic>(
          path: 'kaska',
          page: EmptyRouterPage,
          name: 'KaskaRouter',
          //initial: true,
          children:[
            AutoRoute<dynamic>(
              path: '',
              page: KaskaPage,
            ),
          ],
        ),
        AutoRoute<dynamic>(
          path: 'chat',
          page: EmptyRouterPage,
          name: 'ChatRouter',
          initial: true,
          children:[
            AutoRoute<dynamic>(
              path: 'home',
              page: ChatHomePage,
              initial: true,
            ),
            AutoRoute<dynamic>(
              path: 'group',
              page: ChatPage,
              //initial: true,
            ),
            /*
            AutoRoute<dynamic>(
              path: 'home',
              page: ChatHomePage,
              initial: true,
            ),
            */
            
            
            
            
            
          ],
        ),
        AutoRoute<dynamic>(
          path: 'account',
          page: EmptyRouterPage,
          name: 'AccountRouter',
          initial: false,
          children:[
            AutoRoute<dynamic>(
              path: '',
              page: AccountPage,
            ),
          ],
        ),
      ]
    ),
    

  ])
class $AppRouter {}