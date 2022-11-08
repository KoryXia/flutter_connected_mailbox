import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/controller/MailboxListController.dart';
import 'package:get/get.dart';

class MailboxListView extends StatelessWidget {
  const MailboxListView({Key? key}) : super(key: key);

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(microseconds: 500));
    Get.find<MailboxListController>().getMailboxList();
    return;
  }

  Builder _buildList(int index) {
    return Builder(
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: MediaQuery.of(context).platformBrightness == Brightness.light
                  ? Colors.white
                  : const Color(0XFF353535),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Colors.black45,
                  offset: Offset(0, 1),
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
                        const SizedBox(height: 20),
                        Get.find<MailboxListController>()
                                    .mailboxList
                                    .value
                                    .data?[index]
                                    .gotNew ??
                                false
                            ? Banner(
                                message: 'new_letter'.tr,
                                location: BannerLocation.topEnd,
                                child: _buildList(index),
                              )
                            : _buildList(index),
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
                ),
                TextButton(
                  onPressed: _onRefresh,
                  child: Text('refresh'.tr),
                )
              ],
            ),
          );
        }
      }
    });
  }
}
