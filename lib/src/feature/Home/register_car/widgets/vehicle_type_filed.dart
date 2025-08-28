import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/Home/register_car/controller/reg_car_controller.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/checkbox.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class VehicleTypeField extends StatelessWidget {
  final RegCarController controller;
  const VehicleTypeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.addNewCar.value)
              CustomTextField(
                label: "أدخل اسم السيارة الجديدة",
                hint: "مثال: نيسان",
                controller: controller.vehicleTypeController,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    controller.addCarToList(value);
                    controller.addNewCar.value = false;
                  }
                },
              )
            else
              DropdownButton<String>(
                isExpanded: true,
                underline: Container(height: 1, color: AppColors.primaryText),
                hint: Text("اختر نوع السيارة",
                    style: AppTextStyling.font16W500TextInter),
                value: controller.uniqueCars.contains(
                        controller.vehicleTypeController.text)
                    ? controller.vehicleTypeController.text
                    : null,
                items: controller.uniqueCars
                    .map((car) => DropdownMenuItem(
                          value: car,
                          child: Text(car),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.vehicleTypeController.text = value ?? '';
                  controller.update();
                },
              ),
            AppCheckbox(
              value: controller.addNewCar.value,
              label: 'السيارة غير موجودة؟ أضف سيارة جديدة',
              onChanged: controller.toggleAddNewCar,
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}