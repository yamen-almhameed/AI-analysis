import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';

class AdvancedSearchSection extends StatelessWidget {
  final dynamic controller;
  final bool? search;
  const AdvancedSearchSection({
    required this.controller,
    super.key,
    this.search = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: controller.isAdvancedSearchExpanded.value ? null : 0,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (search == true)
                  _buildTextField(
                    controller.ticketNumberController,
                    'رقم التذكرة',
                    Icons.confirmation_number,
                  ),
                SizedBox(height: 15),
                _buildTextField(
                  controller.plateNumberController,
                  'رقم المركبة',
                  Icons.directions_car,
                ),
                SizedBox(height: 15),
                _buildTextField(
                  controller.ownerNameController,
                  'اسم العميل',
                  Icons.person,
                ),
                SizedBox(height: 15),
                _buildDropdown(
                  controller.selectedCarType,
                  controller.carTypes,
                  'نوع المركبة',
                  Icons.directions_car,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: controller.resetSearch,
                        child: Text(
                          'إعادة تعيين',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white.withOpacity(0.8),
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.3),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController textController,
    String label,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextField(
        controller: textController,
        onChanged: (_) => controller.performSearch(),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.7)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    RxnString value,
    List<String> items,
    String label,
    IconData icon,
  ) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: DropdownButtonFormField<String>(
          value: value.value,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.7)),
            border: InputBorder.none,
          ),
          dropdownColor: Color(0xFF1A1A2E),
          style: TextStyle(color: Colors.white),
          items: [
            DropdownMenuItem(
              value: null,
              child: Text(
                'الكل',
                style: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
            ),
            ...items.map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
          onChanged: (val) {
            value.value = val;
            controller.performSearch();
          },
        ),
      ),
    );
  }
}
