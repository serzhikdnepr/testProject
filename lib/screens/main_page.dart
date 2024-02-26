import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_project/router/router.gr.dart';

import '../../generated/l10n.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  @override
  Widget build(context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        ProfilePage()
      ],
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, controller) {
        return Scaffold(
          body: child,
          bottomNavigationBar: buildBottomNav(context, context.tabsRouter),
        );
      },
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    final hideBottomNav = tabsRouter.topMatch.meta['hideBottomNav'] == true;
    return hideBottomNav
        ? SizedBox.shrink()
        : BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      backgroundColor: Colors.white,
      onTap: (index) {
        tabsRouter.setActiveIndex(index);
      },
      items: [
        BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: S.of(context).home,
              ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: S.of(context).profile,
        ),

            ],
          );
  }
}
