import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:flutter/material.dart';
import 'package:ai_analysis/src/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onChanged;
  final bool? onlyread;
  final ValueChanged<String>? onSubmitted;
  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.controller,
    this.contentPadding,
    this.onChanged,
    this.onlyread = false,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          readOnly: onlyread ?? false,
          onFieldSubmitted: onSubmitted,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.right, // لجعل النص داخل الحقل على اليمين
          decoration: InputDecoration(
            labelText: hint, // النص يظهر أعلى الحقل
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: AppTextStyling.font16W500TextInter.copyWith(
              color: Colors.white54,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryText),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryText, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          cursorColor: AppColors.primaryText,
        ),
      ],
    );
  }
}
