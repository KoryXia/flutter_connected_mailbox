import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/pages/QRcodePage.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/components/MailboxListView.dart';
import 'package:flutter_connected_mailbox/components/UserInfoView.dart';
import 'package:flutter_connected_mailbox/controller/AppConfigController.dart';
import 'package:flutter_connected_mailbox/pages/BlueToothPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text(
              'NORALSY',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex:
                Get.find<AppConfigController>().navigationBarIndex.value,
            onTap: (value) {
              Get.find<AppConfigController>().navigationBarIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(
                label: 'mailbox'.tr,
                icon: const Icon(Icons.mail),
              ),
              const BottomNavigationBarItem(
                label: 'Info',
                icon: Icon(Icons.person),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.to(() => BlueToothPage(title: 'Select the interphone',)),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          drawer: Obx(() {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Text('setting'.tr,
                        style: const TextStyle(fontSize: 35)),
                  ),
                  ExpansionTile(
                    leading: const Icon(Icons.language),
                    title: Text('lang'.tr),
                    children: [
                      ListTile(
                        title: const Text('Français'),
                        trailing:
                            Get.find<AppConfigController>().currentLang.value ==
                                    'fr'
                                ? const Icon(Icons.check)
                                : null,
                        onTap: () => Get.find<AppConfigController>()
                            .changeLang('fr', 'FR'),
                      ),
                      const Divider(height: 1, thickness: 1),
                      ListTile(
                        title: const Text('English'),
                        trailing:
                            Get.find<AppConfigController>().currentLang.value ==
                                    'en'
                                ? const Icon(Icons.check)
                                : null,
                        onTap: () => Get.find<AppConfigController>()
                            .changeLang('en', 'US'),
                      )
                    ],
                  ),
                  const Divider(height: 1, thickness: 1),
                ],
              ),
            );
          }),
          body: SafeArea(
            child: getBody(),
          ),
        ));
  }

  Widget getBody() {
    return Get.find<AppConfigController>().navigationBarIndex.value == 0
        ? const MailboxListView()
        : const UserInfoView();
  }
}
