import 'package:get/get.dart';

class AppConfigController extends GetxController {
  var navigationBarIndex = 0.obs;

  void setNavigationBarIndex(int value) {
    navigationBarIndex.value = value;
  }
}