import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_analysis/src/feature/auth/UI/controllers/login_controller.dart';

class PhoneField extends StatelessWidget {
  final bool iconVisible;
  final LoginController controller = Get.find();
  final ValueChanged<String>? onChanged;
  final String? text;
  PhoneField({super.key, this.iconVisible = false, this.onChanged, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text != null
              ? text!
              : (iconVisible ? "phoneNumber".tr : "password".tr),
          style: AppTextStyling.font16W500TextInter,
        ),
        const SizedBox(height: 8),
        GetBuilder(
          init: controller,
          builder: (_) => TextFormField(
            controller: iconVisible
                ? controller.phoneController
                : controller.passwordController,
            style: AppTextStyling.font16W500TextInter,
            keyboardType: iconVisible
                ? TextInputType.phone
                : TextInputType.text,
            obscureText: iconVisible ? false : controller.obscurePassword,
            decoration: InputDecoration(
              hintText: iconVisible ? '962+' : 'hintpassword'.tr,
              hintStyle: AppTextStyling.font16W500TextInter.copyWith(
                color: AppColors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primaryText),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primaryText),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.primaryText, width: 2),
              ),
              prefixIcon: iconVisible
                  ? SizedBox(
                      width: 90,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 4),
                          Transform.rotate(
                            angle: 270 * 3.1415927 / 180,
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: AppColors.grey,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            'assets/jordan.png',
                            fit: BoxFit.contain,
                            width: 30,
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                          Container(height: 20, width: 1, color: Colors.grey),
                          const SizedBox(width: 8),
                        ],
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 8),
                        Icon(Icons.password, color: AppColors.grey),
                        const SizedBox(width: 8),
                        Container(height: 20, width: 1, color: Colors.grey),
                        const SizedBox(width: 8),
                      ],
                    ),
              suffixIcon: iconVisible
                  ? null
                  : GestureDetector(
                      onTap: controller.togglePasswordVisibility,
                      child: Icon(
                        controller.obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.grey,
                      ),
                    ),

              prefixIconConstraints: const BoxConstraints(minWidth: 40),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
