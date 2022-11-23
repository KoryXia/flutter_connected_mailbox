import 'package:flutter_connected_mailbox/utils/DioUtil.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/model/User.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  var user = User().obs;
  final box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    getUserInfo();
  }

  void saveUser(User value) {
    if (value.data != null) {
      box.write("userId", value.data?.userId);
    }
  }

  void removeUser() {
    box.remove("userId");
  }

  Future<bool> login(String phone, String password) async {
    user.value = await DioUtil().login(phone, password).then((value) {
      saveUser(value);
      return value;
    });
    if (user.value.data != null) {
      return true;
    }
    return false;
  }

  void getUserInfo() async {
    if (box.hasData('userId')) {
      user.value = await DioUtil().getUserInfo(box.read('userId'));
    }
  }

  String joinAddress() {
    if (user.value.data != null) {
      String address = user.value.data?.address ?? '';
      String postalCode = user.value.data?.postalCode ?? '';
      String city = user.value.data?.city ?? '';
      String country = user.value.data?.country ?? '';
      return '$address, $postalCode $city, $country';
    }
    return '';
  }

  String getAbbreviation() {
    if (user.value.data != null) {
      String name = user.value.data?.name ?? '';
      List<String> names = name.split(' ');
      return names[0].substring(0, 1) + names[1].substring(0, 1);
    }
    return '';
  }
}
