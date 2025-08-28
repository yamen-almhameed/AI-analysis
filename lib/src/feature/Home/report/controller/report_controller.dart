import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/feature/Home/report/UI/report_details_screen.dart';
import 'package:ai_analysis/src/feature/auth/data/model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  final RxString userName = 'أحمد جعفران'.obs;
  final RxString userRole = 'مدير النظام'.obs;
  final RxList<ReportItem> reportItems = <ReportItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadReportData();
  }

  void loadReportData() {
    reportItems.value = [
      ReportItem(
        title: 'خروج المركبات',
        count: 50,
        icon: Icons.directions_car_outlined,
        color: AppColors.primary,
      ),
      ReportItem(
        title: 'دخول المركبات',
        count: 50,
        icon: Icons.garage,
        color: AppColors.primary,
      ),
      ReportItem(
        title: 'عدد المركبات',
        count: 50,
        icon: Icons.car_rental,
        color: AppColors.primary,
      ),
      ReportItem(
        title: 'بيانات الخدمات',
        count: 50,
        icon: Icons.person,
        color: AppColors.secondary,
      ),
      ReportItem(
        title: 'عدد الخدمات الغير منجزة',
        count: 50,
        icon: Icons.person,
        color: AppColors.secondary,
      ),
      ReportItem(
        title: 'فيزا',
        count: 50,
        icon: Icons.credit_card,
        color: AppColors.accent,
      ),
      ReportItem(
        title: 'كاش',
        count: 50,
        icon: Icons.money,
        color: AppColors.green,
      ),
      ReportItem(
        title: 'سيارات Vip',
        count: 50,
        icon: Icons.star,
        color: AppColors.info,
      ),
      ReportItem(
        title: 'مركبات نقل',
        count: 50,
        icon: Icons.local_shipping,
        color: AppColors.dark,
      ),
      ReportItem(
        title: 'فان',
        count: 50,
        icon: Icons.airport_shuttle,
        color: AppColors.dark,
      ),
    ];
  }

  void onItemTap(ReportItem item) {
    Get.to(() => ReportDetailsScreen(reportItem: item));
  }
}
