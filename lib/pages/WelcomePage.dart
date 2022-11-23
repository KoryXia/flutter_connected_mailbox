import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/pages/LoginPage.dart';
import 'package:flutter_connected_mailbox/pages/MainPage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            SizedBox(
              child: Image.asset(
                'logo-NORALSY-2022.png',
                height: 100,
                width: 300,
              ),
            ),
            const SizedBox(height: 200)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      var box = GetStorage();
      if (box.hasData('userId')) {
        Get.offAll(() => const MainPage(),
            transition: Transition.zoom,
            duration: const Duration(milliseconds: 500));
      } else {
        Get.offAll(() => const LoginPage(),
            transition: Transition.zoom,
            duration: const Duration(milliseconds: 500));
      }
    });
  }
}
