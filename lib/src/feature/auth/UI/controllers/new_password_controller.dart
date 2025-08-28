import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NewPasswordController extends GetxController {
  String password = '';

  /// قوة كلمة المرور: 0 => ضعيفة، 1 => متوسطة، 2 => قوية
  int get passwordStrength {
    if (password.length >= 8 &&
        RegExp(r'(?=.*[A-Z])').hasMatch(password) &&
        RegExp(r'(?=.*[0-9])').hasMatch(password) &&
        RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(password)) {
      return 2; // قوية
    } else if (password.length >= 6) {
      return 1; // متوسطة
    } else if (password.isNotEmpty) {
      return 0; // ضعيفة
    } else {
      return -1; // فارغة
    }
  }

  void updatePassword(String value) {
    password = value;
    update();
  }
}
