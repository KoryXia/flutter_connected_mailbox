import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/model/MailboxList.dart';

class DioUtil {
  late final Dio _dio;

  DioUtil()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.0.147:8080/api/',
      connectTimeout: 10000,
      receiveTimeout: 10000,
      responseType: ResponseType.json
    )
  );

  Future<MailboxList> getMailboxList(String id) async {
    try{
      final response = await _dio.get('mailbox/$id');
      if(response.data['msg'] == 'success') {
        return mailboxListFromJson(response.data);
      } else{
        return MailboxList(data: null);
      }
    } on DioError catch (err) {
      Get.defaultDialog(
        title: 'http_error_title'.tr,
        content: Text('http_error'.tr),
        confirm: ElevatedButton(onPressed: Get.back, child: Text('confirm'.tr))
      );
      throw err.message;
    } catch(e) {
      throw e.toString();
    }
  }
}