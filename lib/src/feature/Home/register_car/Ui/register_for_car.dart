import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/Home/register_car/controller/reg_car_controller.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/new_vechicles.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/setions_vehicles.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/text_filed_custom.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/checkbox.dart';
import 'package:ai_analysis/src/feature/Home/register_car/Ui/register_for_car_data.dart';
import 'package:ai_analysis/src/feature/Home/widgets/slider_animation.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/elevated_buttom_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterForCar extends StatelessWidget {
  const RegisterForCar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegCarController>();

    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F0F23)],
          ),
        ),
        child: SafeArea(
          child: GetBuilder<RegCarController>(
            builder: (_) => SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeSlideAnimation(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () => Get.back(),
                        ),
                        Text(
                          'تسجيل دخول المركبات',
                          style: AppTextStyling.font26W500TextInter.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Vehicle Number Field
                  FadeSlideAnimation(
                    child: CustomTextField(
                      label: 'رقم المركبة',
                      hint: '000 00 00',
                      controller: controller.vehicleNumberController,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // New / Existing Vehicle Section
                  if (controller.selectedVehicle != null)
                    FadeSlideAnimation(
                      child: ExistingVehicleSection(controller: controller),
                    )
                  else if (controller.vehicleNumberController.text.isNotEmpty)
                    FadeSlideAnimation(
                      child: NewVehicleSection(controller: controller),
                    ),
                  const SizedBox(height: 20),

                  // Checkboxes
                  FadeSlideAnimation(
                    child: Column(
                      children: [
                        AppCheckbox(
                          value: controller.hasCarKey,
                          label: 'لدي مفتاح السيارة',
                          onChanged: controller.toggleCarKey,
                        ),
                        AppCheckbox(
                          value: controller.hasRequest,
                          label: 'طلب مركبة نقل للعميل',
                          onChanged: controller.toggleRequest,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Submit Button
                  FadeSlideAnimation(
                    child: ElevatedButtonCustom(
                      text: controller.selectedVehicle == null
                          ? 'حفظ المركبة الجديدة'
                          : (controller.addNewUser.value
                                ? 'إضافة مستخدم جديد'
                                : 'تأكيد العملية'),
                      onPressed: () {
                        if (controller.selectedVehicle == null) {
                          if (controller.saveData()) {
                            Get.snackbar(
                              'نجح الحفظ',
                              'تم حفظ المركبة بنجاح',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );
                          }
                        } else {
                          if (controller.addNewUser.value) {
                            controller.addNewUserToVehicle();
                            Get.snackbar(
                              'نجح الإضافة',
                              'تم إضافة المستخدم بنجاح',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );
                          } else if (controller.selectedUser != null) {
                            Get.to(
                              RegisterForCarData(),
                              transition: Transition.fade,
                              duration: const Duration(milliseconds: 500),
                            );
                          }
                        }
                      },
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
