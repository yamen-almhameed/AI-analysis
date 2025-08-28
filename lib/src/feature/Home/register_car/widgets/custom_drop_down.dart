import 'package:flutter/material.dart';
import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?)? onChanged;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.hint,
    required this.items,
    this.selectedValue,
    this.onChanged,
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryText),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            dropdownColor: Colors.grey[900],
            decoration: const InputDecoration(border: InputBorder.none),
            hint: Text(
              hint,
              style: const TextStyle(color: Colors.white54),
              textAlign: TextAlign.right,
            ),
            style: const TextStyle(color: Colors.white),
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item, textAlign: TextAlign.right),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
