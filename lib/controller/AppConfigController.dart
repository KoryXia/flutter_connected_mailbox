import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/theme/color_schemes.g.dart';
import 'package:get_storage/get_storage.dart';

class AppConfigController extends GetxController {
  var navigationBarIndex = 0.obs;
  var currentMode = ''.obs;
  var currentLang = ''.obs;
  final box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    initMode();
    initLang();
  }

  void initMode() {
    if (box.hasData('mode') == true) {
      currentMode.value = box.read('mode');
    } else {
      box.write('mode', 'light');
      currentMode.value = 'light';
    }
  }

  void changeMode(String mode) {
    if (currentMode.value != mode) {
      currentMode.value = mode;
      box.write('mode', mode);
      switch (mode) {
        case 'light':
          Get.changeTheme(ThemeData(useMaterial3: true, colorScheme: lightColorScheme));
          break;
        case 'dark':
          Get.changeTheme(ThemeData(useMaterial3: true, colorScheme: darkColorScheme));
          break;
      }
    }
  }

  void initLang() {
    if (box.hasData('lang') == true) {
      currentLang.value = box.read('lang');
    } else {
      box.write('lang', 'fr');
      currentLang.value = 'fr';
    }
  }

  void changeLang(String langCode, String countryCode) {
    if (currentLang.value != langCode) {
      var locale = Locale(langCode, countryCode);
      currentLang.value = langCode;
      Get.updateLocale(locale);
      box.write('lang', langCode);
    }
  }
}
