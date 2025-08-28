import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomPhoneInput extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String countryCode, String phone) onChanged;
  final PhoneNumber? initialNumber;

  const CustomPhoneInput({
    super.key,
    required this.controller,
    required this.onChanged,
    this.initialNumber,
  });

  @override
  State<CustomPhoneInput> createState() => _CustomPhoneInputState();
}

class _CustomPhoneInputState extends State<CustomPhoneInput> {
  bool hasText = false;
  String countryCode = '+962'; // الافتراضي الأردن

  @override
  void initState() {
    super.initState();
    hasText = widget.controller.text.isNotEmpty;
    widget.controller.addListener(() {
      final newHasText = widget.controller.text.isNotEmpty;
      if (newHasText != hasText) {
        setState(() {
          hasText = newHasText;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Theme(
        data: theme.copyWith(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: isDark ? Colors.grey[900] : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              ),
            ),
          ),
        ),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            countryCode = number.dialCode ?? '+962';
            final phone = widget.controller.text;
            widget.onChanged(countryCode, phone);
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            showFlags: true,
            useEmoji: true,
            setSelectorButtonAsPrefixIcon: true,
            leadingPadding: 6,
            trailingSpace: false,
          ),
          countries: null,
          textFieldController: widget.controller,
          inputDecoration: InputDecoration(
            hintText: isArabic
                ? '0512333444 (10 أرقام فقط)'
                : '0512333444 (10 digits only)',
            counterText: '',
            hintStyle: AppTextStyling.font16W500TextInter.copyWith(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),

          autoValidateMode: AutovalidateMode.onUserInteraction,
          selectorTextStyle: TextStyle(
            fontSize: 16,
            color: AppColors.backGroundPrimary,
          ),

          formatInput: false,
          maxLength: 10,
          initialValue: widget.initialNumber ?? PhoneNumber(isoCode: 'JO'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return isArabic
                  ? 'يرجى إدخال رقم الهاتف'
                  : 'Please enter phone number';
            }
            if (value.length != 10) {
              return isArabic
                  ? 'يجب أن يحتوي الرقم على 10 خانات فقط'
                  : 'Phone number must be exactly 10 digits';
            }
            return null;
          },
        ),
      ),
    );
  }
}
