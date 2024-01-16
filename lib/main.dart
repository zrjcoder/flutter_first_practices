import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/app.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage();

  runApp(ProviderScope(child: MyApp()));
}
