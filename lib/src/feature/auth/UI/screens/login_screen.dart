import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/auth/UI/controllers/login_controller.dart';
import 'package:ai_analysis/src/feature/auth/UI/screens/Forget_password.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/elevated_buttom_custom.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/phoneFiled.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/phone_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundPrimary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "login".tr,
                    style: AppTextStyling.font26W500TextInter,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "welcome".tr,
                    style: AppTextStyling.font16W500TextInter,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: 40),
                Image.asset('assets/rafiki.png', fit: BoxFit.contain),
                SizedBox(height: 20),
                CustomPhoneInput(
                  controller: controller.phoneController,
                  onChanged: (code, number) {
                    controller.countryCode = code;
                    controller.phone = number;
                  },
                ),
                SizedBox(height: 20),
                PhoneField(iconVisible: false),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => ForgetPassword());
                    },
                    child: Text(
                      "forgotPassword".tr,
                      style: AppTextStyling.font16W500TextInter.copyWith(
                        color: AppColors.primaryText,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryText,
                        decorationThickness: 0.4,
                      ),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryText,
                      ),
                    );
                  }
                  return ElevatedButtonCustom(
                    text: "Login".tr,
                    onPressed: () {
                      controller.login(
                        controller.countryCode, 
                        controller.phone,
                        controller.passwordController.text,
                      );
                    },
                  );
                }),
                SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "noAccount".tr,
                //       style: AppTextStyling.font16W500TextInter,
                //       textDirection: TextDirection.ltr,
                //       textAlign: TextAlign.right,
                //     ),
                //     SizedBox(width: 5),
                //     Text(
                //       "createAccount".tr,
                //       style: AppTextStyling.font16W500TextInter.copyWith(
                //         color: AppColors.primaryText,
                //         fontWeight: FontWeightHelper.bold,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
