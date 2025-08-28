import 'dart:convert';
import 'dart:developer';

import 'package:ai_analysis/main.dart';
import 'package:ai_analysis/src/core/cache/shared_pref_helper.dart';
import 'package:ai_analysis/src/feature/Home/widgets/home_wrapper.dart';
import 'package:ai_analysis/src/core/network/apiclient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  bool obscurePassword = true;

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String countryCode = '';
  String phone = '';
  Future<void> login(String countryCode, String phone, String password) async {
    isLoading.value = true;
    try {
      log('Sending login request: country_code=$countryCode, phone=$phone');

      final response = await ApiClient.dio.post(
        'login',
        data: {
          'country_code': countryCode,
          'phone': phone,
          'password': password,
        },
      );
      log('Response: ${json.encode(response.data)}');
      if (response.statusCode == 200 && response.data['token'] != null) {
        String token = response.data['token'];
        await SharedPrefHelper.setData(StorageKeys.token, token);
        Get.snackbar("نجاح", "تم تسجيل الدخول");
        log('Login successful, token: $token');
        Get.to(HomeWrapper());
      } else {
        Get.snackbar("خطأ", response.data['message'] ?? "فشل تسجيل الدخول");
      }
    } catch (e) {
      Get.snackbar("خطأ", e.toString());
      log('Login error: $e');
    } finally {
      isLoading.value = false;
      phoneController.clear();
      passwordController.clear();
      update();
    }
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    update();
  }
}
