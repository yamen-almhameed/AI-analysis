import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/Home/register_car/controller/reg_car_controller.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/checkbox.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/datatime_date.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/text_filed_custom.dart';
import 'package:flutter/material.dart';

class UserDisplayFields extends StatelessWidget {
  final RegCarController controller;
  const UserDisplayFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'اسم صاحب المركبة',
          hint: '',
          controller: controller.ownerController,
          onlyread: true,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: 'رقم الهاتف',
          hint: '',
          controller: controller.phoneController,
          onlyread: true,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: 'نوع السيارة',
          hint: '',
          controller: controller.vehicleTypeController,
          onlyread: true,
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryText.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'كيف عرف عن الموقع',
                style: AppTextStyling.font16W500TextInter.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 4),
              Text(
                controller.selectedSource.value.isEmpty
                    ? 'غير محدد'
                    : controller.selectedSource.value,
                style: AppTextStyling.font16W500TextInter,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: 'الملاحظات',
          hint: '',
          controller: controller.noteController,
          onlyread: false,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
