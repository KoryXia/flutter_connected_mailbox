import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/components/MailboxListView.dart';
import 'package:flutter_connected_mailbox/components/UserInfoView.dart';
import 'package:flutter_connected_mailbox/controller/AppConfigController.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  Widget getBody() {
    return Get.find<AppConfigController>().navigationBarIndex.value == 0
        ? const MailboxListView()
        : const UserInfoView();
  }

  void init() {}

  @override
  Widget build(BuildContext context) {
    init();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text(
              'NORALSY',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex:
                Get.find<AppConfigController>().navigationBarIndex.value,
            onTap: (value) {
              Get.find<AppConfigController>().navigationBarIndex(value);
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
            onPressed: () {},
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
                    child: Text('setting'.tr, style: const TextStyle(fontSize: 35)),
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
                        onTap: () => Get.find<AppConfigController>().changeLang('fr','FR'),
                      ),
                      const Divider(height: 1,thickness: 1),
                      ListTile(
                        title: const Text('English'),
                        trailing:
                            Get.find<AppConfigController>().currentLang.value ==
                                    'en'
                                ? const Icon(Icons.check)
                                : null,
                        onTap: () => Get.find<AppConfigController>().changeLang('en','US'),
                      )
                    ],
                  ),
                  const Divider(height: 1,thickness: 1),
                  ExpansionTile(
                    leading:
                        Get.find<AppConfigController>().currentMode.value ==
                                'light'
                            ? const Icon(Icons.light_mode)
                            : const Icon(Icons.dark_mode),
                    title: Text('theme'.tr),
                    children: [
                      ListTile(
                        title: Text('light_mode'.tr),
                        onTap: () => Get.find<AppConfigController>().changeMode('light'),
                        trailing:
                            Get.find<AppConfigController>().currentMode.value ==
                                    'light'
                                ? const Icon(Icons.check)
                                : null,
                      ),
                      const Divider(height: 1,thickness: 1),
                      ListTile(
                        title: Text('dark_mode'.tr),
                        onTap: () => Get.find<AppConfigController>().changeMode('dark'),
                        trailing:
                            Get.find<AppConfigController>().currentMode.value ==
                                    'dark'
                                ? const Icon(Icons.check)
                                : null,
                      )
                    ],
                  )
                ],
              ),
            );
          }),
          body: SafeArea(
            child: getBody(),
          ),
        ));
  }
}
