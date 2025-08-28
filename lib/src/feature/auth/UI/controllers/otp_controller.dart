import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final int length = 4;

  late List<TextEditingController> otpControllers;
  late List<FocusNode> focusNodes;

  @override
  void onInit() {
    super.onInit();
    otpControllers = List.generate(length, (_) => TextEditingController());
    focusNodes = List.generate(length, (_) => FocusNode());
  }

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < length - 1) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
    update(); 
  }

  String get otp => otpControllers.map((c) => c.text).join();
}
