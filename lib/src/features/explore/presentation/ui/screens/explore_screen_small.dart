import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreScreenSmall extends ConsumerStatefulWidget {
  const ExploreScreenSmall({super.key});

  @override
  ConsumerState<ExploreScreenSmall> createState() => _ExploreScreenSmallState();
}

class _ExploreScreenSmallState extends ConsumerState<ExploreScreenSmall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isSmallScreen
          ? AppBar(
              centerTitle: true,
              title: const Text('探索'),
            )
          : null,
      body: const Center(
        child: Text('探索'),
      ),
    );
  }
}
