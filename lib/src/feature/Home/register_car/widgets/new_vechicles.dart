import 'package:ai_analysis/src/feature/Home/register_car/controller/reg_car_controller.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/user_form_fields.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/vehicle_type_filed.dart';
import 'package:flutter/material.dart';

class NewVehicleSection extends StatelessWidget {
  final RegCarController controller;
  const NewVehicleSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange.withOpacity(0.5)),
          ),
          //مشان تختار نوع السيارة او تضيف سيارة من عندك
          child: VehicleTypeField(controller: controller),
        ),
        const SizedBox(height: 20),
        //مشان تضيف بيانات السيارة الجديدة
        UserFormFields(controller: controller),
        //--------------------------------------------
        const SizedBox(height: 20),
      ],
    );
  }
}
