import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/router/router.gr.dart';
import 'auth_guard.dart';

final appRouterProvider = Provider<RootRouter>((ref) => RootRouter());

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class RootRouter  extends $RootRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
    reverseDurationInMilliseconds: 400,
    transitionsBuilder: (ctx, animation1, animation2, child) {

      print('Anim2 ${animation2.value}');
      return child;
    },
  );

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainPage.page,
      path: '/',
      guards: [AuthGuard()],
      children: [
        // RedirectRoute(path: '', redirectTo: 'books'),
        AutoRoute(
          path: 'homePage',
          page: HomeRoute.page,
          maintainState: true,
        ),
        AutoRoute(
          path: 'profilePage',
          page: ProfilePage.page,
          maintainState: false,
        ),

      ],
    ),
    AutoRoute(page: LoginPage.page, path: '/loginPage'),
    AutoRoute(page: LoadingRoute.page, path: '/loadingScreen'),
    AutoRoute(page: ErrorRoute.page, path: '/errorScreen'),
    AutoRoute(page: EditItemRoute.page, path: '/editItemScreen'),

    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}



