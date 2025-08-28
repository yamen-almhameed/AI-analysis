import 'dart:developer';
import 'package:ai_analysis/src/core/network/apiclient.dart';
import 'package:ai_analysis/src/feature/auth/data/model/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchControllers extends GetxController {
  RxBool isAdvancedSearchExpanded = false.obs;
  TextEditingController plateNumberController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController ticketNumberController = TextEditingController();
  RxnString selectedCarType = RxnString();

  List<String> carTypes = ['Mercedes', 'BMW', 'Toyota', 'Honda'];
  List<Ticket> tickets = [];
  bool isLoading = false;
  List<Ticket> filteredTickets = [];

  @override
  void onInit() {
    super.onInit();
    getAllTickets();
    // ربط التحديث اللحظي عند الكتابة
    plateNumberController.addListener(performSearch);
    ownerNameController.addListener(performSearch);
    ticketNumberController.addListener(performSearch);
  }

  Future<void> getAllTickets({String sort = 'asc'}) async {
    isLoading = true;
    update();

    try {
      final res = await ApiClient.dio.get(
        '/tickets',
        queryParameters: {'sort': sort}, // إضافة ترتيب
      );

      if (res.statusCode == 200) {
        final data = res.data['data'];
        tickets = data.map<Ticket>((json) => Ticket.fromJson(json)).toList();
        filteredTickets = List<Ticket>.from(tickets);
      }
    } catch (e) {
      log("خطأ بجلب التذاكر: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  void performSearch({String sort = 'asc'}) {
    filteredTickets = tickets.where((ticket) {
      final plate = plateNumberController.text.toLowerCase();
      final owner = ownerNameController.text.toLowerCase();
      final ticketNum = ticketNumberController.text.toLowerCase();
      final type = selectedCarType.value?.toLowerCase();

      final matchesPlate =
          plate.isEmpty || ticket.vehicleNumber.toLowerCase().contains(plate);
      final matchesOwner =
          owner.isEmpty || ticket.clientName.toLowerCase().contains(owner);
      final matchesTicket =
          ticketNum.isEmpty ||
          ticket.ticketNumber.toLowerCase().contains(ticketNum);
      final matchesType =
          type == null || ticket.vehicleType.toLowerCase() == type;

      return matchesPlate && matchesOwner && matchesTicket && matchesType;
    }).toList();

    // ترتيب القائمة محليًا بعد البحث
    filteredTickets.sort(
      (a, b) => sort == 'asc'
          ? a.ticketNumber.compareTo(b.ticketNumber)
          : b.ticketNumber.compareTo(a.ticketNumber),
    );

    update();
  }

  void resetSearch() {
    plateNumberController.clear();
    ownerNameController.clear();
    ticketNumberController.clear();
    selectedCarType.value = null;
    filteredTickets = List<Ticket>.from(tickets);
    update();
  }
}
