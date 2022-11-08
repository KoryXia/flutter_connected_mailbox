import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor:
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? const Color(0XFFA2C036)
                  : const Color(0XFF3D4C00),
          radius: 50,
          child: const Text(
            'JM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
        const Text(
          'Julian Mac',
          style: TextStyle(
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
        const Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              '0601020304',
            ),
          ),
        ),
        const Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: ListTile(
            leading: Icon(Icons.email),
            title: Text(
              'isep@gmail.com',
            ),
          ),
        ),
        const Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: ListTile(
            leading: Icon(Icons.my_location),
            title: Text(
              '6 boulevard jourdan, 75014 Paris, France',
            ),
          ),
        ),
        const SizedBox(height: 35),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: OutlinedButton(onPressed: () {}, child: Text('logout'.tr)),
        )
      ],
    );
  }
}
