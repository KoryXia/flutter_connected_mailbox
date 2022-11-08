import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/controller/MailboxListController.dart';
import 'package:flutter_connected_mailbox/controller/AppConfigController.dart';

class AllControllersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MailboxListController>(() => MailboxListController());
    Get.lazyPut<AppConfigController>(() => AppConfigController());
  }
}
