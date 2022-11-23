import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as form_data;
import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/model/User.dart';
import 'package:get/get.dart';
import 'package:flutter_connected_mailbox/model/MailboxList.dart';

class DioUtil {
  late final Dio _dio;

  DioUtil()
      : _dio = Dio(BaseOptions(
            baseUrl: 'http://192.168.0.147:8080/api/',
            connectTimeout: 6000,
            receiveTimeout: 6000,
            responseType: ResponseType.json));

  Future<MailboxList> getMailboxList(String id) async {
    try {
      final response = await _dio.get('mailbox/$id');
      if (response.data['msg'] == 'success') {
        return mailboxListFromJson(response.data);
      } else {
        return MailboxList(data: null);
      }
    } on DioError {
      Get.defaultDialog(
          title: 'http_error_title'.tr,
          middleText: 'http_error'.tr,
          confirm:
              ElevatedButton(onPressed: Get.back, child: Text('confirm'.tr)));
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> login(String phone, String password) async {
    try {
      form_data.FormData data =
          form_data.FormData.fromMap({"phone": phone, "password": password});
      final response = await _dio.post("/user/login", data: data);
      if (response.data['msg'] == 'success') {
        return User.fromJson(response.data);
      } else {
        Get.defaultDialog(
            title: 'http_error_title'.tr,
            middleText: 'login_error'.tr,
            confirm:
                ElevatedButton(onPressed: Get.back, child: Text('confirm'.tr)));
        return User(data: null);
      }
    } on DioError {
      Get.defaultDialog(
          title: 'http_error_title'.tr,
          middleText: 'http_error'.tr,
          confirm:
              ElevatedButton(onPressed: Get.back, child: Text('confirm'.tr)));
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUserInfo(String id) async {
    try {
      final response = await _dio.get('user/$id');
      if (response.data['msg'] == 'success') {
        return User.fromJson(response.data);
      } else {
        return User(data: null);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateToken(String userId, String token) async {
    try {
      form_data.FormData data =
          form_data.FormData.fromMap({"userId": userId, "token": token});
      final response = await _dio.post("/user/updateToken", data: data);
      if (response.data['msg'] == 'success') {
        return true;
      }
      return false;
    } on DioError {
      Get.defaultDialog(
          title: 'http_error_title'.tr,
          middleText: 'http_error'.tr,
          confirm:
              ElevatedButton(onPressed: Get.back, child: Text('confirm'.tr)));
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> checkToken(String userId, String token) async {
    try {
      form_data.FormData data =
          form_data.FormData.fromMap({"userId": userId, "token": token});
      final response = await _dio.post("/user/checkToken", data: data);
      if (response.data['msg'] == 'success') {
        return response.data['data'];
      }
      return 'error';
    } on DioError {
      Get.defaultDialog(
          title: 'http_error_title'.tr,
          middleText: 'http_error'.tr,
          confirm:
              ElevatedButton(onPressed: Get.back, child: Text('confirm'.tr)));
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
