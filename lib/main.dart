import 'package:ai_analysis/src/core/cache/shared_pref_helper.dart';
import 'package:ai_analysis/src/core/localization/app_translations.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/UI/logout_screen.dart';
import 'package:ai_analysis/src/feature/Home/register_car/Ui/register_for_car.dart';
import 'package:ai_analysis/src/feature/Home/register_car/Ui/register_for_car_data.dart';
import 'package:ai_analysis/src/feature/Home/report/UI/report_screen.dart';
import 'package:ai_analysis/src/feature/Home/search/UI/search.dart';
import 'package:ai_analysis/src/feature/Home/widgets/home_wrapper.dart';
import 'package:ai_analysis/src/feature/auth/UI/bindings/auth_binding.dart';
import 'package:ai_analysis/src/feature/auth/UI/screens/login_screen.dart';
import 'package:ai_analysis/src/feature/auth/UI/screens/new_password.dart';
import 'package:ai_analysis/src/feature/auth/UI/screens/otp_screen.dart';
import 'package:ai_analysis/src/feature/chat/UI/chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'dart:ui' as ui;

import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final deviceLocale = ui.window.locale;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: deviceLocale,
      fallbackLocale: const Locale('ar', 'en'),
      translations: AppTranslations(),
      initialRoute: checkIfUserSeenOnboarding(),
      getPages: [
        GetPage(
          name: '/LoginScreen',
          page: () => LoginScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/OtpScreen',
          page: () => OtpScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/NewPassword',
          page: () => NewPassword(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/HomeWrapper',
          page: () => HomeWrapper(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/registerCar',
          page: () => RegisterForCar(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/RegisterForCarData',
          page: () => RegisterForCarData(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/ChatListScreen',
          page: () => ChatListScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/LogOutCarsScreen',
          page: () => LogOutCarsScreen(),
          binding: AuthBinding(),
        ),
        GetPage(name: '/Search', page: () => Search(), binding: AuthBinding()),
        GetPage(
          name: '/ReportScreen',
          page: () => ReportScreen(),
          binding: AuthBinding(),
        ),
      ],
    );
  }
}

class StorageKeys {
  const StorageKeys._();
  static const String hasSeenOnboarding = 'has_seen_onboarding';
  static const String isLoggedIn = 'is_logged_in';
  static const String token = 'token';
  static const String user = 'user';
  static const String phone = 'phone';
  static const String rememberMe = 'remember_me';
  static const String email = 'email';
  static const String Language = 'Language';
  static const String userId = 'user_id';
  static const String notification = 'notification';
}

String checkIfUserSeenOnboarding() {
  String isLoggedIn = SharedPrefHelper.getString(StorageKeys.token).toString();
  if (isLoggedIn.isNotEmpty && isLoggedIn != 'null') {
    return '/HomeWrapper';
  }
  if (isLoggedIn.isEmpty || isLoggedIn == 'null') {
    return '/LoginScreen';
  } else {
    return '/LoginScreen';
  }
}
