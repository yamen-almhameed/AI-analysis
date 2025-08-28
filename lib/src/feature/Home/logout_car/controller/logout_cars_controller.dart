import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LogOutCarsController extends GetxController {
  // Controllers للنصوص
  final TextEditingController searchController = TextEditingController();
  final TextEditingController plateNumberController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();

  // Rx variables للاختيارات
  var selectedCarType = RxnString();
  var isAdvancedSearchExpanded = false.obs;

  // القيم الثابتة للأنواع والألوان
  final List<String> carTypes = [
    'سيدان',
    'هاتشباك',
    'SUV',
    'شاحنة صغيرة',
    'حافلة صغيرة',
    'دراجة نارية',
  ];

  // بيانات السيارات
  final List<Map<String, dynamic>> registeredCars = [
    {
      'plateNumber': '67-12238',
      'dateTimeEnterCar': '31/01/2023 8:30 AM',
      'dateTimeExitCar': '31/01/2023 11:30 AM',
      'dateTimeExpireCar': '31/01/2023 12:00 AM',
      'numberTicket': '123456789',
      'ownerName': 'محمد أبو محمد',
      'carType': 'Mercedes2018',
      'keyCar': 'أملك مفتاح السيارة',
      'locationKeyCar': 'مكتب السيارة',
      'phone': '79 123 4567',
      'gradient': [Color(0xFF667eea), Color(0xFF764ba2)],
    },
    {
      'plateNumber': '89-45612',
      'dateTimeEnterCar': '31/01/2023 9:00 AM',
      'dateTimeExitCar': '31/01/2023 12:00 PM',
      'dateTimeExpireCar': '31/01/2023 11:30 AM',
      'numberTicket': '987654321',
      'ownerName': 'نور الدين محمد',
      'carType': 'Hyundai (2015)',
      'keyCar': 'أملك مفتاح السيارة',
      'locationKeyCar': 'مكتب الإدارة',
      'phone': ' 77 987 6543',
      'gradient': [Color(0xFFf093fb), Color(0xFFf5576c)],
    },
    {
      'plateNumber': '23-78945',
      'dateTimeEnterCar': '31/01/2023 1:00 PM',
      'dateTimeExitCar': '31/01/2023 2:30 PM',
      'dateTimeExpireCar': '31/01/2023 2:00 PM',
      'numberTicket': '456789123',
      'ownerName': 'أحمد صلاح أحمد',
      'carType': 'BMW (2010)',
      'keyCar': 'أملك مفتاح السيارة',
      'locationKeyCar': 'مكتب الاستقبال',
      'phone': '78 456 7890',
      'gradient': [Color(0xFF4facfe), Color(0xFF00f2fe)],
    },
  ];

  // قائمة السيارات بعد البحث أو التصفية
  var filteredCars = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredCars.assignAll(registeredCars);
  }

  // البحث
  void performSearch() {
    final searchText = searchController.text.toLowerCase();
    filteredCars.assignAll(
      registeredCars.where((car) {
        bool matchesPlate =
            plateNumberController.text.isEmpty ||
            car['plateNumber'].toLowerCase().contains(
              plateNumberController.text.toLowerCase(),
            );

        bool matchesOwner =
            ownerNameController.text.isEmpty ||
            car['ownerName'].toLowerCase().contains(
              ownerNameController.text.toLowerCase(),
            );

        bool matchesType =
            selectedCarType.value == null ||
            car['carType'].toLowerCase().contains(
              selectedCarType.value!.toLowerCase(),
            );

        bool matchesGeneral =
            searchText.isEmpty ||
            car['plateNumber'].toLowerCase().contains(searchText) ||
            car['ownerName'].toLowerCase().contains(searchText) ||
            car['carType'].toLowerCase().contains(searchText);

        return matchesPlate && matchesOwner && matchesType && matchesGeneral;
      }).toList(),
    );
  }

  void resetSearch() {
    searchController.clear();
    plateNumberController.clear();
    ownerNameController.clear();
    selectedCarType.value = null;
    filteredCars.assignAll(registeredCars);
  }

  // لحساب الوقت المتجاوز (overtime)
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
}
