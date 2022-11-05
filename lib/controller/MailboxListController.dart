import 'package:flutter_connected_mailbox/model/MailboxList.dart';
import 'package:flutter_connected_mailbox/utils/DioUtil.dart';
import 'package:get/get.dart';

class MailboxListController extends GetxController {
  final String _id = '28cac31a-6b43-4f8b-b492-bdc0faf94b4c';
  var isLoading = true.obs;
  var mailboxList = MailboxList().obs;


  @override
  void onReady() {
    super.onReady();
    getMailboxList();
  }

  void getMailboxList() async{
    try
    {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 500));
      mailboxList.value = await DioUtil().getMailboxList(_id);
    } finally{
      isLoading.value = false;
    }
  }

}