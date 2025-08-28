import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/Home/search/widget/rating_notes_card.dart';
import 'package:ai_analysis/src/feature/Home/search/widget/service_status_card.dart';
import 'package:ai_analysis/src/feature/Home/search/widget/ticket_car.dart';
import 'package:ai_analysis/src/feature/Home/search/widget/ticket_info_card.dart';
import 'package:ai_analysis/src/feature/Home/search/widget/user_info_card_search.dart';
import 'package:ai_analysis/src/feature/auth/data/model/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsCar extends StatelessWidget {
  final Ticket ticket;
  const DetailsCar({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1A1A2E),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'تفاصيل المركبة',
            style: AppTextStyling.font16W500TextInter.copyWith(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(Icons.chat, color: Colors.white, size: 28),
              onPressed: () {
                Get.toNamed('/chatScreen');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              UserInfoCard(ticket: ticket),
              SizedBox(height: 10),
              TicketCar(ticket: ticket),
              ServiceStatusCard(ticket: ticket),
              SizedBox(height: 20),
              RatingNotesCard(ticket: ticket),
            ],
          ),
        ),
      ),
    );
  }
}
