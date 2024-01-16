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
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();

    items = [
      {
        'icon': Icons.dark_mode_outlined,
        'title': '夜间模式',
        'function': null,
      },
      {
        'icon': Icons.language_outlined,
        'title': 'GITHUB',
        'function': () {},
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isSmallScreen
          ? AppBar(
              centerTitle: true,
              title: const Text('设置'),
            )
          : null,
      body: Column(
        children: [
          if (!context.isSmallScreen)
            const SizedBox(
              height: 30,
            ),
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              if (items[index]['title'] == "夜间模式") {
                if (context.isPlatformDarkThemed) {
                  return const SizedBox.shrink();
                }
                return _ThemeSwitch(
                  icon: items[index]['icon'] as IconData,
                  title: items[index]['title'] as String,
                );
              }
              return ListTile(
                onTap: items[index]['function'] as Function(),
                leading: Icon(items[index]['icon'] as IconData),
                title: Text(items[index]['title'] as String),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ],
      ),
    );
  }
}

class _ThemeSwitch extends ConsumerWidget {
  final IconData icon;
  final String title;

  const _ThemeSwitch({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAppTheme = ref.watch(currentAppThemeNotifierProvider);

    return SwitchListTile(
      title: Text(title),
      value: currentAppTheme.value == CurrentAppTheme.dark,
      onChanged: (isDarkMode) {
        ref
            .read(currentAppThemeNotifierProvider.notifier)
            .updateCurrentAppTheme(isDarkMode);
      },
      secondary: Icon(icon),
    );
  }
}
