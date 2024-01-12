import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreenSmall extends ConsumerWidget {
  const TabsScreenSmall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ExploreRoute(),
        SettingsRoute(),
      ],
      builder: (context, childe) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: childe,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.cyan,
            unselectedItemColor: Colors.grey[500],
            elevation: 20,
            type: BottomNavigationBarType.fixed,
            onTap: tabsRouter.setActiveIndex,
            currentIndex: tabsRouter.activeIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
              BottomNavigationBarItem(icon: Icon(Icons.explore), label: '探索'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
            ],
          ),
        );
      },
    );
  }
}
