import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/controller/UserController.dart';
import 'package:flutter_connected_mailbox/pages/LoginPage.dart';
import 'package:get/get.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? const Color(0XFFA2C036)
                      : const Color(0XFF3D4C00),
              radius: 50,
              child: Text(
                Get.find<UserController>().getAbbreviation(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            Text(
              Get.find<UserController>().user.value.data?.name ?? '',
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
            SizedBox(
              width: 250,
              height: 35,
              child: Divider(
                color: Colors.teal.shade600,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  Get.find<UserController>().user.value.data?.phone ?? '',
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.email),
                title: Text(
                  Get.find<UserController>().user.value.data?.email ?? '',
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.my_location),
                title: Text(
                  Get.find<UserController>().joinAddress(),
                ),
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: OutlinedButton(
                  onPressed: () {
                    Get.find<UserController>().removeUser();
                    // Get.reset();
                    Get.offAll(() => const LoginPage());
                  },
                  child: Text('logout'.tr)),
            )
          ],
        ));
  }
}
