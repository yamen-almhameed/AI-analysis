import 'package:ai_analysis/src/feature/Home/logout_car/controller/logout_cars_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SearchSection extends StatelessWidget {
  final LogOutCarsController controller;
  const SearchSection({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
            ),
            child: TextField(
              controller: controller.searchController,
              onChanged: (_) => controller.performSearch(),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'البحث برقم اللوحة، اسم المالك، أو نوع السيارة...',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
                suffixIcon: controller.searchController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: controller.resetSearch,
                        child: Icon(Icons.clear, color: Colors.white.withOpacity(0.7)),
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () => controller.isAdvancedSearchExpanded.value =
                !controller.isAdvancedSearchExpanded.value,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF4facfe), Color(0xFF00f2fe)]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Icon(
                        controller.isAdvancedSearchExpanded.value
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: Colors.white,
                      )),
                  SizedBox(width: 8),
                  Text(
                    'البحث المتقدم',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
