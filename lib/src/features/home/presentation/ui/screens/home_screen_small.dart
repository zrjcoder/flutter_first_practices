import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/extensions/context_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenSmall extends ConsumerStatefulWidget {
  const HomeScreenSmall({super.key});

  @override
  ConsumerState<HomeScreenSmall> createState() => _HomeScreenSmallState();
}

class _HomeScreenSmallState extends ConsumerState<HomeScreenSmall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isSmallScreen
          ? AppBar(
              centerTitle: true,
              title: const Text('首页'),
            )
          : null,
      body: const Center(
        child: Text('首页'),
      ),
    );
  }
}
