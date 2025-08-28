import 'package:ai_analysis/src/core/theme/app_colors.dart' show AppColors;
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/Home/register_car/controller/reg_car_controller.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/checkbox.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/user_display_fields.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/user_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ExistingVehicleSection extends StatelessWidget {
  final RegCarController controller;
  const ExistingVehicleSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.backGroundPrimary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primaryText.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مركبة موجودة',
                style: AppTextStyling.font16W500TextInter.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text('النوع: ${controller.selectedVehicle!.vehicleType}',
                  style: AppTextStyling.font16W500TextInter),
              Text(
                  'عدد المستخدمين: ${controller.selectedVehicle!.users.length}',
                  style: AppTextStyling.font16W500TextInter),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => Column(
            children: [
              AppCheckbox(
                value: controller.addNewUser.value,
                label: 'إضافة مستخدم جديد لهذه المركبة',
                onChanged: controller.toggleAddNewUser,
              ),
              const SizedBox(height: 10),
              if (!controller.addNewUser.value)
                DropdownButton<VehicleUser>(
                  isExpanded: true,
                  underline: Container(height: 1, color: AppColors.primaryText),
                  hint: Text("اختر المستخدم",
                      style: AppTextStyling.font16W500TextInter),
                  value: controller.selectedUser,
                  items: controller.selectedVehicle!.users
                      .map(
                        (user) => DropdownMenuItem<VehicleUser>(
                          value: user,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.owner,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(user.phone,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (user) {
                    if (user != null) controller.selectUser(user);
                  },
                )
              else
                UserFormFields(controller: controller),
            ],
          ),
        ),
        const SizedBox(height: 20),
        if (controller.selectedUser != null && !controller.addNewUser.value)
          UserDisplayFields(controller: controller),
      ],
    );
  }
}
