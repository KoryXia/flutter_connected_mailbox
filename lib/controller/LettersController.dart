import 'package:flutter_connected_mailbox/model/Letters.dart';
import 'package:get/get.dart';

import 'package:flutter_connected_mailbox/utils/DioUtil.dart';

class LettersController extends GetxController {

  var letters = Letters().obs;

  @override
  void onReady() {
    super.onReady();
  }

  void closureLetters(String id) {
    getLetters(id);
  }
  void getLetters(String id) async {
      letters.value = await DioUtil().getLetters(id);
  }
}