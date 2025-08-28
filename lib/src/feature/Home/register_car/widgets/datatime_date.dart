import 'package:ai_analysis/src/feature/Home/register_car/widgets/text_filed_custom.dart';
import 'package:flutter/material.dart';

class DatatimeDate extends StatelessWidget {
  final TextEditingController controller;

  const DatatimeDate({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (pickedTime != null) {
            final selectedDateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );

            // تنسيق النص
            controller.text =
                "${selectedDateTime.year}-${selectedDateTime.month.toString().padLeft(2, '0')}-${selectedDateTime.day.toString().padLeft(2, '0')} "
                "${selectedDateTime.hour.toString().padLeft(2, '0')}:${selectedDateTime.minute.toString().padLeft(2, '0')}";
          }
        }
      },
      child: IgnorePointer(
        child: CustomTextField(
          label: 'موعد القدوم',
          hint: 'اختر موعد القدوم',
          controller: controller,
        ),
      ),
    );
  }
}
