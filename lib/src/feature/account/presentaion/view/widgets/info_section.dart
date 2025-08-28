import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/account/presentaion/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoSection extends StatelessWidget {
  final ProfileController controller;
  final VoidCallback onEdit;

  const InfoSection({
    super.key,
    required this.controller,
    required this.onEdit,
  });

  // دالة لتنسيق رقم الهاتف
  String formatPhoneNumber(String phone, String countryCode) {
    if (phone.isEmpty) return '';

    String digits = phone.replaceAll(RegExp(r'\D'), '');

    // إزالة الكود من الرقم إذا كان موجودًا في بداية الهاتف
    if (digits.startsWith(countryCode.replaceAll('+', ''))) {
      digits = digits.substring(countryCode.replaceAll('+', '').length);
    }
    return '$countryCode $digits';
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Text(
                  value,
                  style: AppTextStyling.font16W500TextInter.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (_) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF16213E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'المعلومات الشخصية',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    IconButton(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit, color: Colors.orange),
                    ),
                  ],
                ),
                const Divider(color: Colors.white24),
                _buildInfoRow(Icons.person, 'الاسم', controller.name.value),
                _buildInfoRow(Icons.email, 'البريد', controller.email.value),
                _buildInfoRow(
                  Icons.phone,
                  'الهاتف',
                  formatPhoneNumber(
                    controller.phone.value,
                    controller.countryCode.value,
                  ),
                ),
                _buildInfoRow(
                  Icons.location_on,
                  'العنوان',
                  controller.address.value,
                ),
                _buildInfoRow(
                  Icons.monetization_on,
                  'الراتب',
                  '${controller.salary} د.أ',
                ),
                _buildInfoRow(
                  Icons.task_alt,
                  'المهام',
                  controller.specialTasks.value,
                ),
                _buildInfoRow(
                  Icons.link,
                  'موقع العمل',
                  controller.locationUrl.value,
                ),
                _buildInfoRow(
                  Icons.policy,
                  'الأعدادت العامة',
                  controller.terms,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
