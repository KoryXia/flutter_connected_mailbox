import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_connected_mailbox/controller/UserController.dart';
import 'package:flutter_connected_mailbox/pages/MainPage.dart';
import 'package:flutter_connected_mailbox/pages/Webview.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 200,
          child: Image.asset('logo-NORALSY-2022.png'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const SizedBox(
                  height: 60,
                  child: Icon(
                    Icons.person,
                    size: 66,
                    color: Color(0XFFA2C036),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        labelText: 'phone'.tr,
                        hintText: 'phone_input'.tr),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'empty_input'.tr;
                      }
                      if (value.replaceAll(RegExp(r"^0[1-9]\d{8}"), '') != '') {
                        return 'phone_input'.tr;
                      }
                      return null;
                    },
                    controller: _phone,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      labelText: 'password'.tr,
                      hintText: 'password_input'.tr,
                    ),
                    obscureText: true,
                    controller: _password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'empty_input'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      child: Text(
                        'forget'.tr,
                        style: const TextStyle(
                          color: Color(0XFFA2C036),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Get.to(() => const WebView(), arguments: 'https://www.noralsy.com/password-reset/');
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('loading'.tr),
                                duration: const Duration(milliseconds: 500)),
                          );
                          Get.find<UserController>()
                              .login(_phone.value.text, _password.value.text)
                              .then((value) {
                            value ? Get.to(() => const MainPage()) : null;
                          });
                        }
                      },
                      child: Text('login'.tr)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
