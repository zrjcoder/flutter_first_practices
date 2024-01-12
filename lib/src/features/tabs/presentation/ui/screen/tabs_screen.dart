import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_application_hello/src/features/tabs/presentation/ui/screen/tabs_screen_small.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return const PopScope(
        child: ResponsiveWidget(smallScreen: TabsScreenSmall()),);
  }
}
