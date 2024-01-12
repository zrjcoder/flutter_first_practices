import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_application_hello/src/common/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentAppTheme = ref.watch();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BOOK',
      theme: lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
