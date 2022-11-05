import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/components/MailboxListView.dart';
import 'package:flutter_connected_mailbox/components/UserInfoView.dart';
import 'package:flutter_connected_mailbox/controller/AppConfigController.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  Widget getBody()  {
    if(Get.find<AppConfigController>().navigationBarIndex.value == 0) {
      return const MailboxListView();
    } else {
      return const UserInfoView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text(
          'NORALSY',
          style:
          TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: Get.find<AppConfigController>().navigationBarIndex.value,
        onTap: (value) {
          Get.find<AppConfigController>().setNavigationBarIndex(value);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text('profile'),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: getBody(),
      ),
    ));
  }
}
