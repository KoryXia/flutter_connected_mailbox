import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/controller/AllControllersBinding.dart';
import 'package:flutter_connected_mailbox/pages/MainPage.dart';
import 'package:flutter_connected_mailbox/theme/color_schemes.g.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/config/LocaleString.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool lang = GetStorage().read('lang') == 'fr' || GetStorage().read('lang') == null;
  bool mode = GetStorage().read('mode') == 'light' || GetStorage().read('mode') == null;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: mode
          ? ThemeData(useMaterial3: true, colorScheme: lightColorScheme)
          : ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      initialBinding: AllControllersBinding(),
      translations: LocaleString(),
      locale: lang ? const Locale('fr', 'FR') : const Locale('en', 'US'),
      fallbackLocale: const Locale('fr', 'FR'),
      home: const MainPage(),
    );
  }
}
