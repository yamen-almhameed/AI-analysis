import 'package:ai_analysis/src/feature/account/presentaion/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDialog extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();

  EditDialog({super.key});

  Widget _buildEditField(
    String label,
    TextEditingController controllerText,
    IconData icon, {
    TextInputType? keyboardType,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controllerText,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          prefixIcon: Icon(icon, color: const Color(0xFFFF9F43)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF16213E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Center(
        child: Text(
          "تعديل البيانات",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildEditField("الاسم", controller.nameController, Icons.person),
            _buildEditField(
              "البريد الإلكتروني",
              controller.emailController,
              Icons.email,
            ),

            _buildEditField(
              "رقم الهاتف",
              controller.phoneController,
              Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            _buildEditField(
              "العنوان",
              controller.addressController,
              Icons.location_on,
            ),
            _buildEditField(
              "الراتب",
              controller.salaryController,
              Icons.monetization_on,
              keyboardType: TextInputType.number,
            ),
            _buildEditField(
              "المهام الخاصة",
              controller.tasksController,
              Icons.task_alt,
            ),
            _buildEditField("التخصص", controller.typeController, Icons.work),
            _buildEditField(
              "التقييم",
              controller.ratingController,
              Icons.star,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "إلغاء",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () async {
                  await controller.editProfile(4);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9F43),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("حفظ", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
