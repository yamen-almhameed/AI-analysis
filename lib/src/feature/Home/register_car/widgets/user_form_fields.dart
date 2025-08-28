import 'package:ai_analysis/src/feature/Home/register_car/controller/reg_car_controller.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/checkbox.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/custom_drop_down.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/datatime_date.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/text_filed_custom.dart';
import 'package:flutter/material.dart';

class UserFormFields extends StatelessWidget {
  final RegCarController controller;
  const UserFormFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'الاسم ثلاثي',
          hint: 'أحمد علي محمد',
          controller: controller.ownerController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: 'رقم الهاتف',
          hint: '079XXXXXXX',
          controller: controller.phoneController,
        ),
        const SizedBox(height: 20),
        CustomDropdown(
          label: 'كيف عرف عن الموقع؟',
          hint: 'اختر طريقة',
          items: controller.sourceOptions,
          selectedValue: controller.selectedSource.value.isEmpty
              ? null
              : controller.selectedSource.value,
          onChanged: (value) {
            controller.selectedSource.value = value ?? '';
          },
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: 'الملاحظات (اختياري)',
          hint: 'اكتب ملاحظاتك',
          controller: controller.noteController,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        ),
        const SizedBox(height: 20),
        AppCheckbox(
          value: controller.isServiceSelected,
          label: 'تريد خدمة الغسيل',
          onChanged: (controller.toggleServiceSelection),
        ),
      ],
    );
  }
}
