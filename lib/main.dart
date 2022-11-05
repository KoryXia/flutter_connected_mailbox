import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/controller/AllControllersBinding.dart';
import 'package:flutter_connected_mailbox/pages/MainPage.dart';
import 'package:flutter_connected_mailbox/theme/color_schemes.g.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/config/LocaleString.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      initialBinding: AllControllersBinding(),
      translations: LocaleString(),
      locale: const Locale('fr', 'FR'),
      fallbackLocale: const Locale('fr', 'FR'),
      home: const MainPage(),
    );
  }
}
