import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentHeader extends StatelessWidget {
  const PaymentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF667eea), Color(0xFF764ba2)]),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Color(0xFF667eea).withOpacity(0.3), blurRadius: 10, offset: Offset(0,5))],
              ),
              child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 20),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('طريقة الدفع', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                Text('اختر طريقة الدفع المناسبة', style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.7))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
