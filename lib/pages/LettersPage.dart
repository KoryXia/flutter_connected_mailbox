import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/controller/LettersController.dart';
import 'package:flutter_connected_mailbox/model/Letters.dart';
import 'package:get/get.dart';

import '../controller/AppConfigController.dart';

class LettersPage extends StatelessWidget {
  LettersPage({Key? key}) : super(key: key);

  LettersController lettersController = Get.put(LettersController());

  Widget formDate(String lang, int index) {
    DateTime? time = lettersController.letters.value.data?[index].dateTime?.toLocal();
    String day = time?.day.toString()??"";
    String year = time?.year.toString()??"";
    String month = time?.month.toString()??"";
    String hour = time?.hour.toString()??"";
    String minute = time?.minute.toString()??"";
    if (hour.length == 1) {
      hour = '0$hour';
    }
    if (minute.length == 1) {
      minute = '0$minute';
    }
    if (lang == 'fr') {
      return Text('$day / $month / $year  $hour : $minute');
    } else {
      return Text('$year / $month / $day  $hour : $minute');
    }
  }

  @override
  Widget build(BuildContext context) {
    lettersController.closureLetters(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'letters'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Obx(() =>
          Center(
            child: ListView.separated(
              itemCount: lettersController.letters.value.data?.length ?? 0,
              itemBuilder: (context, index) {
                int length = lettersController.letters.value.data?.length ?? 0;
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFB4D347),
                    child: Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                    ),
                  ),
                  title: Get.find<AppConfigController>().currentLang.value ==
                      'fr'
                      ? formDate('fr', length - index - 1)
                      : formDate('en', length - index - 1),
                  trailing: Text((index + 1).toString()),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          )),
    );
  }
}