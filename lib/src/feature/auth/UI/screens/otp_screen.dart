import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/auth/UI/bindings/auth_binding.dart';
import 'package:ai_analysis/src/feature/auth/UI/controllers/otp_controller.dart';
import 'package:ai_analysis/src/feature/auth/UI/screens/new_password.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/elevated_buttom_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();

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
                  'Check_the_phone'.tr,
                  style: AppTextStyling.font26W500TextInter,
                ),
              ),
              SizedBox(height: 40),
              Image.asset(
                'assets/amico.png',
                fit: BoxFit.contain,
                width: 270,
                height: 270,
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'otpSentMessage'.tr,
                  style: AppTextStyling.font16W500TextInter.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20),
              GetBuilder<OtpController>(
                builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: TextField(
                            controller: controller.otpControllers[index],
                            focusNode: controller.focusNodes[index],
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: AppColors.backGroundPrimary,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColors.primaryText,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColors.primaryText,
                                  width: 2,
                                ),
                              ),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1),
                            ],
                            onChanged: (value) =>
                                controller.onOtpChanged(value, index),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),

              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ElevatedButtonCustom(
                      text: 'resendCode'.tr,
                      onPressed: () {},
                      backgroundColor: AppColors.backGroundPrimary,
                      colortext: AppColors.primaryText,
                      fontSize: 14,
                    ),
                    SizedBox(height: 30),
                    ElevatedButtonCustom(
                      text: 'confirm'.tr,
                      onPressed: () {
                        Get.to(() => NewPassword(), binding: AuthBinding());
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
