import 'package:flutter/material.dart';

class PaymentFields extends StatelessWidget {
  final TextEditingController cashController;
  final TextEditingController visaController;
  final TextEditingController discountController; // إضافة الكنترولر لكود الخصم
  final VoidCallback onChanged;

  const PaymentFields({
    super.key,
    required this.cashController,
    required this.visaController,
    required this.discountController, // إضافة الكنترولر
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildField(
          controller: cashController,
          title: 'الدفع نقداً',
          icon: Icons.money,
          gradientColors: [Color(0xFF43e97b), Color(0xFF38f9d7)],
          onChanged: onChanged,
        ),
        SizedBox(height: 15),
        _buildField(
          controller: visaController,
          title: 'الدفع بالفيزا',
          icon: Icons.credit_card,
          gradientColors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
          onChanged: onChanged,
        ),
        SizedBox(height: 15),
        _buildField(
          controller: discountController, // هنا الكنترولر الجديد
          title: 'كود الخصم',
          icon: Icons.discount,
          gradientColors: [Color(0xFFffa726), Color(0xFFff7043)], // ألوان مختلفة
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String title,
    required IconData icon,
    required List<Color> gradientColors,
    required VoidCallback onChanged,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColors),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          TextField(
            controller: controller,
            onChanged: (_) => onChanged(),
            keyboardType: title == 'كود الخصم'
                ? TextInputType.text
                : TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
              hintText: title == 'كود الخصم' ? 'ادخل الكود هنا' : '0.00',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              suffixText: title == 'كود الخصم' ? null : 'دينار',
              suffixStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: gradientColors.first),
              ),
              contentPadding: EdgeInsets.all(20),
            ),
          ),
        ],
      ),
    );
  }
}
