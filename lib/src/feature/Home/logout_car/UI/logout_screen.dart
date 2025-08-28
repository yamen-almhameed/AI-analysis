import 'package:ai_analysis/src/feature/Home/logout_car/controller/logout_cars_controller.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/advanced_search.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/car_card.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/header_widget.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/resualt_header.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/search_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LogOutCarsScreen extends StatelessWidget {
  LogOutCarsScreen({super.key});

  final controller = Get.put(LogOutCarsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F23),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HeaderWidget(title: 'تسجيل خروج المركبات'),
            ),
            SliverToBoxAdapter(child: SearchSection(controller: controller)),
            SliverToBoxAdapter(
              child: AdvancedSearchSection(controller: controller),
            ),
            SliverToBoxAdapter(child: ResultsHeader(controller: controller)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: Obx(
                () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        CarCard(car: controller.filteredCars[index]),
                    childCount: controller.filteredCars.length,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
