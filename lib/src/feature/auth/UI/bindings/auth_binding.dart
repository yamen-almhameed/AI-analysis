import 'package:ai_analysis/src/feature/Home/controller/main_navigation_controller.dart';
import 'package:ai_analysis/src/feature/Home/register_car/controller/reg_car_controller.dart';
import 'package:ai_analysis/src/feature/Home/report/controller/report_controller.dart';
import 'package:ai_analysis/src/feature/Home/search/controller/search_controller.dart';
import 'package:ai_analysis/src/feature/auth/UI/controllers/new_password_controller.dart';
import 'package:ai_analysis/src/feature/auth/UI/controllers/otp_controller.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => NewPasswordController());
    Get.lazyPut(() => MainNavigationController());
    Get.lazyPut(() => RegCarController());
    Get.lazyPut(() => SearchControllers());
    Get.lazyPut(() => ReportController());
  }
}
