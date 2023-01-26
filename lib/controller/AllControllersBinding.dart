import 'package:flutter_connected_mailbox/controller/LettersController.dart';
import 'package:flutter_connected_mailbox/controller/UserController.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/controller/MailboxListController.dart';
import 'package:flutter_connected_mailbox/controller/AppConfigController.dart';

class AllControllersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MailboxListController>(() => MailboxListController(), fenix: true);
    Get.lazyPut<AppConfigController>(() => AppConfigController(), fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<LettersController>(() => LettersController(), fenix: true);
  }
}
