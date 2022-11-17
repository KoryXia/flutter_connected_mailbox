import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_connected_mailbox/pages/MainPage.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  bool isSwitched = false;

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 200,
          child: Image.network(
              'https://www.noralsy.com/wp-content/uploads/2022/03/logo-NORALSY-2022.png'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.8,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Icon(Icons.phone),
                  Container(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('save my phone number'.tr),
                  Switch(value: isSwitched, onChanged: (value) {})
                ],
              ),
              Row(
                children: [
                  Icon(Icons.lock),
                  Container(
                    width: 300,
                    child: TextField(
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const MainPage());
                    }, child: Text('login_in'.tr)),
              )

            ],
          ),
        ),
      ),
    );
  }
}
