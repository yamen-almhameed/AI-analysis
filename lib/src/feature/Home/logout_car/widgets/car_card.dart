import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/UI/car_payment_detatils_screen.dart';

class CarCard extends StatelessWidget {
  final Map<String, dynamic> car;
  const CarCard({required this.car, super.key});

  String calculateOvertime(Map<String, dynamic> car) {
    try {
      final format = DateFormat("dd/MM/yyyy h:mm a");
      DateTime expireTime = format.parse(car['dateTimeExpireCar']);
      DateTime exitTime = format.parse(car['dateTimeExitCar']);

      if (exitTime.isAfter(expireTime)) {
        final difference = exitTime.difference(expireTime);
        int hours = difference.inHours;
        int minutes = difference.inMinutes % 60;
        return "$hours ساعات $minutes دقيقة";
      } else {
        return "لم يتجاوز الوقت";
      }
    } catch (e) {
      return "خطأ في التاريخ";
    }
  }

  Widget buildInfoRow(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 13),
        Flexible(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => CarPaymentDetailsScreen(carData: car)),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: car['gradient'],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: car['gradient'][0].withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoRow(
                        Icons.confirmation_number,
                        "${car['numberTicket'] ?? ''}",
                      ),
                      Text(
                        car['plateNumber'] ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        car['carType'] ?? '',
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      ),
                      buildInfoRow(Icons.person, "${car['ownerName'] ?? ''}"),
                      buildInfoRow(Icons.phone, "${car['phone'] ?? ''}"),
                      buildInfoRow(
                        Icons.login,
                        "${car['dateTimeEnterCar'] ?? ''}",
                      ),
                      SizedBox(height: 6),
                      buildInfoRow(
                        Icons.logout,
                        " ${car['dateTimeExitCar'] ?? ''}",
                      ),
                      SizedBox(height: 6),
                      Text(
                        "الوقت المتجاوز: ${calculateOvertime(car)}",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            buildInfoRow(
              Icons.vpn_key,
              " ${car['keyCar'] ?? ''}",
            ), //شيل كلمة املك مفتاح وخلي ايقونة مفتاح اذا معي بكون عادي اذا مش معي بكون عليه خط
            SizedBox(height: 6),
            buildInfoRow(Icons.location_on, "${car['locationKeyCar'] ?? ''}"),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
