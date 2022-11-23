import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_connected_mailbox/model/MailboxList.dart';
import 'package:flutter_connected_mailbox/utils/DioUtil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/pages/LoginPage.dart';

import '../firebase_options.dart';

class MailboxListController extends GetxController {
  final box = GetStorage();
  late final String _id;
  var isLoading = true.obs;
  var mailboxList = MailboxList().obs;


  @override
  void onInit() async{
    super.onInit();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    final fcmToken = await FirebaseMessaging.instance.getToken();
    firebaseInit(fcmToken!);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @override
  void onReady() async{
    super.onReady();
    if (box.hasData('userId')) {
      _id = box.read('userId');
    }
    getMailboxList();
  }


  void getMailboxList() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 500));
      mailboxList.value = await DioUtil().getMailboxList(_id);
    } finally {
      isLoading.value = false;
    }
  }
  void firebaseInit(String fcmToken) async{
    print('token: $fcmToken');
    if(box.hasData('auth')) {
      await DioUtil().checkToken(_id, fcmToken).then((value) {
        if(value == 'diff') {
          box.remove('auth');
          box.remove('userId');
          Get.offAll(() => const LoginPage());
        }
      });
    } else {
      await DioUtil().updateToken(_id, fcmToken);
      box.write('auth', true);
    }
  }
  void showFlutterNotification(RemoteMessage message) {
    final lang = box.read('lang');
    print('Got a message whilst in the foreground!');
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
      Get.snackbar(
        lang == 'fr'? 'Nouvelle lettre!' : 'New letter!',
        lang == 'fr'? 'Cliquez sur moi pour cliquer' : 'Click me to check.',
        icon: const Icon(Icons.notifications),
        barBlur: 10,
      );
      getMailboxList();
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}