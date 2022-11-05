import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/controller/MailboxListController.dart';
import 'package:get/get.dart';

class MailboxListView extends StatelessWidget {
  const MailboxListView({Key? key}) : super(key: key);

  Future<Null> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.find<MailboxListController>().getMailboxList();
    return null;
  }

  Container _build(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 45),
              Image.network(
                'https://picsum.photos/seed/359/600',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 35),
              Column(
                children: [
                  Text(
                    Get.find<MailboxListController>()
                            .mailboxList
                            .value
                            .data?[index]
                            .nickname ??
                        '',
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    Get.find<MailboxListController>()
                        .mailboxList
                        .value
                        .data?[index]
                        .screenInfo ??
                        '',
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<MailboxListController>().isLoading.value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        );
      } else {
        if (Get.find<MailboxListController>().mailboxList.value.data != null) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: Scrollbar(
              interactive: true,
              radius: const Radius.circular(6),
              child: ListView.builder(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                itemCount: Get.find<MailboxListController>()
                    .mailboxList
                    .value
                    .data
                    ?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(index);
                    },
                    child: Column(
                      children: [
                        Get.find<MailboxListController>()
                                    .mailboxList
                                    .value
                                    .data?[index]
                                    .gotNew ??
                                false
                            ? Banner(
                                message: 'new_letter'.tr,
                                location: BannerLocation.topEnd,
                                child: _build(index),
                              )
                            : _build(index),
                        const SizedBox(height: 20)
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 35,
                ),
                const SizedBox(height: 20),
                Text(
                  'no_data'.tr,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          );
        }
      }
    });
  }
}
