import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/auth/UI/bindings/auth_binding.dart';
import 'package:ai_analysis/src/feature/auth/UI/screens/otp_screen.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/elevated_buttom_custom.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/phoneFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundPrimary,
        appBar: AppBar(
          backgroundColor: AppColors.backGroundPrimary,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.textWhite,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'titleforgotPassword'.tr,
                  style: AppTextStyling.font26W500TextInter,
                ),
              ),
              SizedBox(height: 40),
              Image.asset(
                'assets/bro.png',
                fit: BoxFit.contain,
                width: 270,
                height: 270,
              ),
              SizedBox(height: 20),
              Text(
                'pleaseEnterYourPhoneNumber'.tr,
                style: AppTextStyling.font16W500TextInter.copyWith(
                  color: AppColors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    PhoneField(iconVisible: true),
                    SizedBox(height: 40),
                    ElevatedButtonCustom(
                      text: "confirm".tr,
                      onPressed: () {
                        Get.to(() => OtpScreen(), binding: AuthBinding());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
