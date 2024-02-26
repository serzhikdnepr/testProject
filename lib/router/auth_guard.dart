import 'package:auto_route/auto_route.dart'; 
import 'package:test_project/router/router.gr.dart';
import 'package:test_project/utils/utils.dart';

import '../main.dart';
 

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    bool isUserRegister = prefs.getBool(AppKeys.isUserRegister)??false;
    if (isUserRegister) {
      resolver.next(true);
    } else {
      router.replaceAll([const LoginPage()]);

    }
  }
}



