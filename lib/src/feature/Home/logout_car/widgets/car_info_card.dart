import 'package:flutter/material.dart';

class CarInfoCard extends StatelessWidget {
  final Map<String, dynamic> carData;
  const CarInfoCard({super.key, required this.carData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFFf093fb), Color(0xFFf5576c)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Color(0xFFf093fb).withOpacity(0.4), blurRadius: 20, offset: Offset(0, 10))],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/profile_image.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.white24,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('العميل: ${carData['ownerName']}', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Text('${carData['carType']}', style: TextStyle(color: Colors.white70, fontSize: 14)),
                Text('${carData['plateNumber']}', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}