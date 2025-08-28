import 'package:ai_analysis/src/feature/auth/UI/controllers/new_password_controller.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/elevated_buttom_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/phoneFiled.dart';

class NewPassword extends StatelessWidget {
  final NewPasswordController controller = Get.find<NewPasswordController>();
  NewPassword({super.key});

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'resetPassword'.tr,
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
                    'passwordNote'.tr,
                    style: TextStyle(fontSize: 16, color: AppColors.grey),
                  ),
                ),
                SizedBox(height: 20),
                PhoneField(
                  iconVisible: false,
                  onChanged: controller.updatePassword,
                  text: 'newPassword'.tr,
                ),
                SizedBox(height: 30),
                GetBuilder<NewPasswordController>(
                  builder: (_) {
                    int strength = controller.passwordStrength;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        Color color = AppColors.grey;
                        if (strength == -1) {
                          color = Colors.grey.shade300; // فارغة
                        } else if (index <= strength) {
                          if (strength == 0) {
                            color = Colors.red;
                          } else if (strength == 1)
                            color = Colors.orange;
                          else if (strength == 2)
                            color = Colors.green;
                        } else {
                          color = Colors.grey.shade300;
                        }

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 60,
                          height: 4,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      }),
                    );
                  },
                ),
                SizedBox(height: 40),
                ElevatedButtonCustom(
                  text: 'confirmPassword'.tr,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
