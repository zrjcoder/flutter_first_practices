import 'dart:io';

import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/app.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage();

  FlipperClient flipperClient = FlipperClient.getDefault();
  flipperClient.addPlugin(
    FlipperNetworkPlugin(filter: (HttpClientRequest request) {
      String url = '${request.uri}';
      if (url.startsWith('https://via.placeholder.com') ||
          url.startsWith('https://gravatar.com')) {
        return false;
      }
      return true;
    }),
  );
  flipperClient.addPlugin(new FlipperReduxInspectorPlugin());
  flipperClient.addPlugin(new FlipperSharedPreferencesPlugin());
  flipperClient.start();

  await Future.delayed(Duration(seconds: 1));

  runApp(ProviderScope(child: MyApp()));
}
