import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppConfigController extends GetxController {
  var navigationBarIndex = 0.obs;
  var currentLang = ''.obs;
  final box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    initLang();
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
