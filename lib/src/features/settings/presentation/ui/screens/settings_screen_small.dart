import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreenSmall extends ConsumerStatefulWidget {
  const SettingsScreenSmall({super.key});

  @override
  ConsumerState<SettingsScreenSmall> createState() =>
      _SettingsScreenSmallState();
}

class _SettingsScreenSmallState extends ConsumerState<SettingsScreenSmall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isSmallScreen
          ? AppBar(
              centerTitle: true,
              title: const Text('设置'),
            )
          : null,
      body: const Center(
        child: Text('设置'),
      ),
    );
  }
}
