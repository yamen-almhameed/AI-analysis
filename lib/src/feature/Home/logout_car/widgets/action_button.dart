import 'package:ai_analysis/src/feature/Home/logout_car/UI/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  final double totalAmount;
  final double walletBalance;
  final Map<String, dynamic> carData;

  const ActionButton({
    super.key,
    required this.totalAmount,
    required this.walletBalance,
    required this.carData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.to(
            () => PaymentMethodScreen(
              totalAmount: totalAmount,
              walletBalance: walletBalance,
              carData: carData,
            ),
          );
        },
        style:
            ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ).copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFf093fb), Color(0xFFf5576c)],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Center(
            child: Text(
              'متابعة للدفع',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
