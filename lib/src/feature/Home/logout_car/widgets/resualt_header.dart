import 'package:ai_analysis/src/feature/Home/logout_car/controller/logout_cars_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ResultsHeader extends StatelessWidget {
  final LogOutCarsController controller;
  const ResultsHeader({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('المركبات المسجلة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF667eea), Color(0xFF764ba2)]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('${controller.filteredCars.length}',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              )),
        ],
      ),
    );
  }
}
